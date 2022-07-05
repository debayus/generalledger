import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/models/akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:get/get.dart';
import 'package:tree_view/tree_view.dart';

class AkunController extends GetxController {
  final listCon = ListPageController<AkunModel>(
    urlApi: (pageIndex, filter) => '/api/akun?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => AkunModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.AKUN_SETUP,
    pageBack: Routes.HOME,
  );

  var list = RxList<Widget>([]);
  List<AkunModel> akuns = [];

  List<Widget> getChild(AkunModel? akun) {
    var ak = akun == null
        ? akuns.where((e) => e.level == 1)
        : akuns.where(
            (e) => e.no!.indexOf(akun.no!) == 0 && e.level == akun.level! + 1);
    if (ak.isEmpty) return [];
    return ak.map(
      (e) {
        var hasChild = akuns
            .where((f) => f.no!.indexOf(e.no!) == 0 && f.level == e.level! + 1)
            .isNotEmpty;
        return TreeViewChild(
          startExpanded: true,
          onTap: () => false,
          parent: Padding(
            padding: EdgeInsets.only(left: ((e.level! - 1) * 15).toDouble()),
            child: Card(
              child: ListTile(
                tileColor:
                    hasChild ? MyConfig.fontColor.withOpacity(.05) : null,
                title: TextComponent(
                  '${e.no} - ${e.nama}',
                ),
                trailing: PopupMenuButton(
                  iconSize: 16,
                  onSelected: (v) => popupMenuButtonOnSelected(v, e),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Tambah Detail',
                      child: TextComponent('Tambah Detail',
                          color: MyConfig.fontColor),
                    ),
                    PopupMenuItem(
                      value: 'Lihat',
                      child: TextComponent('Lihat', color: MyConfig.fontColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          children: getChild(e),
        );
      },
    ).toList();
  }

  void refreshItems() async {
    final r = await HttpApi.apiGet('/api/akunAll');
    if (r.success) {
      akuns = (r.body['akuns'] as List<dynamic>)
          .map((e) => AkunModel.fromDynamic(e) as AkunModel)
          .toList();
      var widgets = getChild(null);
      list.clear();
      list.addAll(widgets);
      list.refresh();
    } else {
      Helper.dialogWarning(r.message);
    }
  }

  void addOnTab({AkunModel? akun}) {
    Helper.toNamed(
      Routes.AKUN_SETUP,
      arguments: {
        'back': true,
      },
      parameters: akun == null
          ? null
          : {
              'akunHeader': '${akun.id}',
            },
    )?.then((value) {
      if (value == true) {
        refreshItems();
      }
    });
  }

  void popupMenuButtonOnSelected(String v, AkunModel e) async {
    if (v == 'Lihat') {
      Helper.toNamed(
        Routes.AKUN_SETUP,
        parameters: {'id': '${e.id}'},
        arguments: {'back': true},
      )?.then((value) {
        refreshItems();
      });
    } else if (v == 'Tambah Detail') {
      addOnTab(akun: e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshItems();
  }
}
