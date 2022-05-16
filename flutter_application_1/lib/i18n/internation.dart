
import 'package:flutter/material.dart';
import 'package:flutter_application_1/i18n/localization_delegate.dart';
import 'package:flutter_application_1/i18n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';

// 国际化

class InternationAPP extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
        KKLocalizationsDelegate.delegate,

        S.delegate,
      ],
      // S.delegate.supportedLocales
      supportedLocales: S.delegate.supportedLocales,
      home: InternationDemo2(),
      theme: ThemeData (
        primaryColor: Colors.blue
      ),
    );
  }
}

// 
class InternationDemo1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KKLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(KKLocalizations.of(context).label),
            ElevatedButton(
                child: Text(KKLocalizations.of(context).tip),
                onPressed: () {
                  showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2020), 
                    lastDate: DateTime(2050)
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

// arb文件
class InternationDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).label),
            ElevatedButton(
                child: Text(S.of(context).tip),
                onPressed: () {
                  showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2020), 
                    lastDate: DateTime(2050)
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}


/**
 非默认Widget本地化：
 1. 自定义本地化
    1.1 创建本地化类  => KKLocalizations
    1.2 自定义Delegate => KKLocalizationsDelegate

 2. arb文件  Flutter Intl插件 => intl_en.arb/intl_zh.arb 配置相关配置
  json文件需要手动编写get方法
    flutterIntl.initiali指令初始化语言配置信息， 执行完后会在lib目录下增加 generated 和 l10n两个包
    flutterIntl.addLocale 指令生成其他语言的arb文件

 */