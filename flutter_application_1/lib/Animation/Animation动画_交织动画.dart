import 'dart:math';

import 'package:flutter/material.dart';


class StaggerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StaggerDemo1();
  }
}

class StaggerDemo1 extends StatefulWidget {
  @override
  State<StaggerDemo1> createState() => _StaggerDemo1State();
}

class _StaggerDemo1State extends State<StaggerDemo1> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;
  late Animation _sizeAnni;
  late Animation _colorAnni;
  late Animation _opacityAnni;
  late Animation _transAnni;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建AnimationController
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
 
    // 动画添加Curve效果
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut, reverseCurve: Curves.linear);

    // Tween
    // 大小
    _sizeAnni = Tween(begin: 50.0, end: 150.0).animate(_controller);
    // 颜色
    _colorAnni = ColorTween(begin: Colors.red, end: Colors.blueAccent).animate(_controller);
    // opacity
    _opacityAnni = Tween(begin: 0.5, end: 1.0).animate(_controller);
    // transform
    _transAnni = Tween(begin: 0.0, end: 2*pi).animate(_controller);


    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  
   /**
    
    */

   /** */
  @override
  Widget build(BuildContext context) {

    print("_StaggerDemo1State build方法");
    return Scaffold(
      appBar: AppBar (
        title: Text("交织动画"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Opacity(
            opacity: _opacityAnni.value,
            child: Transform(
              transform: Matrix4.rotationZ(_transAnni.value),
              alignment: Alignment.center,
              child: Container(
                  width: _sizeAnni.value,
                  height: _sizeAnni.value,
                  color: _colorAnni.value,
              ),
            ),
          );
          },
        ),
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

