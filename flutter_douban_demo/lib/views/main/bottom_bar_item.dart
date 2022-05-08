import 'package:flutter/material.dart';

class DPBottomBarItem extends BottomNavigationBarItem {
  DPBottomBarItem({required String iconName, required String title}) : 
  super( 
    icon: Image.asset("images/tabbar/$iconName.png", width: 30, gaplessPlayback: true,
),
    activeIcon: Image.asset("images/tabbar/${iconName}_active.png", width: 30,gaplessPlayback: true),
    label: title, tooltip: '');
  
}
