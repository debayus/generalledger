import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/mahas/components/others/button_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/shimmer_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/models/api_result_model.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';
import 'package:get/get.dart';

class SetupPageController extends ChangeNotifier {
  final Function(dynamic)? urlApiGet;
  final Function()? urlApiPost;
  final Function(dynamic)? urlApiPut;
  final Function(dynamic)? urlApiDelete;
  final Function(dynamic)? setKey;
  final Function(dynamic)? getIdPost;
  final bool allowDelete;
  final bool allowEdit;
  final bool questionBack;
  final String? pageBack;
  final dynamic pageBackParametes;
  Function(VoidCallback fn)? setState;
  Function()? initState;

  Function()? onSubmit;
  Function(ApiResultModel)? onSuccessSubmit;
  dynamic id;
  bool isLoading = true;
  bool editable = false;
  dynamic model;
  bool backRefresh = false;
  bool Function()? isValid;
  String? title;
  Function(dynamic)? setModelApi;
  Function(dynamic)? setModelApiFormData;
  Function(dynamic)? setModelView;
  BuildContext? context;

  SetupPageController({
    this.urlApiGet,
    this.urlApiPost,
    this.urlApiPut,
    this.urlApiDelete,
    this.setKey,
    this.setModelView,
    this.setModelApi,
    this.isValid,
    this.allowDelete = true,
    this.allowEdit = true,
    this.questionBack = true,
    this.pageBack,
    this.pageBackParametes,
    this.setModelApiFormData,
    this.getIdPost,
  });

  void init({
    Function(VoidCallback fn)? setStateX,
    BuildContext? contextX,
    String? titleX,
  }) async {
    if (setStateX != null) {
      setState = setStateX;
    }
    if (contextX != null) {
      context = contextX;
    }
    if (titleX != null) {
      title = titleX;
    }
    setState!(() {
      isLoading = true;
    });
    if (initState != null) {
      await initState!();
    }
    dynamic idX = setKey != null ? setKey!(Get.parameters) : null;
    if (idX != null) {
      // detail state
      await getModelFromApi(idX);
    } else {
      // create state
      editable = true;
    }
    setState!(() {
      isLoading = false;
    });
  }

  Future getModelFromApi(dynamic idX) async {
    if (urlApiGet != null) {
      final r = await HttpApi.apiGet(urlApiGet!(idX));
      if (r.success) {
        id = idX;
        setState!(() {
          setModelView!(r.body);
        });
      } else {
        Helper.dialogShow(r.message!);
      }
    } else {
      setState!(() {
        setModelView!(idX);
      });
    }
  }

  void back() {
    Helper.backOnPress(
      result: backRefresh,
      page: pageBack!,
      editable: editable,
      questionBack: questionBack,
      parametes: pageBackParametes,
    );
  }

  Future<bool> onWillPop() async {
    if (!questionBack) return true;
    if (editable) {
      final r = await Helper.dialogQuestion(
        message: 'Are you sure you want to come back ?',
        submitText: 'Yes',
      );
      if (!r) return false;
    }
    if (backRefresh) {
      back();
      return false;
    } else {
      return true;
    }
  }

  void popupMenuButtonOnSelected(String v) async {
    if (v == 'Edit') {
      editable = true;
      setState!(() {});
    } else if (v == 'Cancel') {
      init();
      editable = false;
      setState!(() {});
    } else if (v == 'Delete') {
      final r = await Helper.dialogQuestion(
        message: 'Are you sure to delete this item ?',
        icon: FontAwesome5.trash,
        submitText: 'Delete',
      );
      if (r == true) {
        if (EasyLoading.isShow) return;
        await EasyLoading.show();
        final r = await HttpApi.apiDelete(urlApiDelete!(id));
        await EasyLoading.dismiss();
        if (r.success) {
          backRefresh = true;
          back();
        } else {
          Helper.dialogWarning(r.message!);
        }
      }
    }
  }

