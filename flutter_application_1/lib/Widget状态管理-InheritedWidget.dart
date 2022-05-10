
import 'package:flutter/material.dart';

// InheritedWidget

class StatusManageDemo extends StatefulWidget {
  @override
  State<StatusManageDemo> createState() => _StatusManageDemoState();
}

class _StatusManageDemoState extends State<StatusManageDemo> {
  int _count = 10;
  @override
  Widget build(BuildContext context) {

    print("执行build方法");

    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget使用"),
      ),
      body: DataWidget(
        count: _count,
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowDataWidget1(),
              ShowDataWidget2()
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行didChangeDependencies方法");
  }

}


/// InheritedWidget和React中的context功能类似，可以实现跨组件数据的传递。
/// 定义一个共享数据的InheritedWidget，需要继承自InheritedWidget

class DataWidget extends InheritedWidget {

  // 共享数据
  // final int count = 100;
  final int count;

   // 构造方法
  // DataWidget({required Widget child, }) : super(child: child);
  DataWidget({required Widget child, required this.count}) : super(child: child);
  
   // 找到最近的InheritedWidget
  static DataWidget? of(BuildContext context) {
    // 沿着Element树，去找到最近的DataElement,从Element中取出Wdgite对象
    return context.dependOnInheritedWidgetOfExactType();
  }
  
  // 决定要不要回调Status中的didChangeDependencies方法
  @override
  // 对比新旧DataWidget，是否需要对更新相关依赖的Widget 
  bool updateShouldNotify(DataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return this.count != oldWidget.count;
  }
}

class ShowDataWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     int count = DataWidget.of(context)!.count;
    return Container(
       color: Colors.blueAccent,
       child: Text(
         "数据 $count", 
         style: TextStyle(fontSize: 30),
       ),
    );
  }
}

class ShowDataWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int count = DataWidget.of(context)!.count;

    return Card(
       color: Colors.red,
       child: Text(
         "数据 $count", 
         style: TextStyle(fontSize: 30),
       ),
    );
  }
}
