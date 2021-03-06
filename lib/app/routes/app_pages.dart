import 'package:get/get.dart';

import '../modules/akun/bindings/akun_binding.dart';
import '../modules/akun/views/akun_view.dart';
import '../modules/akun_setup/bindings/akun_setup_binding.dart';
import '../modules/akun_setup/views/akun_setup_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan/bindings/laporan_binding.dart';
import '../modules/laporan/views/laporan_view.dart';
import '../modules/laporan_neraca_saldo/bindings/laporan_neraca_saldo_binding.dart';
import '../modules/laporan_neraca_saldo/views/laporan_neraca_saldo_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_register/bindings/login_register_binding.dart';
import '../modules/login_register/views/login_register_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/settings_account/bindings/settings_account_binding.dart';
import '../modules/settings_account/views/settings_account_view.dart';
import '../modules/settings_changeemail/bindings/settings_changeemail_binding.dart';
import '../modules/settings_changeemail/views/settings_changeemail_view.dart';
import '../modules/settings_changepassword/bindings/settings_changepassword_binding.dart';
import '../modules/settings_changepassword/views/settings_changepassword_view.dart';
import '../modules/settings_deleteaccount/bindings/settings_deleteaccount_binding.dart';
import '../modules/settings_deleteaccount/views/settings_deleteaccount_view.dart';
import '../modules/settings_master_data/bindings/settings_master_data_binding.dart';
import '../modules/settings_master_data/views/settings_master_data_view.dart';
import '../modules/settings_master_data_akun_laba_rugi/bindings/settings_master_data_akun_laba_rugi_binding.dart';
import '../modules/settings_master_data_akun_laba_rugi/views/settings_master_data_akun_laba_rugi_view.dart';
import '../modules/settings_master_data_konsep_akun/bindings/settings_master_data_konsep_akun_binding.dart';
import '../modules/settings_master_data_konsep_akun/views/settings_master_data_konsep_akun_view.dart';
import '../modules/settings_master_data_konsep_akun_setup/bindings/settings_master_data_konsep_akun_setup_binding.dart';
import '../modules/settings_master_data_konsep_akun_setup/views/settings_master_data_konsep_akun_setup_view.dart';
import '../modules/settings_master_data_kontak/bindings/settings_master_data_kontak_binding.dart';
import '../modules/settings_master_data_kontak/views/settings_master_data_kontak_view.dart';
import '../modules/settings_master_data_kontak_setup/bindings/settings_master_data_kontak_setup_binding.dart';
import '../modules/settings_master_data_kontak_setup/views/settings_master_data_kontak_setup_view.dart';
import '../modules/settings_master_data_proyek/bindings/settings_master_data_proyek_binding.dart';
import '../modules/settings_master_data_proyek/views/settings_master_data_proyek_view.dart';
import '../modules/settings_master_data_proyek_setup/bindings/settings_master_data_proyek_setup_binding.dart';
import '../modules/settings_master_data_proyek_setup/views/settings_master_data_proyek_setup_view.dart';
import '../modules/settings_master_data_struktur_akun/bindings/settings_master_data_struktur_akun_binding.dart';
import '../modules/settings_master_data_struktur_akun/views/settings_master_data_struktur_akun_view.dart';
import '../modules/settings_master_data_struktur_akun_setup/bindings/settings_master_data_struktur_akun_setup_binding.dart';
import '../modules/settings_master_data_struktur_akun_setup/views/settings_master_data_struktur_akun_setup_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/transaksi_view.dart';
import '../modules/transaksi_jurnal_manual/bindings/transaksi_jurnal_manual_binding.dart';
import '../modules/transaksi_jurnal_manual/views/transaksi_jurnal_manual_view.dart';
import '../modules/transaksi_jurnal_manual_setup/bindings/transaksi_jurnal_manual_setup_binding.dart';
import '../modules/transaksi_jurnal_manual_setup/views/transaksi_jurnal_manual_setup_view.dart';
import '../modules/transaksi_pengeluaran_tunai/bindings/transaksi_pengeluaran_tunai_binding.dart';
import '../modules/transaksi_pengeluaran_tunai/views/transaksi_pengeluaran_tunai_view.dart';
import '../modules/xsample/bindings/xsample_binding.dart';
import '../modules/xsample/views/xsample_view.dart';
import '../modules/xsample_checkbox_radio/bindings/xsample_checkbox_radio_binding.dart';
import '../modules/xsample_checkbox_radio/views/xsample_checkbox_radio_view.dart';
import '../modules/xsample_date_time/bindings/xsample_date_time_binding.dart';
import '../modules/xsample_date_time/views/xsample_date_time_view.dart';
import '../modules/xsample_drop_down/bindings/xsample_drop_down_binding.dart';
import '../modules/xsample_drop_down/views/xsample_drop_down_view.dart';
import '../modules/xsample_input/bindings/xsample_input_binding.dart';
import '../modules/xsample_input/views/xsample_input_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_REGISTER,
      page: () => LoginRegisterView(),
      binding: LoginRegisterBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_ACCOUNT,
      page: () => SettingsAccountView(),
      binding: SettingsAccountBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_CHANGEEMAIL,
      page: () => SettingsChangeemailView(),
      binding: SettingsChangeemailBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_CHANGEPASSWORD,
      page: () => SettingsChangepasswordView(),
      binding: SettingsChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_DELETEACCOUNT,
      page: () => SettingsDeleteaccountView(),
      binding: SettingsDeleteaccountBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
      children: [
        GetPage(
          name: _Paths.SETTINGS,
          page: () => SettingsView(),
          binding: SettingsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => TransaksiView(),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.AKUN,
      page: () => AkunView(),
      binding: AkunBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN,
      page: () => LaporanView(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI_PENGELUARAN_TUNAI,
      page: () => TransaksiPengeluaranTunaiView(),
      binding: TransaksiPengeluaranTunaiBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_NERACA_SALDO,
      page: () => LaporanNeracaSaldoView(),
      binding: LaporanNeracaSaldoBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA,
      page: () => SettingsMasterDataView(),
      binding: SettingsMasterDataBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_PROYEK,
      page: () => SettingsMasterDataProyekView(),
      binding: SettingsMasterDataProyekBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_PROYEK_SETUP,
      page: () => SettingsMasterDataProyekSetupView(),
      binding: SettingsMasterDataProyekSetupBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_KONTAK,
      page: () => SettingsMasterDataKontakView(),
      binding: SettingsMasterDataKontakBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_KONTAK_SETUP,
      page: () => SettingsMasterDataKontakSetupView(),
      binding: SettingsMasterDataKontakSetupBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_STRUKTUR_AKUN,
      page: () => SettingsMasterDataStrukturAkunView(),
      binding: SettingsMasterDataStrukturAkunBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_KONSEP_AKUN,
      page: () => SettingsMasterDataKonsepAkunView(),
      binding: SettingsMasterDataKonsepAkunBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_AKUN_LABA_RUGI,
      page: () => SettingsMasterDataAkunLabaRugiView(),
      binding: SettingsMasterDataAkunLabaRugiBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_STRUKTUR_AKUN_SETUP,
      page: () => SettingsMasterDataStrukturAkunSetupView(),
      binding: SettingsMasterDataStrukturAkunSetupBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_MASTER_DATA_KONSEP_AKUN_SETUP,
      page: () => SettingsMasterDataKonsepAkunSetupView(),
      binding: SettingsMasterDataKonsepAkunSetupBinding(),
    ),
    GetPage(
      name: _Paths.AKUN_SETUP,
      page: () => AkunSetupView(),
      binding: AkunSetupBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI_JURNAL_MANUAL,
      page: () => TransaksiJurnalManualView(),
      binding: TransaksiJurnalManualBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI_JURNAL_MANUAL_SETUP,
      page: () => TransaksiJurnalManualSetupView(),
      binding: TransaksiJurnalManualSetupBinding(),
    ),
    GetPage(
      name: _Paths.XSAMPLE,
      page: () => const XsampleView(),
      binding: XsampleBinding(),
    ),
    GetPage(
      name: _Paths.XSAMPLE_INPUT,
      page: () => const XsampleInputView(),
      binding: XsampleInputBinding(),
    ),
    GetPage(
      name: _Paths.XSAMPLE_CHECKBOX_RADIO,
      page: () => const XsampleCheckboxRadioView(),
      binding: XsampleCheckboxRadioBinding(),
    ),
    GetPage(
      name: _Paths.XSAMPLE_DATE_TIME,
      page: () => const XsampleDateTimeView(),
      binding: XsampleDateTimeBinding(),
    ),
    GetPage(
      name: _Paths.XSAMPLE_DROP_DOWN,
      page: () => const XsampleDropDownView(),
      binding: XsampleDropDownBinding(),
    ),
  ];
}
