import 'package:flutter/material.dart';
import '../main/initialize.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '豆瓣Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent
      ),
      home: RootPage() //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RootPage extends StatefulWidget {

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // selectedFontSize: 12,
        // unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children:pages,
      )
    );
  }
}
