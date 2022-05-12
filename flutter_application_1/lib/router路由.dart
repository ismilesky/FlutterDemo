import 'package:flutter/material.dart';

class RouterAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 命名路由,定义名称和路由之间的映射关系，类型为Map<String, WidgetBuilder>
      routes: {
        // "/detail": (ctx) => DetailPage()
        // 在开发中，为了让每个页面对应的routeName统一，
        // 我们通常会在每个页面中定义一个路由的常量来使用
        RouterDemo.routeName: (context) => RouterDemo(),
        OtherPage.routeName: (context) => OtherPage(),

        // DetailPage是有构造器的，不能在这个映射关系中创建，使用onGenerateRoute
        // DetailPage.routeName: (context) => DetailPage(),
      },
      // 当通过pushNamed进行跳转，但是对应的name没有在routes中有映射关系，
      // 那么就会执行onGenerateRoute
      onGenerateRoute: (settings) {
        // name: 跳转的路径名称 arguments：跳转时携带的参数
        if (settings.name == DetailPage.routeName) {
          return MaterialPageRoute(builder: (ctx) {
            return DetailPage(settings.arguments as String);
          });
        }
        return null;
      },

      // 路由不存在，跳转到一个统一的错误页面
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) {
          return UnknownPage();
        });
      },

      // 置应用程序从哪一个路由开始启动，设置了该属性，就不需要再设置home属性了
      initialRoute: RouterDemo.routeName,
      // home: RouterDemo(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

class RouterDemo extends StatefulWidget {
  // 在每个页面中定义一个路由的常量来使用
  static const String routeName = "/demo";

  @override
  State<RouterDemo> createState() => _RouterDemoState();
}

class _RouterDemoState extends State<RouterDemo> {
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由使用"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _message,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          ElevatedButton(
            child: Text("普通路由跳转详情页"),
            onPressed: () => _pushNext(context), // 普通路由导航
          ),
          ElevatedButton(
            child: Text("onGenerateRoute路由导航跳转详情页"),
            onPressed: () => _pushNext2(context), // onGenerateRoute路由导航,
          ),
          ElevatedButton(
            child: Text("命名路由跳转其他页"),
            onPressed: () => _pushOther(context), // 命名路由导航
          ),
          ElevatedButton(
            child: Text("跳转未知页"),
            onPressed: () => _pushUnknow(context), // 跳转未知页
          ),
        ],
      )),
    );
  }

  // 1. 普通的跳转方式
  void _pushNext(BuildContext context) async {
    // 前 => 后传值，构造器
    // 后 => 前传值，Navigator.of(context).pop("detail message");
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DetailPage("普通路由home message");
      }),
    );

    print("普通路由返回值: $result");

    setState(() {
      if (result != null) {
        _message = result;
      }
    });
  }

  // 2. 命名路由方式
  void _pushOther(BuildContext context) async {
    var result = await Navigator.of(context).pushNamed(OtherPage.routeName,
        arguments: "命名路由home message ") as String;
    print("命名路由返回值: $result");

    setState(() {
      if (result != null) {
        _message = result;
      }
    });
  }

  void _pushNext2(BuildContext context) async {
    var result = await Navigator.of(context).pushNamed(DetailPage.routeName,
        arguments: "命名路由 onGenerateRoute home message") as String;
    print("命名路由返回值: $result");

    setState(() {
      if (result != null) {
        _message = result;
      }
    });
  }

  void _pushUnknow(BuildContext context) {
    Navigator.of(context).pushNamed("/settings");
  }
}

class DetailPage extends StatelessWidget {
  // 在每个页面中定义一个路由的常量来使用
  static const String routeName = "/detail";

  final String message;

  DetailPage(this.message);

  @override
  Widget build(BuildContext context) {
    /// 如果详情页点击导航的返回按钮是默认没有传值操作的，需手动处理
    ///
    return WillPopScope(
      // 监听返回按钮的点击（给Scaffold包裹一个WillPopScope）
      onWillPop: () {
        Navigator.of(context).pop("detail message");
        // true: 系统会自动帮我们执行pop操作  false:自己监听
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),

          // 1. 自定义返回的按钮, 拦截返回事件
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.of(context).pop("detail message");
          //   },
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                child: Text("返回上一界面"),
                onPressed: () {
                  Navigator.of(context).pop("detail message");
                }),
          ],
        )),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  // 在每个页面中定义一个路由的常量来使用
  static const String routeName = "/other";

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as String;

    /// 如果详情页点击导航的返回按钮是默认没有传值操作的，需手动处理

    return WillPopScope(
      // 监听返回按钮的点击（给Scaffold包裹一个WillPopScope）
      onWillPop: () {
        Navigator.of(context).pop("about message");
        // true: 系统会自动帮我们执行pop操作  false:自己监听
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("其他页"),

          // 1. 自定义返回的按钮, 拦截返回事件
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.of(context).pop("detail message");
          //   },
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                child: Text("返回上一界面"),
                onPressed: () {
                  Navigator.of(context).pop("about message");
                }),
          ],
        )),
      ),
    );
  }
}

// 错误界面
class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      body: Container(
        child: Center(
          child:
              Text("页面跳转错误", style: TextStyle(fontSize: 20, color: Colors.red)),
        ),
      ),
    );
  }
}

/// 命名规范设计
class HRouter {
  static final Map<String, WidgetBuilder> routers = {
    RouterDemo.routeName: (context) => RouterDemo(),
    OtherPage.routeName: (context) => OtherPage(),
  };
  static const String initialRoute = RouterDemo.routeName;

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == DetailPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        return DetailPage(settings.arguments as String);
      });
    }
    return null;
  };

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory onUnknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return UnknownPage();
    });
  };
}
