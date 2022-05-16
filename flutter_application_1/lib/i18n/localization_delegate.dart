
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/i18n/localizations.dart';

class KKLocalizationsDelegate extends LocalizationsDelegate<KKLocalizations> {
  
  // 静态方法，和系统一致
  static KKLocalizationsDelegate delegate = KKLocalizationsDelegate();

  @override
  // 用于当前环境的Locale，是否在我们支持的语言范围
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  // 当Localizations Widget重新build时，是否调用load方法重新加载Locale资源，一般false
  bool shouldReload(covariant LocalizationsDelegate<KKLocalizations> old) {
    return false;
  }

  // 当Locale发生改变时（语言环境），加载对应的HYLocalizations资源
  @override
  Future<KKLocalizations> load(Locale locale) async {
    // 本地
    //  return SynchronousFuture(KKLocalizations(locale));

    // 异步
    final localization = KKLocalizations(locale);
    await localization.loadJson();
    return localization;
  }

  
  


}