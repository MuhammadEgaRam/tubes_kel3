import 'package:tubes_kel3/pages/logout.dart';
import 'package:tubes_kel3/pages/page_sign_up.dart';
import 'package:tubes_kel3/pages/page_sign_in.dart';
import 'package:flutter/material.dart';
import '../pages/settings.dart';
import '../pages/scan.dart';
import '../pages/profile.dart';
import '../pages/riwayatmodal.dart';
import '../pages/history_v1.dart';
import '../pages/detail_ktm.dart';
import '../pages/splashscreen.dart';
import '../data/data_detail.dart';
import '../models/item.dart';
import '../pages/tentang_kami.dart';
import '../pages/onboard_screen.dart';


class Routes {
  static const String splash = '/';
  static const String riwayat = '/riwayat';
  static const String detail_riwayat = '/riwayat/detail';
  static const String scan = '/scan';
  static const String detail_scan = '/scan/detail';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String setting = '/setting';
  static const String profile= '/profile';
  static const String aboutUs= '/about_us';
  static const String logout = '/logout';
  static const String OnboardingContent = '/onboard';
  

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    OnboardingContent: (context) => OnboardingScreen(),
    signUp: (context) => pageSignUp(),
    signIn: (context) => pageSignIn(),

    riwayat: (context) => HistoryV(),
    detail_riwayat: (context) => ModalRiwayat(),

    scan: (context) => ScanState(),
    detail_scan: (context) => DetailKtm(item: InitialData.items[0],),

    setting: (context) => Settings(),
    profile: (context) => ProfilePage(),
    aboutUs: (context) => TentangKami(),
    logout: (context) => LogoutPage(),

  };
}