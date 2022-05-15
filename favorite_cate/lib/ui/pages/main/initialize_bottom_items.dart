import 'package:flutter/material.dart';
import '../favorite/favorite.dart';
import '../home/home.dart';

final List<Widget> pages = [
  FCHomeScreen(),
  FCFavoriteScreen()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    label: "首页",
    icon: Icon(Icons.home),
    tooltip: "",
  ),
  BottomNavigationBarItem(
      label: "收藏",
      icon: Icon(Icons.star),
      tooltip: "",
  ),
];