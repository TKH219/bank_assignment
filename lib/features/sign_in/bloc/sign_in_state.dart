import '../../../app_helper/enums.dart';

class SignInState {
  bool rememberMe = true;
  PageState pageState;
  bool verificationLoading = false;

  SignInState({
    this.rememberMe = true,
    this.pageState = PageState.Initial,
    this.verificationLoading = false,
  });

  SignInState init() {
    return SignInState();
  }

  SignInState clone({bool? rememberMe, PageState? state, bool? verificationLoading}) {
    return SignInState(
      rememberMe: rememberMe ?? this.rememberMe,
      pageState: state ?? pageState,
      verificationLoading: verificationLoading ?? this.verificationLoading,
    );
  }
}
