
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {

/**
 * final和const有什么区别呢?
    const在赋值时, 赋值的内容必须是在编译期间就确定下来的
    final在赋值时, 可以动态获取, 运行时 比如赋值一个函数
 */

  final TextStyle _textStyle = TextStyle (
    fontSize: 18.0,
    fontWeight: FontWeight.bold,

  );

  final String _title = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Text(
      '<$_title>Google为Flutter选择了Dart就已经是既定的事实，无论你多么想用你熟悉的语言，比如JavaScript、Java、Swift、C++等来开发Flutter，至少目前都是不可以的。',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}


// 富文本
class RichTextDemo extends StatelessWidget {
  const RichTextDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Flutter学习',
        style: TextStyle(
          fontSize: 18.0,
           color: Colors.amber
        ),
        children: [
          TextSpan(
             text: 'Google为Flutter选择了Dart就已经是既定的事实',
             style: TextStyle(fontSize: 16.0,color: Colors.red)
          )
        ]
      ),
    );
  }
}


// container
class ContainerDemo  extends StatelessWidget {
  const ContainerDemo ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.amberAccent,
       child: Row(
          children: [
            Container(
               color: Colors.redAccent,
               child: Icon(Icons.access_alarm, size: 30,),
               padding: EdgeInsets.all(10),
               margin: EdgeInsets.all(5)
            )
          ],
       ),
    );
  }
}