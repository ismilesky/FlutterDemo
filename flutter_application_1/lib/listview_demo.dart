
import 'package:flutter/material.dart';

import 'model/car.dart';

class ListViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表展示"),
      ),
      body: ListViewDemo3(),
    );
  }
}

class ListViewDemo1 extends StatelessWidget {

  Widget _itemForRow(BuildContext context, int index) {
     return Container(
       color: Colors.green,
       margin: EdgeInsets.all(10),
       child: Column(
         children: [
            Image.network(datas[index].imageUrl),
            SizedBox(height: 10),
            Text(datas[index].name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0
            ),
            )      
         ],
       ),
     ) ;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: datas.length,
        itemBuilder: _itemForRow);
  }
}


class ListViewDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(100, (index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.delete),
            title: Text("联系人${index + 1}"),
            subtitle: Text("联系电话：18181038373"),
          );
        }),
      );
  }
}

class ListViewDemo3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    itemCount: 100,
    itemBuilder: (BuildContext context, int index) {
      return Text("Hello World");
    }, 
    separatorBuilder: (BuildContext context, int index) {
      return Divider(
        color: Colors.red, 
        height: 20,
        indent: 10,
        thickness: 10,
      );
    }, 
    );
  }
}


// 数据
final List<Car> datas = [
  
  Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
  Car('保时捷918 Spyder2', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
  Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
  Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
  Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
    Car('保时捷918 Spyder', 'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240')
];
