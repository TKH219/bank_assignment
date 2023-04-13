import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_helper/enums.dart';
import '../../../app_helper/validator.dart';
import '../../../gen/assets.gen.dart';
import '../../../main.dart';
import '../../../theme/app_color.dart';
import '../../../utils/design_component.dart';
import '../../../utils/dimension.dart';
import '../../../widgets/circle_button.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_textfield.dart';
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_event.dart';
import '../bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  SignInBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInBloc()..add(InitEvent(context)),
      child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) => Form(
                key: context.read<SignInBloc>().formKey,
                child: _buildPage(context, state),
              )),
    );
  }

  Widget _buildPage(BuildContext context, SignInState state) {
    bloc ??= BlocProvider.of<SignInBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimension.appbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Forgot your password?',
                      style: appTheme(context).textTheme.bodyMedium!.merge(
                            DesignComponent.textUnderline(color: AppColor.grey),
                          ),
                    ),
                  ),
                  8.horizontalSpace
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.r),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      16.verticalSpace,
                      Text(
                        'Welcome!',
                        style: appTheme(context).textTheme.headlineLarge!.copyWith(fontSize: 26.spMin),
                      ),
                      Text(
                        'Please enter your data to continue',
                        style: appTheme(context).textTheme.bodyLarge!.copyWith(color: AppColor.grey),
                      ),
                      30.verticalSpace,
                      DefaultTextField(
                        controller: bloc!.email,
                        label: 'Email',
                        hint: 'Email',
                        labelAsTitle: true,
                        textInputType: TextInputType.emailAddress,
                        validator: Validator.emailValidator,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColor.grey,
                        ),
                      ),
                      16.verticalSpace,
                      DefaultTextField(
                        controller: bloc!.password,
                        label: 'Password',
                        hint: 'Password',
                        labelAsTitle: true,
                        obscureText: true,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: AppColor.grey,
                        ),
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Remember me',
                            style: appTheme(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: Dimension.textMedium,
                                ),
                          ),
                          const Spacer(),
                          CupertinoSwitch(
                            value: state.rememberMe,
                            onChanged: (value) => bloc!.add(
                              RememberMe(value),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 0.7.sw,
                        margin: EdgeInsets.symmetric(vertical: 20.r),
                        child: Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1,
                              height: 1,
                              color: AppColor.grey,
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              child: Text(
                                'or',
                                style: appTheme(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 18.sm, fontWeight: Dimension.textMedium, color: AppColor.grey),
                              ),
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 1,
                              height: 1,
                              color: AppColor.grey,
                            )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
                            elevation: 10,
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              width: 44.r,
                              height: 44.r,
                              child: CircleButton(
                                loading: false,
                                onTap: () {},
                                child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: SvgPicture.asset(
                                      Assets.icons.facebook,
                                      height: 20.r,
                                      width: 20.r,
                                    )),
                              ),
                            ),
                          ),
                          20.horizontalSpace,
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
                            elevation: 10,
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              width: 44.r,
                              height: 44.r,
                              child: CircleButton(
                                loading: false,
                                onTap: () {},
                                child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: SvgPicture.asset(
                                      Assets.icons.google,
                                      height: 20.r,
                                      width: 20.r,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      DefaultButton(
                        onTap: () => bloc!.add(SubmitData()),
                        isLoading: state.pageState == PageState.Loading,
                        child: Text(
                          'Login',
                          style: appTheme()
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.buttonTextColor, fontSize: 18.sm),
                        ),
                      ),
                      16.verticalSpace,
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Don't have an Account? ",
                              style: appTheme(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColor.grey,
                                    height: 1.5,
                                  ),
                              children: [
                                TextSpan(
                                    style: appTheme(context)
                                        .textTheme
                                        .displaySmall!
                                        .merge(DesignComponent.textUnderline(color: AppColor.textColor)),
                                    text: 'Sign up',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // goAndReplacePage(Routes.SIGN_UP, arguments: bloc!.arguments);
                                      })
                              ])),
                      Dimension.bottomSpace
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 0.7.sw,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By connection your account confirm that you agree with our ',
                  style: appTheme(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.grey,
                        height: 1.5,
                      ),
                  children: [
                    TextSpan(
                        style: appTheme(context)
                            .textTheme
                            .headlineSmall!
                            .merge(DesignComponent.textUnderline(color: AppColor.textColor)),
                        text: 'Terms and Conditions',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Helper.goBrowser(URL.privacyUrl);
                          })
                  ],
                ),
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
