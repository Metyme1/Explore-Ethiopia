import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class LocalizationChecker {
  static changeLanguge(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('am', 'ET'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }
}