  void submitOnPressed() async {
    if (onSubmit != null) {
      onSubmit!();
    } else {
      if (EasyLoading.isShow) return;
      if (isValid != null) {
        if (!isValid!()) return;
      }
      final model = setModelApi != null ? setModelApi!(id) : null;
      // final formData =
      //     setModelApiFormData != null ? await setModelApiFormData!(id) : null;
      if (urlApiPost != null || urlApiPut != null) {
        await EasyLoading.show();
        final r = id == null
            ? await HttpApi.apiPost(
                urlApiPost!(),
                body: model,
                // formData: formData,
              )
            : await HttpApi.apiPut(
                urlApiPut!(id),
                body: model,
                // formData: formData,
              );
        await EasyLoading.dismiss();
        if (r.success) {
          if (onSuccessSubmit != null) {
            onSuccessSubmit!(r);
          } else {
            backRefresh = true;
            if (getIdPost != null) {
              id = getIdPost!(r.body);
            } else {
              id ??= r.body.runtimeType == int ? r.body : null;
            }
            // id ??=
            //     (ApiResultPostModel.fromDynamic(r.body!) as ApiResultPostModel)
            //         .id!;
            if (kIsWeb) {
              // final search = html.window.location.search ?? '';
              // final pathname = html.window.location.pathname ?? '';
              // if (!search.contains('id=')) {
              //   if (search.isNotEmpty) {
              //     html.window.history.pushState(
              //         null, title ?? "", pathname + search + '&id=$id');
              //   } else {
              //     html.window.history
              //         .pushState(null, title ?? "", pathname + '?id=$id');
              //   }
              // }
            }
            await getModelFromApi(id);
            editable = false;
          }
        } else {
          Helper.dialogWarning(r.message ?? "");
        }
      }
    }
  }
}

class SetupPageComponent extends StatefulWidget {
  final SetupPageController controller;
  final bool childrenPadding;
  final String title;
  final Widget? titleWidget;
  final Function children;
  final bool showAppBar;
  final dynamic crossAxisAlignmentChildren;
  final Function? titleFunction;
  final List<Widget>? childrenAfterButton;

  const SetupPageComponent({
    Key? key,
    this.title = "",
    required this.controller,
    this.childrenPadding = true,
    this.titleWidget,
    required this.children,
    this.childrenAfterButton,
    this.crossAxisAlignmentChildren = CrossAxisAlignment.center,
    this.titleFunction,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  State<SetupPageComponent> createState() => _SetupPageComponentState();
}

class _SetupPageComponentState extends State<SetupPageComponent> {
  @override
  void initState() {
    widget.controller
        .init(setStateX: setState, contextX: context, titleX: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.controller.onWillPop,
      child: Scaffold(
        appBar: !widget.showAppBar
            ? null
            : AppBar(
                title: widget.titleWidget ??
                    TextComponent(
                      widget.titleFunction != null
                          ? widget.titleFunction!()
                          : widget.title,
                      size: TextSize.h6,
                      color: MyConfig.primaryColorRevenge,
                    ),
                centerTitle: true,
                leading: widget.controller.pageBack != null
                    ? BackButton(
                        onPressed: widget.controller.back,
                      )
                    : null,
                actions: widget.controller.id == null ||
                        (!widget.controller.allowEdit &&
                            !widget.controller.allowDelete)
                    ? []
                    : [
                        PopupMenuButton(
                          onSelected:
                              widget.controller.popupMenuButtonOnSelected,
                          itemBuilder: (BuildContext context) {
                            List<PopupMenuItem<String>> r = [];
                            if (widget.controller.editable) {
                              r.add(PopupMenuItem(
                                value: 'Cancel',
                                child: TextComponent('Cancel',
                                    color: Colors.black),
                              ));
                            } else {
                              if (widget.controller.allowEdit) {
                                r.add(PopupMenuItem(
                                  value: 'Edit',
                                  child: TextComponent('Edit',
                                      color: Colors.black),
                                ));
                              }
                              if (widget.controller.allowDelete) {
                                r.add(PopupMenuItem(
                                  value: 'Delete',
                                  child: TextComponent('Delete',
                                      color: Colors.black),
                                ));
                              }
                            }
                            return r;
                          },
                        ),
                      ],
              ),
        body: Container(
          child: widget.controller.isLoading
              ? ShimmerComponent()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ContainerComponent(
                        marginLeft: widget.childrenPadding ? null : 0,
                        marginRight: widget.childrenPadding ? null : 0,
                        child: Column(
                          crossAxisAlignment: widget.crossAxisAlignmentChildren,
                          children: widget.children(),
                        ),
                      ),
                      Visibility(
                        visible: widget.controller.editable,
                        child: ContainerComponent(
                          marginTop: 0,
                          marginBottom: 0,
                          child: ButtonComponent(
                            marginBottom: 20,
                            onPressed: widget.controller.submitOnPressed,
                            child: TextComponent(
                              widget.controller.id == null ? 'Submit' : 'Save',
                              color: MyConfig.primaryColorRevenge,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.childrenAfterButton != null,
                        child: ContainerComponent(
                          marginTop: 0,
                          marginBottom: 0,
                          marginLeft: widget.childrenPadding ? null : 0,
                          marginRight: widget.childrenPadding ? null : 0,
                          child: Column(
                            children: widget.childrenAfterButton ?? [],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
