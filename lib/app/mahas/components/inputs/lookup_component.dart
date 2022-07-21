import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/others/button_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/divider_component.dart';
import 'package:generalledger/app/mahas/components/others/shimmer_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/models/api_result_list_model.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';

class LookupController<T> extends ChangeNotifier {
  Function(int, String)? urlApi;
  Function(dynamic)? setKeyItem;
  Function(dynamic)? fromDynamic;
  final Function(String)? fromJson;
  Function()? insertOnPress;
  Function()? insertFromListOnPress;
  Function()? openNew;
  Function(dynamic)? openEdit;
  dynamic activeKey;
  final bool multiple;

  LookupController({
    this.urlApi,
    this.setKeyItem,
    this.fromDynamic,
    this.insertOnPress,
    this.multiple = true,
    this.fromJson,
  });

  List<T> items = [];
  List<T> itemsSelected = [];
  T? itemsSelectedActive;
  T? model;
  Function(VoidCallback fn)? setState;
  bool withSetup = false;

  final listViewController = ScrollController();
  final filterController = InputTextController();
  bool isSetup = false;
  Function(dynamic)? setItemLabel;
  bool loadingBottom = false;
  bool isItemRefresh = false;
  int pageIndex = 0;
  int maxPage = 0;
  BuildContext? context;

  void clearItems() {
    items.clear();
    pageIndex = 0;
    maxPage = 0;
  }

  Future refreshItems() async {
    clearItems();
    await refreshBottom();
    FocusScope.of(context!).unfocus();
    setState!(() {});
  }

  Future refreshBottom({nextPage = false}) async {
    final itemsX = await getItems(nextPage: nextPage);
    if (itemsX != null) {
      items.addAll(itemsX);
    }
  }

  Future<List<T>?> getItems({nextPage = false}) async {
    if (urlApi == null) return [];
    if (!loadingBottom) {
      setState!(() {
        isItemRefresh = true;
      });
    }
    try {
      if (filterController.value.isNotEmpty) {}
      final pageIndexX = nextPage ? pageIndex + 1 : pageIndex;
      final filterX = filterController.value as String;
      final query = urlApi!(pageIndexX, filterX);
      final apiModel = await HttpApi.apiGet(query);
      final List<T> result = [];
      if (!loadingBottom) {
        setState!(() {
          isItemRefresh = false;
        });
      }
      if (apiModel.success) {
        ApiResultListModel listModel =
            ApiResultListModel.fromDynamic(apiModel.body);
        maxPage = listModel.maxPage!;
        pageIndex = pageIndexX;
        for (var i = 0; i < (listModel.datas ?? []).length; i++) {
          if (fromDynamic != null) {
            result.add(fromDynamic!(listModel.datas![i]));
          } else if (fromJson != null) {
            result.add(fromJson!(jsonEncode(listModel.datas![i])));
          }
        }
      } else {
        Helper.dialogWarning(apiModel.body!);
      }
      return result;
    } catch (ex) {
      Helper.dialogWarning('$ex');
      setState!(() {
        isItemRefresh = false;
      });
      return null;
    }
  }

  void init(Function(VoidCallback fn) setStateX, BuildContext contextX) {
    setState = setStateX;
    context = contextX;
    filterController.onEditingComplete = () => refreshItems();
    listViewController.addListener(() async {
      if (loadingBottom) return;
      final maxScroll = listViewController.position.maxScrollExtent;
      final currentScroll = listViewController.position.pixels;
      final delta = 0.0;
      if (maxScroll - currentScroll <= delta && pageIndex != maxPage) {
        loadingBottom = true;
        await refreshBottom(nextPage: true);
        loadingBottom = false;
      }
    });
    refreshItems();
  }

  Future<bool> backOnPressed() async {
    if (withSetup && isSetup && itemsSelectedActive != null) {
      setState!(() {
        isSetup = false;
      });
      return false;
    } else {
      return true;
    }
  }

