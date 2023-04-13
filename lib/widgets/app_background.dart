import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/connectivity_helper.dart';
import '../main.dart';
import '../theme/app_color.dart';
import '../utils/dimension.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final bool visibleWarning;

  const AppBackground({
    super.key,
    required this.child,
    this.visibleWarning = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: child),
          ValueListenableBuilder<ConnectivityResult>(
              valueListenable: ConnectivityHelper.networkState,
              builder: (context, value, child) {
                return Visibility(
                  visible: value == ConnectivityResult.none,
                  child: Container(
                    color: AppColor.red,
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 16.r),
                    margin: EdgeInsets.only(bottom: Dimension.paddingBottom),
                    child: Text(
                      'No Internet Connection!',
                      style: appTheme(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.buttonTextColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
