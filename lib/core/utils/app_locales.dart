import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../network/local/cache/cache_helper.dart';

class AppLocales {
  static String path = 'assets/translations';
  /// CURRENT LANG
  static int? currentLang;

  static Future<void> init() async {
    /// GET DEVICE LANG CODE
   // String languageCode = Intl.systemLocale.split('_')[0];

    /// SAVE DEFAULT LANG
    await CacheHelper.getData('lang') ??
        await CacheHelper.saveData(
          'lang','en',
        );

    /// GET LANG
    String lang = await CacheHelper.getData('lang');

    /// CURRENT LANG
    if (lang == 'ar') {
      currentLang = 0;
    } else if (lang == 'en') {
      currentLang = 1;
    }
  }
  /// list of supported locales
  static const supportedLocales = [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ];

  /// list of supported locales names
  static const supportedLocalesNames = [
    'العربية',
    'English',
  ];

  /// list of supported locales codes
  static const supportedLocalesCodes = [
    'ar',
    'en',
  ];

  /// current app locale
  static Locale currentLocale = supportedLocales[currentLang!];

  /// updates device locale, takes [context] and [index] of supported locales as parameters
  ///
  /// * [index] is the index of supported locales in [supportedLocales]
  ///
  /// * [context] is the current [BuildContext].
  static void setDeviceLocale(BuildContext context, int index) {
    //make sure the index is in range
    if (index < 0 || index >= supportedLocales.length) {
      return;
    }
    EasyLocalization.of(context)!
        .setLocale(supportedLocales[index])
        .then((value) => currentLocale = supportedLocales[index]);
  }
}