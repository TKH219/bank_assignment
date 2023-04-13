import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_color.dart';
import '../utils/app_constant.dart';

class ShareHelper{
  static SharedPreferences? preferences;
  static Future init() async{
    await SharedPreferences.getInstance().then((pr) {
      preferences = pr;
      if(getTheme() != 'light'){
        AppColor.applyDark();
      }
    });
  }


  static String getLanguage() {
    return preferences!.getString(AppConstant.Share_Language) ?? 'en';
  }

  static void setLanguage(String key) {
    preferences!.setString(AppConstant.Share_Language,key);
  }

  static String getTheme() {
    return preferences!.getString(AppConstant.Share_Theme) ?? 'light';
  }

  static void setTheme(String key) {
    preferences!.setString(AppConstant.Share_Theme,key);
  }
}
