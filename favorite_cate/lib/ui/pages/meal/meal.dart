import 'package:flutter/material.dart';

import '../../../core/model/category_model.dart';
import 'meal_content.dart';


class FCMealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as FCCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title ?? "列表"),
      ),
      body: FCMealContent(),
    );
  }
}