import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("列表展示"),
      // ),
      body: CustomScrollDemo3(),
    );
  }
}

class CustomScrollDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 交叉轴的item个数
              childAspectRatio: 1, // 子Widget的宽高比
              mainAxisSpacing: 10, // 主轴的间距 横向
              crossAxisSpacing: 10, // 交叉轴的间距 竖向
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            },
            
            ),
          ),
        )
      ],
    );
  }
}

class CustomScrollDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 交叉轴的item个数
              childAspectRatio: 1, // 子Widget的宽高比
              mainAxisSpacing: 10, // 主轴的间距 横向
              crossAxisSpacing: 10, // 交叉轴的间距 竖向
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            }),
          ),
        )
      ],
    );
  }
}


class CustomScrollDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          // floating: true,
          // snap: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Hello Hello"),
            background: Image(
              image: NetworkImage(
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
       SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 交叉轴的item个数
              childAspectRatio: 1.5, // 子Widget的宽高比
              mainAxisSpacing: 10, // 主轴的间距 横向
              crossAxisSpacing: 10, // 交叉轴的间距 竖向
            ),
            delegate:SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            },
            childCount: 20,
            ),

          ),

          SliverFixedExtentList(
             itemExtent: 50.0,

            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {

              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            },
            childCount: 20,
            )
          )
      ],
    );
  }
}