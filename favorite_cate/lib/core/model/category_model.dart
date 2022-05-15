import 'package:flutter/material.dart';

class FCCategoryModel {

  String? id;
  String? title;
  String? color;

  late Color finalColor;

  FCCategoryModel({this.id, this.title, this.color});

  FCCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    if (color != null) {
      // 将color转成16进制
      final colorInt = int.parse(color!, radix: 16);
      finalColor = Color(colorInt | 0xFF000000);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }

}