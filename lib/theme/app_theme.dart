import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';
import '../routes/route_transition.dart';
import '../utils/dimension.dart';
import 'app_color.dart';

class AppTheme{
  static ThemeData get lightTheme => ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColor.primary,
      ),
      primaryColor: AppColor.primaryLite,
      primaryColorDark: AppColor.primary,
      primaryColorLight: AppColor.primaryLite,
      scaffoldBackgroundColor: AppColor.background,
      dividerColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: AppColor.appBarColor,
        iconTheme: IconThemeData(
          color: AppColor.iconColor
        ),
        titleTextStyle: TextStyle(color: AppColor.textColor,fontSize: 18.spMin,fontWeight: Dimension.textBold,)
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        color: AppColor.cardColor,
        shadowColor: AppColor.cardShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.r)
        ),
        elevation: 4,
        clipBehavior: Clip.antiAlias
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primary2,
      ),
      iconTheme: IconThemeData(
        color: AppColor.iconColor
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            color: AppColor.textColor,
            fontSize: 16.spMin,
            fontWeight: Dimension.textBold,),
        headlineMedium: TextStyle(
            color: AppColor.textColor,
            fontSize: 14.spMin,
            fontWeight: Dimension.textBold,
        ),
        headlineSmall: TextStyle(
            color: AppColor.textColor,
            fontSize: 12.spMin,
            fontWeight: Dimension.textBold,
        ),
        displaySmall: TextStyle(
            color: AppColor.textColor, fontSize: 14.spMin,fontWeight: Dimension.textRegular,),
        titleSmall: TextStyle(
          color: AppColor.textColor, fontSize: 14.spMin,fontWeight: Dimension.textRegular,height: 1.3,),
        bodyLarge: TextStyle(
          color: AppColor.textColor, fontSize: 14.spMin,fontWeight: Dimension.textRegular,height: 1.3,),
        bodyMedium: TextStyle(
            color: AppColor.textColor,
            fontSize: 12.spMin,fontWeight: Dimension.textRegular,),
        bodySmall: TextStyle(
            color: AppColor.textColor,
            fontSize: 10.spMin,fontWeight: Dimension.textRegular,),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: RouteTransition(),
            TargetPlatform.android: RouteTransition(),
          }
      ),
      fontFamily: FontFamily.poppins,
  );
}