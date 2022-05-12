import 'package:flutter/material.dart';

import 'Animation动画_hero.dart';
import 'Animation动画_交织动画.dart';
import 'Animation动画_路由.dart';


/**
 *  1.Animation: 抽象类
 *    * 监听动画值的改变
 *    * 监听动画状态的改变
 *    * value
 *    * status
 *  2.AnimationController继承自Animation
 *    * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
 *    * forward(): 向前执行动画
 *    * reverse(): 反转执行动画
 *  3.CurvedAnimation:
 *    * 作用: 设置动画执行的速率(速度曲线)
 *  4.Tween: 设置动画执行的value范围
 *    * begin: 开始值
 *    * end: 结束值
 */

/** */

class AnimationDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimationDemo1();
  }
}

class AnimationDemo1 extends StatefulWidget {
  @override
  State<AnimationDemo1> createState() => _AnimationDemo1State();
}

class _AnimationDemo1State extends State<AnimationDemo1> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建AnimationController
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
 
    // 动画添加Curve效果
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut, reverseCurve: Curves.linear);

    // Tween
    _animation = Tween(begin: 50.0, end: 150.0).animate(_controller);
 
    // 监听动画值的改变
    _controller.addListener(() {
      setState(() {});
    });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    print("_AnimationDemo1State build方法");
    return Scaffold(
      appBar: AppBar (
        title: Text("Animation基本动画"),
      ),
      body: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: _animation.value,),
     ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
     ),
    ); 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

/***
 在上面的代码中，我们必须监听动画值的改变，并且改变后需要调用setState，这会带来两个问题：
  1.执行动画必须包含这部分代码，代码比较冗余
  2.调用setState意味着整个State类中的build方法就会被重新build
 */
/** */
// 创建一个Widget继承自AnimatedWidget

class IconAnimation extends AnimatedWidget {
  IconAnimation({required Animation animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    print("IconAnimation build方法");
    Animation ani = listenable as Animation;
    // TODO: implement build
     return Icon(Icons.favorite, color: Colors.red, size: ani.value,);
  }
}

class AnimationDemo2 extends StatefulWidget {
  @override
  State<AnimationDemo2> createState() => _AnimationDemo2State();
}

class _AnimationDemo2State extends State<AnimationDemo2> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建AnimationController
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
 
    // 动画添加Curve效果
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut, reverseCurve: Curves.linear);

    // Tween
    _animation = Tween(begin: 50.0, end: 150.0).animate(_controller);
 
    // 监听动画值的改变
    // _controller.addListener(() {
    //   setState(() {});
    // });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    print("_AnimationDemo2State build方法");
    return Scaffold(
      appBar: AppBar (
        title: Text("AnimatedWidget动画"),
      ),
      body: Center(
        child: IconAnimation(animation: _animation),
     ),  
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
     ),
    ); 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

/**
  问题：
  1.我们每次都要新建一个类来继承自AnimatedWidget
  2.如果我们的动画Widget有子Widget，那么意味着它的子Widget也会重新build
  
  如何可以优化上面的操作呢？AnimatedBuilder, build方法不会重复打印
 */

class AnimationDemo3 extends StatefulWidget {
  @override
  State<AnimationDemo3> createState() => _AnimationDemo3State();
}

class _AnimationDemo3State extends State<AnimationDemo3> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建AnimationController
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
 
    // 动画添加Curve效果
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut, reverseCurve: Curves.linear);

    // Tween
    _animation = Tween(begin: 50.0, end: 150.0).animate(_controller);
 
    // 监听动画值的改变
    // _controller.addListener(() {
    //   setState(() {});
    // });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    print("_AnimationDemo3State build方法");
    return Scaffold(
      appBar: AppBar (
        title: Text("AnimatedBuilder"),
      ),
      body: Center(
        child: AnimatedBuilder (
          animation: _controller,
          builder: ((context, child) { 
            return Icon(Icons.favorite, color: Colors.red, size: _animation.value,);
          }),
        )
     ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
     ),
    ); 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}






