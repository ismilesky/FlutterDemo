import 'package:favorite_cate/core/extension/double_extension.dart';
import 'package:flutter/material.dart';

import 'package:favorite_cate/core/extension/int_extension.dart';

class FCOperationItem extends StatelessWidget {
  Widget _icon;
  String _title;

  FCOperationItem(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.px),
      child: Row(
        children: <Widget>[
          _icon,
          SizedBox(width: 3.px,),
          Text(_title)
        ],
      ),
    );
  }
}