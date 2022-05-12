import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ThemeDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ThemeAPPDemo();
  }
}

// 主题基本使用
class ThemeAPPDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     /**
     * 1.一旦设置了主题, 那么应用程序中的某些Widget, 就会直接使用主题的样式
     * 2.可以通过Theme.of(context).textTheme.display2
     */

    // MaterialColor extends Color
    // 父类的引用指向一个子类的对象
//    Color color = Colors.orangeAccent;

    // 子类的引用指向父类的对象;
    // MaterialColor color = Color(0xff000000);

    return MaterialApp(
      title: 'Flutter Demo',
      // 全局主题
      theme: ThemeData(
        // 1.亮度
        brightness: Brightness.light,
        // 2.primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
        primarySwatch: Colors.red,
        // 3.primaryColor: 单独设置导航和TabBar的颜色
        primaryColor: Colors.orange,
        // 4.accentColor: 单独设置FloatingActionButton\Switch
        accentColor: Colors.green, // 被废弃
        colorScheme: Theme.of(context).colorScheme.copyWith(
           secondary: Colors.green,
           primary: Colors.orange
        ),

        // 5.Button的主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow
        ),
        // 6.Card的主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10
        ),
        // 7.Text的主题
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16, color: Colors.red),
          bodyText2: TextStyle(fontSize: 20),

          // display1: TextStyle(fontSize: 14),
          // display2: TextStyle(fontSize: 16),
          // display3: TextStyle(fontSize: 18),
          // display4: TextStyle(fontSize: 20),
        )
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"), // 默认bodyText2
            Text("Hello World", style: TextStyle(fontSize: 14),),
            Text("Hello World", style: TextStyle(fontSize: 20),),
            Text("Hello World", style: Theme.of(context).textTheme.bodyText2,),
            Text("Hello World", style: Theme.of(context).textTheme.displayMedium,),
            Switch(value: true, onChanged: (value) {},),
            CupertinoSwitch(value: true, onChanged: (value) {}, activeColor: Colors.red,),
            // RaisedButton(child: Text("R"), onPressed: () {},), // 废弃
            Card(child: Text("哈哈，卡片啊", style: TextStyle(fontSize: 40),),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "首页",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "分类",
              icon: Icon(Icons.category)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) {
              return DetailPage();
            }
          ));
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      // ThemeData(primaryColor: Colors.purple) 重新设置，以往设置的重置
      data: Theme.of(context).copyWith(
        primaryColor: Colors.purple
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text("detail pgae"),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.pink
            )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}


// 关于主题模式适配相关
class ThemeDarkDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.norTheme,  //ThemeData.light(),
      darkTheme: AppTheme.darkTheme,//ThemeData.dark(),
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}


// 主题设置抽取
class AppTheme {
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static final Color norTextColors = Colors.red;
  static final Color darkTextColors = Colors.green;


  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.yellow,
    textTheme: TextTheme(
        // 默认字体
        bodyText2: TextStyle(fontSize: largeFontSize, color: norTextColors)
    )
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(

        bodyText2: TextStyle(fontSize: normalFontSize, color: darkTextColors)
    )
  );
}