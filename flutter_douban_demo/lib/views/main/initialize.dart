
import 'package:flutter/material.dart';

import '../home/home.dart';
import '..//mine/mine.dart';
import '../group/group.dart';
import '../main/bottom_bar_item.dart';
import '../mall/mall.dart';
import '../subject/subject.dart';

// 底部tabbar分类
List<DPBottomBarItem> items = [
  DPBottomBarItem(iconName: "home", title: "首页"),
  DPBottomBarItem(iconName: "subject", title: "书影音"),
  DPBottomBarItem(iconName: "group", title: "小组"),
  DPBottomBarItem(iconName: "mall", title: "市集"),
  DPBottomBarItem(iconName: "profile", title: "我的"),
];


// 导航页面
List<Widget> pages = [
   Home(),
   Subject(),
   Group(),
   Mall(),
   Mine()
];
