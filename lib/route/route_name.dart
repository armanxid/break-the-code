import 'package:breakthecode/pages/AboutPage.dart';
import 'package:breakthecode/pages/HomeScreen.dart';
import 'package:breakthecode/pages/SplashScreen.dart';
import 'package:breakthecode/pages/loginscreen.dart';
import 'package:breakthecode/route/page_routes.dart';
import 'package:get/get.dart';

class pageRouteApp {
  static final pages = [
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen()),
    GetPage(name: RouteName.loginPage, page: () => LoginScreen()),
    GetPage(name: RouteName.homePage, page: () => HomeScreen()),
    GetPage(name: RouteName.aboutPage, page: () => AboutPage())
  ];
}
