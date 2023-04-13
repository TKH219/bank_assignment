import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import '../theme/app_color.dart';
import 'default_button.dart';

Widget DialogButton({
  String? negativeButton,
  String? positiveButton,
  required Function(bool) onTap,
  Color? positiveButtonColor,
  Color? positiveButtonTextColor,
  bool isLoading = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.r),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () => onTap(false),
            child: Text(
              negativeButton ?? 'Cancel',
              style: appTheme().textTheme.headlineMedium!.copyWith(color: AppColor.grey),
            )),
        16.horizontalSpace,
        DefaultButton(
          isLoading: isLoading,
          onTap: () => onTap(true),
          backgroundColor: positiveButtonColor ?? AppColor.primary,
          padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 12.r),
          borderRadius: 5.r,
          child: Container(
            constraints: BoxConstraints(minWidth: 0.2.sw),
            alignment: Alignment.center,
            child: Text(
              positiveButton ?? 'Ok',
              style: appTheme().textTheme.headlineMedium!.copyWith(
                    color: positiveButtonTextColor ?? AppColor.buttonTextColor,
                  ),
            ),
          ),
        ),
      ],
    ),
  );
}
