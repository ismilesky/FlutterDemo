import 'package:flutter/material.dart';

/// 监听滚动

class MonitorScrollDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScrollDemo1();
  }
}

/**
 两种监听方式:
   ScrollController：
   1. 可以设置默认值offset
   2. 监听滚动，监听滚动位置
    
   NotificationListener：
   1. 监听什么时候开始滚动，什么时候结束滚动
 */


/// ScrollController
class ScrollDemo1 extends StatefulWidget {
  @override
  State<ScrollDemo1> createState() => _ScrollDemo1State();
}

class _ScrollDemo1State extends State<ScrollDemo1> {
  ScrollController _controller = ScrollController(initialScrollOffset: 100);
   
  bool _isShowBtn = false;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      print("滚动到====>> ${_controller.offset}");
      setState(() {
        _isShowBtn = _controller.offset > 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controller滚动监听"),
      ),
      body: ListView.builder(
      controller: _controller,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.people),
          title: Text("联系人 ${index+1}"),
        );
      }),
      floatingActionButton: _isShowBtn ? FloatingActionButton(
        child:Icon(Icons.arrow_upward),
        onPressed: () {
           _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
        },
      ) : null,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 销毁监听
    _controller.dispose();
  }
}

/// NotificationListener
class ScrollDemo2 extends StatefulWidget {

  @override
  State<ScrollDemo2> createState() => _ScrollDemo2State();
}

class _ScrollDemo2State extends State<ScrollDemo2> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Controller滚动监听"),
      ),
      body: NotificationListener(
        /**
         NotificationListener需要一个onNotification回调函数，用于实现监听处理逻辑。

         该回调可以返回一个布尔值，代表是否阻止该事件继续向上冒泡，
         如果为true时，则冒泡终止，事件停止向上传播，
         如果不返回或者返回值为false 时，则冒泡继续。

         */
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollUpdateNotification) {
            print("正在滚动 -- 总滚动位置：${notification.metrics.maxScrollExtent} --- 当前位置： ${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          }

          return false;
        },
        child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人 ${index+1}"),
          );
        }),
      ),
    );
  }
}