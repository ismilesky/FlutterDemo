import 'package:flutter/material.dart';

class FCHomeAppBar extends AppBar {
  FCHomeAppBar(BuildContext context)
      : super(
          title: Text("美食列表"),
          leading: Builder(
            // 自定义设置
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu));
            },
          ),
        );
}
