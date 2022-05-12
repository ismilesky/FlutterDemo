
import 'dart:ui';

import 'package:flutter/material.dart';

class ScreenAdaptDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // SizeFit.initialize(); 使用SizeFit打开

    // 物理宽高
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    print("分辨率: $physicalWidth - $physicalHeight");

    // 由于在MaterialApp之前使用MediaQuery.of(context)数据是null,但是也有办法拿到屏幕宽高
    // 源码： MediaQueryData.fromWindow(ui.SingletonFlutterWindow window)
    // : size = window.physicalSize / window.devicePixelRatio,
    // 通过拿到devicePixelRatio，在获取宽高
    final dpr = window.devicePixelRatio;

    final size = window.physicalSize/dpr;
    print("宽高: ${size.width} * ${size.height}");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
   // 媒体查询信息
   final mediaQueryData = MediaQuery.of(context);

    // 手机屏幕的大小(逻辑分辨率) 必须MaterialApp初始化成功才能获取到mediaQueryData数据
    final width = mediaQueryData.size.width;
    final height = mediaQueryData.size.height;
    final statusHeight = mediaQueryData.padding.top;
    final dpr = window.devicePixelRatio;
    print("屏幕宽高: $width * $height");
    print("状态栏的高度: $statusHeight");
    print("dpr: $dpr");

    // 状态栏的高度
    // 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQueryData.padding.top;
    // 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQueryData.padding.bottom;
    print("状态栏height: $statusBarHeight 底部高度:$bottomHeight");


    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        // 这种写法是固定宽高，不管是不是在 320屏 或者 375屏，大小是固定的，
        // 不能根据屏幕进行宽高自适应
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("Hello World", style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}

class AdaptPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("屏幕适配"),
      ),
      body: Center(
        child: Container(
          width: 200.px,
          height: 200.px,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("Hello World", style: TextStyle(fontSize: 20.px),),
        ),
      ),
    );
  }
}


/**
 常见的屏幕适配方案：
 rem：
  rem是给根标签（HTML标签）设置一个字体大小；
  但是不同的屏幕要动画设置不同的字体大小（可以通过媒体查询，也可以通过js动态计算）；
  其它所有的单位都使用rem单位（相对于根标签）；
 vw、wh：
  vw和vh是将屏幕（视口）分成100等份，一个1vw相当于是1%的大小；
  其它所有的单位都使用vw或wh单位；
rpx：
  rpx是小程序中的适配方案，它将750px作为设计稿，1rpx=屏幕宽度/750；
  其它所有的单位都使用rpx单位；
  
  小程序中rpx的原理是什么呢？

  不管是什么屏幕，统一分成750份
  在iPhone5上：1rpx = 320/750 = 0.4266 ≈ 0.42px
  在iPhone6上：1rpx = 375/750 = 0.5px
  在iPhone6plus上：1rpx = 414/750 = 0.552px

  通过上面的计算方式，算出一个rpx，再将自己的size和rpx单位相乘即可：

  比如100px的宽度：100 * 2 * rpx
  在iPhone5上计算出的结果是84px
  在iPhone6上计算出的结果是100px
  在iPhone6plus上计算出的结果是110.4px
 */

/** */


// 封装适配工具类

class SizeFit {
  // 1.基本信息
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double statusHeight;

  static late double rpx;
  static late double px;

  static void initialize({double standardSize = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

// 扩展，
extension DoubleFit on double {
  double get px {
    return SizeFit.setPx(this);
  }

  double get rpx {
    return SizeFit.setRpx(this);
  }
}

extension IntFit on int {
  double get px {
    return SizeFit.setPx(toDouble());
  }

  double get rpx {
    return SizeFit.setRpx(toDouble());
  }
}

/**
 屏幕适配也可以使用第三方库：flutter_screenutil

 https://github.com/OpenFlutter/flutter_screenutil
 */