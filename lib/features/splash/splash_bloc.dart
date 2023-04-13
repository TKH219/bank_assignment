import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/connectivity_helper.dart';
import '../../main.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_color.dart';
import '../../widgets/default_dialog.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  int dataLoaded = 0,needData = 1;

  SplashBloc() : super(SplashState()){
    on<InitSplashEvent>(init);
  }

  Future<void> init(InitSplashEvent event, Emitter<SplashState> emit,) async {
    state.init();
    ConnectivityHelper.listen(listen: (bool result) async {
      if(result){
        getAppCurrencies();
      }
    });
  }

  @override
  Future<void> close() {
    ConnectivityHelper.closeListen();
    return super.close();
  }

  Future getAppCurrencies() async {
    await Future.delayed(Duration(seconds: 1,)).then((value) {
      goNext();
    });
  }


  void goNext(){
    goAndRemoveAllPages(Routes.SIGN_IN);
    // if(dataLoaded>=needData) {
    //   if(state.auth!=null) {
    //     goAndRemoveAllPages(Routes.MAIN_PAGE);
    //   } else {
    //     goAndRemoveAllPages(Routes.SIGN_IN);
    //   }
    // }
  }

  void showMaintainMessage(){
    showDialog<void>(
      context: appContext,
      barrierDismissible: false,
      builder: (dialogContext) {
        return DefaultDialog(
          title: 'Warning',
          barrierDismissible: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HtmlWidget(appSettings?.data?.maintainText ?? ""),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    backPage();
                    if(Platform.isAndroid){
                      SystemNavigator.pop();
                    } else {
                      exit(0);
                    }
                  },
                  child: Text('Ok',style: appTheme().textTheme.headlineLarge!.copyWith(color: AppColor.primary),)
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
