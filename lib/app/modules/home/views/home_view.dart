import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/others/container_component.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/utils/mahas_server.dart';
import 'package:generalledger/app/utils/my_config.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyConfig.primaryColor,
        child: SafeArea(
          child: Container(
            color: MyConfig.backgroundColor,
            child: Column(
              children: [
                ContainerComponent(
                  color: MyConfig.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextComponent(
                            "General Ledger",
                            size: TextSize.h6,
                            muted: true,
                            fontWeight: FontWeight.w400,
                            color: MyConfig.primaryColorRevenge,
                          ),
                          Expanded(child: Container()),
                          TextComponent(
                            "versi ${MahasServer.packageInfo?.version ?? "0.0.0"}",
                            muted: true,
                            color: MyConfig.primaryColorRevenge,
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(7)),
                      TextComponent(
                        "User",
                        fontWeight: FontWeight.bold,
                        size: TextSize.h4,
                        color: MyConfig.primaryColorRevenge,
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Row(
                        children: [
                          TextComponent(
                            "Nama Usaha",
                            muted: true,
                            color: MyConfig.primaryColorRevenge,
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      color: MyConfig.primaryColor,
                      height: 50,
                    ),
                    Positioned(
                      child: ContainerComponent(
                        marginTop: 0,
                        marginBottom: 0,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: MyConfig.primaryColor.withOpacity(0.5),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              HomeHeaderMenuComponent(
                                icon: FontAwesome5.cart_arrow_down,
                                label: "Pengeluaran Tunai",
                                onTap: controller.pengeluaranTunaiOnTab,
                              ),
                              Container(
                                width: 1,
                                color: MyConfig.primaryColor.withOpacity(.2),
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                              ),
                              HomeHeaderMenuComponent(
                                icon: FontAwesome5.balance_scale,
                                label: "Neraca Saldo",
                                onTap: controller.neracaSaldoOnTab,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ContainerComponent(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              HomeMenuComponent(
                                icon: FontAwesome5.calculator,
                                label: 'Transaksi',
                                onTap: controller.transaksiOnTab,
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              HomeMenuComponent(
                                icon: FontAwesome5.rocket,
                                label: 'Akun',
                                onTap: controller.akunObTab,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(7)),
                        Expanded(
                          child: Row(
                            children: [
                              HomeMenuComponent(
                                icon: FontAwesome5.chart_line,
                                label: 'Laporan',
                                onTap: controller.laporanOnTab,
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              HomeMenuComponent(
                                icon: FontAwesome5.cog,
                                label: 'Pengaturan',
                                onTap: controller.pengaturanOnTab,
                              ),
                            ],
                          ),
                        ),
                      ],
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

class HomeMenuComponent extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback? onTap;

  const HomeMenuComponent({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: MyConfig.primaryColor.withOpacity(0.5),
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: MyConfig.primaryColor,
                size: 16,
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextComponent(
                label,
                muted: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeaderMenuComponent extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback? onTap;

  const HomeHeaderMenuComponent({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: MyConfig.primaryColor,
                size: 16,
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextComponent(
                label,
                muted: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
