
import 'package:flutter/material.dart';

import 'filter_content.dart';

class FCFilterScreen extends StatelessWidget {
  static const String routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("过滤设置"),
      ),
      body: FCFilterContent(),
    );
  }
}