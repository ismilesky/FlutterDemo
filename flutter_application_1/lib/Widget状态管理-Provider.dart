import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider数据共享

/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider (ps: main.dart文件)
 * 3.在其它位置使用共享的数据
 *  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 *  > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 *  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 */


// 创建自己需要共享的数据
class CounterProvider extends ChangeNotifier {
  int _counter = 100;
  int get counter {
    return _counter;
  }
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}


class ProviderDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Provider使用"),
      ),
      body: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowDataWidget1(),
              ShowDataWidget2(),
              ShowDataWidget3(),
            ],
          ),
        ),
      //  floatingActionButton: Consumer<CounterProvider>(
      //   builder: (ctx, counterPro, child) {
      //     print("floatingActionButton的build方法");
      //     return FloatingActionButton(
      //       child: child,
      //       onPressed: () {
      //         counterPro.counter += 1;
      //       },
      //     );
      //   },
      //   child: Icon(Icons.add),
      //   ),
        floatingActionButton: Selector<CounterProvider, CounterProvider>(
        selector: (ctx, counterProvider) => counterProvider,
        shouldRebuild: (pre, next) => false, // 要不要重新构建
        builder: (ctx, counterProvider, child) {
          print("floatingActionButton的build方法");
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterProvider.counter += 1;
            },
          );
        },
        child: Icon(Icons.add),
        ),

    );
  }
}

/// 分析：

/**
 Consumer的builder方法解析：

参数一：context，每个build方法都会有上下文，目的是知道当前树的位置
参数二：ChangeNotifier对应的实例，也是我们在builder函数中主要使用的对象
参数三：child，目的是进行优化，如果builder下面有一颗庞大的子树，
当模型发生改变的时候，我们并不希望重新build这颗子树，
那么就可以将这颗子树放到Consumer的child中，在这里直接引入即可（上述Icon所放的位置）

 */

/*
 优化1:

 floatingActionButton: Consumer<CounterProvider>(
        builder: (ctx, counterPro, c) {
          return FloatingActionButton(
            child: c,  //  引用的下面的Icon(Icons.add)
            onPressed: () {
              counterPro.counter += 1;
            },
          );
        },
        child: Icon(Icons.add),  // 不需要重新build的widget
  ),

 */


/** 
 优化2:

 floatingActionButton的位置有重新build的必要吗？
 没有，因为它是否在操作数据，并没有展示；
 如何可以做到让它不要重新build了？使用Selector来代替Consumer

 
 floatingActionButton: Selector<CounterProvider, CounterProvider>(
        selector: (ctx, counterProvider) => counterProvider,
        shouldRebuild: (pre, next) => false, // 要不要重新构建
        builder: (ctx, counterProvider, child) {
          print("floatingActionButton的build方法");
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterProvider.counter += 1;
            },
          );
        },
        child: Icon(Icons.add),
  ),

 */

/** 
Selector和Consumer对比，不同之处主要是三个关键点：

关键点1：泛型参数是两个
泛型参数一：我们这次要使用的Provider
泛型参数二：转换之后的数据类型，比如我这里转换之后依然是使用CounterProvider，那么他们两个就是一样的类型
关键点2：selector回调函数
转换的回调函数，你希望如何进行转换
S Function(BuildContext, A) selector
我这里没有进行转换，所以直接将A实例返回即可
关键点3：是否希望重新rebuild
这里也是一个回调函数，我们可以拿到转换前后的两个实例；
bool Function(T previous, T next);
因为这里我不希望它重新rebuild，无论数据如何变化，所以这里我直接return false；

*/

/** */


class ShowDataWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     // 在其它位置使用共享的数据
    int count = Provider.of<CounterProvider>(context).counter;

    print("ShowDataWidget1的build方法");

    
    return Container(
       color: Colors.blueAccent,
       child: Text("点击数据 $count", style: TextStyle(fontSize: 30),)
       
    );
  }
}

class ShowDataWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("ShowDataWidget2的build方法");

    return Card(
       color: Colors.red,
       child:  Consumer<CounterProvider>(
         builder: ((context, provider, child) {
            print("ShowDataWidget2 Consumer build方法被执行");
            return Text("点击数据 ${provider.counter}", style: TextStyle(fontSize: 30),);
         }))
    );
  }
}



/// MultiProvider
/// 多个Provider使用

class User {
  String name;
  int age;

  User(this.name,this.age);
}

class UserProvider extends ChangeNotifier {
  User _user = User("hehe", 18);
  
  set user(User user) {
    _user = user;
    notifyListeners();
  }

  User get user {
    return _user;
  }
}

class ShowDataWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("ShowDataWidget3的build方法");

    return Card(
       color: Colors.green,
       child:  Consumer2<CounterProvider, UserProvider>( // 多个Provider数据共享
         builder: ((context, counterProvider, userProvider, child) {
            print("ShowDataWidget3 Consumer build方法被执行");
            return Text("点击数据拼接 ${counterProvider.counter} , 昵称${userProvider.user.name}", style: TextStyle(fontSize: 20),);
         }))
    );
  }
}