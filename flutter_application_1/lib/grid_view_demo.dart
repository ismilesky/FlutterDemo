import 'dart:math';

import 'package:flutter/material.dart';

// GridView

class GridViewDemo extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表展示"),
      ),    
      body: GridViewDemo3(),
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,  // 交叉轴的item个数
        childAspectRatio: 1 , // 子Widget的宽高比
        mainAxisSpacing: 10, // 主轴的间距 横向
        crossAxisSpacing: 10, // 交叉轴的间距 竖向
      ), 
      itemBuilder:(BuildContext context, int index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      });
  }
}


 /**
      * gridDelegate用于控制交叉轴的item数量或者宽度，需要传入的类型是SliverGridDelegate，
         但是它是一个抽象类，所以我们需要传入它的子类：
         SliverGridDelegateWithFixedCrossAxisCount

         SliverGridDelegateWithFixedCrossAxisCount({
          @requireddouble crossAxisCount, // 交叉轴的item个数
          double mainAxisSpacing = 0.0, // 主轴的间距
          double crossAxisSpacing = 0.0, // 交叉轴的间距
          double childAspectRatio = 1.0, // 子Widget的宽高比
          )}

          SliverGridDelegateWithMaxCrossAxisExtent
          SliverGridDelegateWithMaxCrossAxisExtent({
            double maxCrossAxisExtent, // 交叉轴的item宽度
            double mainAxisSpacing = 0.0, // 主轴的间距
            double crossAxisSpacing = 0.0, // 交叉轴的间距
            double childAspectRatio = 1.0, // 子Widget的宽高比
         })
 */


class GridViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,  // 交叉轴的item个数
          childAspectRatio: 1 , // 子Widget的宽高比
          mainAxisSpacing: 10, // 主轴的间距 横向
          crossAxisSpacing: 10, // 交叉轴的间距 竖向
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          );
        }),
      ),
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),

      /**
       SliverGridDelegateWithMaxCrossAxisExtent
          SliverGridDelegateWithMaxCrossAxisExtent({
            double maxCrossAxisExtent, // 交叉轴的item宽度
            double mainAxisSpacing = 0.0, // 主轴的间距
            double crossAxisSpacing = 0.0, // 交叉轴的间距
            double childAspectRatio = 1.0, // 子Widget的宽高比
         })
       */
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,  // 交叉轴的item宽度
          childAspectRatio: 1 , // 子Widget的宽高比
          mainAxisSpacing: 10, // 主轴的间距 横向
          crossAxisSpacing: 10, // 交叉轴的间距 竖向
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          );
        }),
      ),
    );
  }
}

