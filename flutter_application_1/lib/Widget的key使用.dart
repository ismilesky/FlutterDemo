
import 'dart:math';

import 'package:flutter/material.dart';

class WidgetKeyDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Demo2();
  }
}

class Demo1 extends StatefulWidget {
  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {

  final List<String> names = ["aaaa", "bbbb", "cccc"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Widget的Key使用"),
      ),
      body: ListView(
        children: _getItems3(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }

   // StatelessWidget的实现
   List<Widget> _getItems1() {
     return names.map((name) {
          return ListItemLess(name);
      }).toList();
   }

   // StatefulWidget的实现（没有key）
  List<Widget> _getItems2() {
     return names.map((item) {
          return ListItemFul(item);
        }).toList();
   }

   // StatefulWidget的实现（name为key） 
   /**
    // Widget类中的代码
    staticbool canUpdate(Widget oldWidget, Widget newWidget) {
     r  eturn oldWidget.runtimeType == newWidget.runtimeType
      && oldWidget.key == newWidget.key;
    }
    */
   // ps: 随机key: UniqueKey() 
   // 每次删除都会出现随机颜色的现象：这是因为修改了key之后，
   // Element会强制刷新，那么对应的State也会重新创建
   List<Widget> _getItems3() {
     return names.map((item) { //
          return ListItemFullKey(item, key: ValueKey(item),);
      }).toList();
   }
}

/**
  它的实现效果是每删除一个，所有的颜色都会发现一次变化
  原因非常简单，删除之后调用setState，会重新build，
  重新build出来的新的StatelessWidget会重新生成一个新的随机颜色 
 */
class ListItemLess extends StatelessWidget {
  final String name;
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name, style: TextStyle(color: Colors.white, fontSize: 30)),
      height: 80,
      color: randColor,
    );
  }
}


// StatefulWidget的实现（没有key）
class ListItemFul extends StatefulWidget {
  final String name;
  
  ListItemFul(this.name);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 30),),
      height: 80,
      color: randColor,
    );
  }
}

//  StatefulWidget的实现（name为key）, 使用key可以强制刷新Widget

/// 因为这是在更新widget的过程中根据key进行了diff算法
/// 在前后进行对比时，发现bbb对应的Element和ccc对应的Element会继续使用，
/// 那么就会删除之前aaa对应的Element，而不是直接删除最后一个Element
class ListItemFullKey extends StatefulWidget {
  final String name;
  ListItemFullKey(this.name, {Key? key}): super(key: key);

  @override
  State<ListItemFullKey> createState() => _ListItemFullKeyState();
}

class _ListItemFullKeyState extends State<ListItemFullKey> {
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 30),),
      height: 80,
      color: randColor,
    );
  }
}



// GlobalKey使用
// GlobalKey可以帮助我们访问某个Widget的信息，包括Widget或State或Element等对象
class Demo2 extends StatelessWidget {

  final GlobalKey<_GlobalKeyContentState> contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("GlobalKey使用"),
      ),
      body: GlobalKeyContent(key: contentKey),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.data_usage),
        onPressed: () {
          print(contentKey.currentState?.value);
          print(contentKey.currentState?.widget.name);
        },
      ),
    );
  }
}


class GlobalKeyContent extends StatefulWidget {
  final String name = "123";

  const GlobalKeyContent({ Key? key }) : super(key: key);

  @override
  State<GlobalKeyContent> createState() => _GlobalKeyContentState();
}

class _GlobalKeyContentState extends State<GlobalKeyContent> {

 final String value = "abc";

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
