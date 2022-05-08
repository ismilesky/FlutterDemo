
import 'package:flutter/material.dart';
import 'package:flutter_douban_demo/components/rate_star.dart';

import '../../components/dashed_line.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        // child: RateStar(rating: 8),
        child: Text("首页", style: TextStyle(fontSize: 30),
      ),
      ),
    );
  }

  Widget getDashLine() {
    return Container(
      width: 1,
      height: 100,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 6,
        dashedWidth: .5,
        count: 12,
      ),
    );
  }
}