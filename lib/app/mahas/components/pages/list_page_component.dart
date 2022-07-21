import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/others/divider_component.dart';
import 'package:generalledger/app/mahas/components/others/shimmer_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/models/api_result_list_model.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';
import 'package:get/get.dart';

class ListPageController<T> {
  final Function(int, String)? urlApi;
  final String? page;
  final dynamic pageParameters;
  final Function(T)? getId;
  final Function(dynamic)? fromDynamic;
  final Function(String)? fromJson;
  final bool allowAdd;
  final bool allowSearch;
  final bool allowDetail;
  final listViewController = ScrollController();
  final filterController = InputTextController();
  final List<T> items = [];
  Function(VoidCallback fn)? setState;
  final String? pageBack;
  final dynamic pageBackParametes;

  ListPageController({
    this.urlApi,
    this.page,
    this.pageParameters,
    this.getId,
    this.fromDynamic,
    this.allowAdd = true,
    this.allowSearch = true,
    this.allowDetail = true,
    this.pageBack,
    this.pageBackParametes,
    this.fromJson,
  });

  bool loadingBottom = false;
  bool isItemRefresh = true;
  int pageIndex = 0;
  int maxPage = 0;

  void clearItems() {
    items.clear();
    pageIndex = 0;
    maxPage = 0;
  }

  Future refreshItems() async {
    clearItems();
    await refreshBottom();
    Get.focusScope?.unfocus();
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
    if (!nextPage) {
      setState!(() {
        isItemRefresh = true;
      });
    }
    try {
      if (filterController.value.isNotEmpty) {}
      var pageIndexX = nextPage ? pageIndex + 1 : pageIndex;
      final filterX = filterController.value;
      final query = urlApi!(pageIndexX + 1, filterX);
      final apiModel = await HttpApi.apiGet(query);
      final List<T> result = [];
      setState!(() {
        isItemRefresh = false;
      });
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
        Helper.dialogWarning(apiModel.message ?? "");
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

  void addOnTab() {
    Helper.toNamed(
      page!,
      parameters: pageParameters,
      arguments: {'back': true},
    )?.then((value) {
      if (value == true) {
        refreshItems();
      }
    });
  }

  void itemOnTab(T e) {
    final param = getId!(e);
    Helper.toNamed(
      page!,
      parameters: {
        ...param,
        ...(pageParameters ?? {}),
      },
      arguments: {'back': true},
    )?.then((value) {
      if (value == true) {
        refreshItems();
      }
    });
  }

  void init(Function(VoidCallback fn) setStateX) {
    setState = setStateX;
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
}

class ListPageComponent<T> extends StatefulWidget {
  final ListPageController<T> controller;
  final String title;
  final Function(T)? getTitle;
  final Widget Function(T)? child;
  final bool allowMenuAction;
  final List<Widget>? listMenuAction;

  const ListPageComponent(
      {Key? key,
      required this.controller,
      this.title = "",
      this.getTitle,
      this.child,
      this.allowMenuAction = false,
      this.listMenuAction})
      : super(key: key);

  @override
  State<ListPageComponent<T>> createState() => _ListPageComponentState<T>();
}

class _ListPageComponentState<T> extends State<ListPageComponent<T>> {
  @override
  void initState() {
    widget.controller.init(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: widget.controller.pageBack != null
            ? BackButton(
                onPressed: () => Helper.backOnPress(
                  page: widget.controller.pageBack!,
                  parametes: widget.controller.pageBackParametes,
                ),
              )
            : null,
        actions: widget.allowMenuAction ? widget.listMenuAction : null,
      ),
      body: Column(
        children: [
          Visibility(
            visible: widget.controller.allowSearch,
            child: InputTextComponent(
              borderRadius: Radius.zero,
              placeHolder: 'Search',
              marginBottom: 0,
              controller: widget.controller.filterController,
            ),
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
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesome5.box_open,
                                color: MyConfig.primaryColor.shade600,
                                size: 40,
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              TextComponent("No Item Found"),
                              Padding(padding: EdgeInsets.all(5)),
                              TextButton(
                                onPressed: widget.controller.refreshItems,
                                child: TextComponent(
                                  "Refresh",
                                  color: Colors.lightBlue,
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              DividerComponent(),
                          controller: widget.controller.listViewController,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: widget.controller.items.length + 1,
                          itemBuilder: (context, index) {
                            if (index == widget.controller.items.length) {
                              return Visibility(
                                visible: widget.controller.pageIndex !=
                                        widget.controller.maxPage &&
                                    widget.controller.items.isNotEmpty,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: MyConfig.primaryColor.shade600,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                child: widget.child != null
                                    ? widget
                                        .child!(widget.controller.items[index])
                                    : ListTile(
                                        title: TextComponent(
                                          widget.getTitle!(
                                              widget.controller.items[index]),
                                        ),
                                        onTap: widget.controller.allowDetail
                                            ? () => widget.controller.itemOnTab(
                                                widget.controller.items[index])
                                            : null,
                                      ),
                              );
                            }
                          },
                        ),
            ),
          )
        ],
      ),
      floatingActionButton: widget.controller.allowAdd
          ? FloatingActionButton(
              onPressed: () => widget.controller.addOnTab(),
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