  void itemOnTab(T e) {
    if (setKeyItem == null) {
      throw Exception("LookUp.setKeyItem must be required");
    }
    final item = itemsSelected
        .where((element) => setKeyItem!(element) == setKeyItem!(e));

    setState!(() {
      if (item.isEmpty) {
        if (!multiple) {
          itemsSelected = [];
        }
        if (withSetup) {
          isSetup = true;
          itemsSelectedActive = e;
          openNew!();
        } else {
          itemsSelected.add(e);
        }
      } else {
        if (!multiple) {
          insertFromListOnPress!();
        }
        itemsSelected.removeAt(itemsSelected
            .indexWhere((element) => setKeyItem!(element) == setKeyItem!(e)));
      }
    });
  }

  void close() {
    Navigator.pop(context!);
  }
}

class LookupComponent<T> extends StatefulWidget {
  final String? title;
  final LookupController<T> controller;
  final Function(T)? setItemLabel;
  final Widget Function(dynamic)? child;
  final Widget Function(dynamic)? setup;

  const LookupComponent({
    Key? key,
    this.title,
    required this.controller,
    this.setItemLabel,
    this.child,
    this.setup,
  }) : super(key: key);

  @override
  State<LookupComponent> createState() => _LookupComponentState();
}

class _LookupComponentState extends State<LookupComponent> {
  @override
  void initState() {
    widget.controller.init(setState, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.controller.backOnPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ""),
          centerTitle: true,
        ),
        body: StatefulBuilder(
          builder: (
            context,
            setState,
          ) =>
              widget.controller.isSetup
                  ? ContainerComponent(
                      child: Column(
                        children: [
                          widget.setup!(widget.controller.model),
                          ButtonComponent(
                            label: 'Insert',
                            onPressed: widget.controller.insertOnPress,
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        InputTextComponent(
                          borderRadius: Radius.zero,
                          placeHolder: 'Search',
                          marginBottom: 0,
                          controller: widget.controller.filterController,
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            color: MyConfig.primaryColor.shade800,
                            backgroundColor: MyConfig.primaryColor.shade600,
                            onRefresh: widget.controller.refreshItems,
                            child: widget.controller.isItemRefresh
                                ? ShimmerComponent()
                                : widget.controller.items.isEmpty &&
                                        !widget.controller.isItemRefresh
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesome5.box_open,
                                            color:
                                                MyConfig.primaryColor.shade600,
                                            size: 40,
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                          TextComponent("No Item Found"),
                                          Padding(padding: EdgeInsets.all(5)),
                                          TextButton(
                                            onPressed:
                                                widget.controller.refreshItems,
                                            child: TextComponent(
                                              "Refresh",
                                              color: Colors.lightBlue,
                                            ),
                                          )
                                        ],
                                      )
                                    : ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            DividerComponent(),
                                        controller: widget
                                            .controller.listViewController,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        itemCount:
                                            widget.controller.items.length + 1,
                                        itemBuilder: (context, index) {
                                          if (index ==
                                              widget.controller.items.length) {
                                            return Visibility(
                                              visible:
                                                  widget.controller.pageIndex !=
                                                          widget.controller
                                                              .maxPage &&
                                                      widget.controller.items
                                                          .isNotEmpty,
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: MyConfig
                                                        .primaryColor.shade600,
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              child: widget.child != null
                                                  ? widget.child!(widget
                                                      .controller.items[index])
                                                  : ListTile(
                                                      tileColor: widget
                                                              .controller
                                                              .itemsSelected
                                                              .where((element) =>
                                                                  widget.controller
                                                                          .setKeyItem!(
                                                                      element) ==
                                                                  widget
                                                                      .controller
                                                                      .setKeyItem!(widget
                                                                          .controller
                                                                          .items[
                                                                      index]))
                                                              .isEmpty
                                                          ? null
                                                          : MyConfig
                                                              .primaryColor
                                                              .shade400,
                                                      title: TextComponent(
                                                        widget.setItemLabel!(
                                                            widget.controller
                                                                .items[index]),
                                                      ),
                                                      onTap: () => widget
                                                          .controller
                                                          .itemOnTab(widget
                                                              .controller
                                                              .items[index]),
                                                    ),
                                            );
                                          }
                                        },
                                      ),
                          ),
                        ),
                        ButtonComponent(
                          borderRadius: Radius.zero,
                          label: 'Insert',
                          onPressed: widget.controller.insertFromListOnPress,
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
