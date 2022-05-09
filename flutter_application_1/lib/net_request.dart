

import 'package:flutter/material.dart';

import 'networks/http_request.dart';

class NetRequestDemo extends StatefulWidget {
 
  @override
  State<NetRequestDemo> createState() => _NetRequestDemoState();
}

class _NetRequestDemoState extends State<NetRequestDemo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('开始数据请求');

    // get
    HttpRequest.getRequest("https://httpbin.org/get", params: {'name': "张三", 'age': 18}).then((res) {
         print(res);
    });

    // post
    // HttpRequest.postRequest("https://httpbin.org/post", params: {'name': "张三", 'age': 18}).then((res) {
    //      print(res);
    // });


   print('结束数据请求');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("请求数据"),
      ),    
      body: Center(
        child: Text('打印'),
      ),
    );
  }
}