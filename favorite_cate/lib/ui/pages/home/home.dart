import 'package:flutter/material.dart';

import 'home_content.dart';
import 'package:favorite_cate/ui/shared/size_fit.dart';

class FCHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FCSizeFit.initialize();
    return Scaffold(
      appBar: AppBar(
        title: Text("美食列表"),
        leading: IconButton(
           onPressed: () {
             Scaffold.of(context).openDrawer();
           }, 
           icon: Icon(Icons.menu)
          )
      ),
      body: HomeContent()
    );
  }
}