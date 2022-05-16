import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KKLocalizations {
  final Locale locale;

  KKLocalizations(this.locale);

  // 静态方法 
  static KKLocalizations of(BuildContext context) {
    return Localizations.of(context, KKLocalizations);
  }

  // 定义一个本地Map，其中存放我们不同语言对应的显示文本
  // static Map<String, Map<String, String>> _localizedValues = {
  //   "en": {
  //     "title": "international",
  //     "label": "text ",
  //     "tip": "click",
  //   },
  //   "zh": {
  //     "title": "国际化",
  //     "label": "text 文本",
  //     "tip": "点击按钮",
  //   }
  // };

  // 定义一个json或者服务器配置
  static Map<String, Map<String, String>> _localizedValues = {};

  Future<bool> loadJson() async {
    // 1.加载json文件
    String jsonString = await rootBundle.loadString("assets/json/i18n.json");
    
    // 2.转成map类型
    final Map<String, dynamic> map = json.decode(jsonString);
    
    // 3.注意：这里是将Map<String, dynamic>转成Map<String, Map<String, String>>类型
    _localizedValues = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });
    return true;
  }
  
  // 它们对应的getter方法，根据语言环境返回不同的结果
  String get title {
    return _localizedValues[locale.languageCode]!["title"]!;
  }

  String get label {
    return _localizedValues[locale.languageCode]!["label"]!;
  }

  String get tip {
    return _localizedValues[locale.languageCode]!["tip"]!;
  }

}