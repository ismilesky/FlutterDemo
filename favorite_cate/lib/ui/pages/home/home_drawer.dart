
import 'package:flutter/material.dart';

import 'package:favorite_cate/core/extension/int_extension.dart';

import '../filter/filter.dart';

class FCHomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.px,
        child: Drawer(
          child: Column(
            children: <Widget>[
              _buildHeaderView(context),
              _buildListTile(context, Icon(Icons.restaurant), "进餐", () {
                Navigator.of(context).pop();
              }),
              _buildListTile(context, Icon(Icons.settings), "过滤", () {
                Scaffold.of(context).openEndDrawer();
                Navigator.of(context).pushNamed(FCFilterScreen.routeName);
              }),
            ],
          ),

        )
    );
  }

  Widget _buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      // color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
      child: Text("设置", style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget _buildListTile(BuildContext context, Widget icon, String title, void Function()? handler) {
    return ListTile(
      leading: icon,
      title: Transform(
              transform: Matrix4.translationValues(-16.px, 0.0, 0.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16.px)),
              ),
       trailing: Icon(Icons.keyboard_arrow_right),
      onTap: handler,     
    );
  }

  Widget _buildItem(Widget icon, String title, void Function()? handler) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left
          Container(
            padding: EdgeInsets.all(10.px),
            child: Row(
              children:[
                icon,
                SizedBox(width: 15.px),
                Text(title, style: TextStyle(fontSize: 18.px),)
              ],
            ),
          ),

          // right
          Container(
            padding: EdgeInsets.all(10.px),
            child: Row(
              children: [
                // Text('eeddd'),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),

        ],
      );
  }
}