import 'package:bank_assignment/routes/app_pages.dart';
import 'package:bank_assignment/theme/app_theme.dart';
import 'package:bank_assignment/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controllers/app_controller/bloc/app_controller_bloc.dart';
import 'controllers/app_controller/bloc/app_controller_state.dart';
import 'main.dart';
import 'widgets/list_scroll_behavior.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppControllerBloc()),
        ],
        child: BlocBuilder<AppControllerBloc, AppControllerState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: AppConstant.defaultScreenSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context , child) {
                return MaterialApp(
                  navigatorKey: navigatorKey,
                  builder: (context,child) {
                    return ScrollConfiguration(
                      behavior: ListScrollBehavior(),
                      child: child!,
                    );
                  },
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.lightTheme,
                  routes: AppPages.routes,
                  supportedLocales: state.supportedLocales,
                  localeListResolutionCallback: state.localeResolutionCallBack,
                  locale: state.locale,
                  title: AppConstant.AppName,
                  initialRoute: AppPages.INITIAL,
                  themeMode: state.themeMode,
                );
              },
            );
          },
        )
    );
  }

}