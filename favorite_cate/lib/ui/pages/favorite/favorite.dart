
import 'package:favorite_cate/ui/pages/favorite/favorite_content.dart';
import 'package:flutter/material.dart';

class FCFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ζηζΆθ"),
      ),
      body: FCFavoriteContent(),
    );
  }
}