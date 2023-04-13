import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_helper/enums.dart';
import '../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/default_dialog.dart';
import '../view/code_verify.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  var arguments;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  SignInBloc() : super(SignInState().init()) {
    on<InitEvent>(_init);
    on<RememberMe>(_changeRemember);
    on<SubmitData>(_submitData);
    on<TwoFaVerification>(_twoFaVerification);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  void _init(InitEvent event, Emitter<SignInState> emit) async {
    if (kDebugMode) {
      email.text = 'user@gmail.com';
      password.text = '1234';
    }
    arguments = settings(event.context).arguments;

    emit(state.clone());
  }

  Future _changeRemember(RememberMe event, Emitter<SignInState> emit) async {
    emit(state.clone(rememberMe: event.value));
  }

  Future _submitData(SubmitData event, Emitter<SignInState> emit) async {
    if(!formKey.currentState!.validate()) return;
    emit(state.clone(state: PageState.Loading));
    emit(state.clone());
    goAndRemoveAllPages(Routes.MAIN_PAGE);
    emit(state.clone(state: PageState.Success));
  }


  FutureOr<void> _twoFaVerification(TwoFaVerification event, Emitter<SignInState> emit) async {
    emit(state.clone(verificationLoading: true));
    backPage();
    goAndRemoveAllPages(Routes.MAIN_PAGE);
    emit(state.clone(verificationLoading: false));
  }

  void verifyDialog(){
    showDialog(
        context: appContext,
        builder: (ctx){
          return DefaultDialog(
            title: 'Verify your OTP',
            child: CodeVerify(this),
          );
        }
    );
  }
}
