import 'package:flutter/material.dart';

// 生命周期

class StatusDemo extends StatefulWidget {
  StatusDemo() {
    print("1. StatusDemo 的 Constructor方法");
  }

  @override
  State<StatusDemo> createState() {
     print("2. StatusDemo 的 createState方法");
     return _StatusDemoState();
  }
}

class _StatusDemoState extends State<StatusDemo> {
   _StatusDemoState() {
     print("3. 执行_StatusDemoState的Constructor方法");
   } 

  @override
  void initState() {
    super.initState();
    print("4. 执行_StatusDemoState的 init 方法");
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行_StatusDemoState的didChangeDependencies方法");
  }

    int _count = 0;

  @override
    Widget build(BuildContext context) {
       print("5. 执行_StatusDemoState的build方法");

   return Scaffold(
      appBar: AppBar(
        title: Text('状态交互'),        
      ),
      body: Center(
          child: Text(
              '$_count',
              style: TextStyle(fontSize: 18),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
             _count += 1;
          });
          print('$_count');
        },
      ),
    );
  }


  @override
  void didUpdateWidget(StatusDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("执行_StatusDemoState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    super.dispose();
    print("6. 执行_StatusDemoState的dispose方法");
  }
}
