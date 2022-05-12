import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';


class EventDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件使用"),
      ),
      body: EventBusDemo(),
    );
  }
}

/// 解决事件冒泡问题
class EventBubblingDemo extends StatelessWidget {
  const EventBubblingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTapDown: (detail) {
            print("红色container点击");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
        IgnorePointer(  // 阻止冒泡， 禁止黑色点击
          child: GestureDetector(
            onTapDown: (detail) {
              print("黑色container点击");        
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.black,
             ),
          ),
        ),
      ],
    ),
    );
  }
}


// 视图嵌套无法进行事件冒泡问题，点击黑色偶尔触发红色点击事件
class NestWidgetGesture extends StatelessWidget {
  const NestWidgetGesture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (detail) {
          print("红色container点击");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: GestureDetector(
            onTapDown: (detail) {
              print("黑色container点击");        
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}


// 手势事件
class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.greenAccent,
        ),
        onTapDown: (detail) {
          print("手势按下");

          print(detail.globalPosition); // 相对于父视图
          print(detail.localPosition); // 相对于本身
        },
        onTapUp: (detail) {
          print("手势抬起");
        },
        onTapCancel: () {
          print("手势取消");
        },
        onTap: () {
          print("手势点击");
        },

        onLongPress: () {
           print("长按手势");
        },
      ),
    );
  }
}


/// 指针事件Pointer
class PointerDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
      onPointerDown:(event) {
        print("手指按下:$event");

        print(event.position); // 相对于父视图
      },
      onPointerUp: (event) {
        print("手指抬起:$event");
      },
      onPointerMove:(event) {
        print("手指移动:$event");
      }
    );
  }
}


/// 跨组件事件的监听 EventBus
/// EventBus相当于是一种订阅者模式，通过一个全局的对象来管理；

// 创建一个全局的EventBus对象
final eventBus = EventBus();

class EventBusDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShowButton(),
          ShowText(),
        ],
      ),
    );
  }
}


// 事件相关类
class UserEvent {
  String msg;

  UserEvent(this.msg);
}

class ShowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(Icons.send),
        label: Text("跨组件事件点击"),
        onPressed: () {
          // 发出事件
          final event = UserEvent("😄哈哈，我点击了跨组件传递事件");
          eventBus.fire(event);
        },
    );
  }
}

class ShowText extends StatefulWidget {
  @override
  _ShowTextState createState() => _ShowTextState();
}

class _ShowTextState extends State<ShowText> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();

   // 监听事件
    eventBus.on<UserEvent>().listen((event) {
      setState(() {
        _message = event.msg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20),);
  }
}