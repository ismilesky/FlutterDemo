import 'package:flutter/material.dart';



class RouterAnimation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Animation基本动画"),
      ),
      body:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          ElevatedButton(
            child: Text("modal方式跳转"), // ios present
            onPressed: () => _modal(context), // 
          ),
          ElevatedButton(
            child: Text("渐变方式跳转"),
            onPressed: () => _fade(context), // FadeTransition,
          ),
         
        ],
      )),    
    );
  }

  void _modal(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
           builder: (ctx) {
             return SecondPage();
          },
           fullscreenDialog: true
         ));
  }

  void _fade(BuildContext context) {
     Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (ctx, animation1, animation2) {
              return FadeTransition(
                opacity: animation1,
                child: SecondPage(),
              );
            }
          ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Container(
        child: Center(
          child:
              Text("SecondPage", style: TextStyle(fontSize: 20, color: Colors.black12)),
        ),
      ),
    );
  }
}