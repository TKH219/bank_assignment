import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';
import 'app_helper/app_bloc_observer.dart';
import 'controllers/share_helper.dart';

@injectable
GlobalKey<NavigatorState> navigatorKey = GlobalKey();

BuildContext get appContext => navigatorKey.currentContext!;

ThemeData appTheme([BuildContext? context]) => Theme.of(context ?? appContext);

Size appSize([BuildContext? context]) => MediaQuery.of(context ?? appContext).size;

Future goToPage(String routeName, {dynamic arguments}) async =>
    await navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);

Future goAndReplacePage(String routeName, {dynamic arguments}) async =>
    await navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);

Future goAndRemoveAllPages(String routeName, {dynamic arguments}) async => await navigatorKey.currentState!
    .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: arguments);

void backPage([dynamic result]) => navigatorKey.currentState!.pop(result);

RouteSettings settings(BuildContext context) => ModalRoute.of(context)!.settings;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      // ..maxConnectionsPerHost = 2
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await ShareHelper.init();
  await ScreenUtil.ensureScreenSize();
  // configureInjection();
  runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();
      runApp(const App());
    },
    (error, stackTrace) async {
      log(error.runtimeType.toString());
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
