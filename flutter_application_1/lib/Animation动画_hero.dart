import 'package:flutter/material.dart';

/**
 1.在第一个Page1中，定义一个起始的Hero Widget，被称之为source hero，并且绑定一个tag；
 2.在第二个Page2中，定义一个终点的Hero Widget，被称之为 destination hero，并且绑定相同的tag；
 3.可以通过Navigator来实现第一个页面Page1到第二个页面Page2的跳转过程；
 */

/** */

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9),
        children: List.generate(4, (index) {
          // 图片地址有时找不到图片出错
          final imageURL = "https://picsum.photos/500/500?random=${index+1}";
          return GestureDetector(
            onTap: () {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, anim1, anim2) {
                  return FadeTransition(
                    opacity: anim1,
                    child: ImageDetailPage(imageURL),);
                },
              ));
            },
            child: Hero(
              tag: imageURL, // tag不能重复
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String _imgUrl;

  ImageDetailPage(this._imgUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: _imgUrl, // tag不能重复
            child: Image.network(
              _imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
