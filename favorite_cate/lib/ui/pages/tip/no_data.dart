import 'package:flutter/material.dart';

class FCNoDataScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("暂无数据", style: TextStyle(fontSize: 16),),
                Image.asset("assets/images/no-data.png", )
                // width: 261.px, height: 200.px,
              ],
            ),
          );
  }
}