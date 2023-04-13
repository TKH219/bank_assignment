import 'package:flutter/material.dart';

import '../features/main_page/view/main_page_view.dart';
import '../features/sign_in/view/sign_in_view.dart';
import '../features/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static Map<String, WidgetBuilder> routes = {
    INITIAL : (context) => SplashPage(),
    Routes.SIGN_IN : (context) => SignInPage(),
    Routes.MAIN_PAGE : (context) => MainPage(),
  };
}
