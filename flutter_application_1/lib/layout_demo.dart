import 'package:flutter/material.dart';

// 布局

class Layout extends StatelessWidget {
  const Layout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment(0, 0),
      child: AspectDemo(),
    );
  }
}


class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment(0, 0),
      // child: Text('Flutter'),

      child: Row(
        // 主轴：X轴
        /**
         * spaceBetween 剩下空间均分到组件之前
         * spaceAround 剩下空间均分到组件周围
         * spaceEvenly 剩下空间和组件均分
         */
        mainAxisAlignment: MainAxisAlignment.start,

        // 交叉轴
        // crossAxisAlignment: CrossAxisAlignment.baseline,

        // 基线  适用于文字相关
        /**
         * alphabetic 英文
         * ideographic 中文
         */
        // textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            color: Colors.blue,
            height: 60,
            child: Icon(Icons.ac_unit, size: 40),
          ),
          Container(
            color: Colors.red,
            height: 60,
            child: Icon(Icons.access_alarm, size: 40),
          )
        ],
      ),
    );
  }
}

class LayoutDemo1 extends StatelessWidget {
  const LayoutDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment(0, 0),
      // child: Text('Flutter'),

      child: Row(
        // 主轴：X轴
        /**
         * spaceBetween 剩下空间均分到组件之前
         * spaceAround 剩下空间均分到组件周围
         * spaceEvenly 剩下空间和组件均分
         */
        mainAxisAlignment: MainAxisAlignment.start,

        // 交叉轴
        crossAxisAlignment: CrossAxisAlignment.baseline,

        // 基线  适用于文字相关
        /**
         * alphabetic 英文
         * ideographic 中文
         */
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            color: Colors.blue,
            height: 60,
            // child: Icon(Icons.ac_unit, size: 40),
            child: Text(
              'Flutter',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            color: Colors.red,
            height: 60,

            // child: Icon(Icons.access_alarm, size: 40),
            child: Text('Goole', style: TextStyle(fontSize: 30)),
          )
        ],
      ),
    );
  }
}

class LayoutDemo2 extends StatelessWidget {
  const LayoutDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment(0, 0),
      // child: Text('Flutter'),

      child: Row(
        // 主轴：X轴
        /**
         * spaceBetween 剩下空间均分到组件之前
         * spaceAround 剩下空间均分到组件周围
         * spaceEvenly 剩下空间和组件均分
         */
        mainAxisAlignment: MainAxisAlignment.start,

        // 交叉轴
        crossAxisAlignment: CrossAxisAlignment.baseline,

        // 基线  适用于文字相关
        /**
         * alphabetic 英文
         * ideographic 中文
         */
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              height: 60,
              // child: Icon(Icons.ac_unit, size: 40),
              child: Text(
                'Flutter',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              height: 60,

              // child: Icon(Icons.access_alarm, size: 40),
              child: Text('Goole', style: TextStyle(fontSize: 30)),
            ),
          )
        ],
      ),
    );
  }
}


// stack position
class LayoutDemo4 extends StatelessWidget {
  const LayoutDemo4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment(0, 0),
      // child: Text('Flutter'),

      child: Stack(
        alignment: Alignment(0, 0), 
        children: [
        Positioned(
          child: Container(
            color: Colors.blue,
            height: 200,
            width: 200,
            child: Icon(Icons.ac_unit),
          ),
        ),
        Positioned(
          right: 0,
            child: Container(
          color: Colors.red,
          height: 100,
          width: 100,
          child: Icon(Icons.search),
        ))
      ]),
    );
  }
}


// 宽高比布局
class AspectDemo extends StatelessWidget {
  const AspectDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.redAccent,
        width: 300,
        child: AspectRatio(
          aspectRatio: 2/1,
          child: Icon(Icons.add, size: 30), 
          ),
    );
  }
}