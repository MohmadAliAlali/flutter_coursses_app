import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';

mixin CustomNavbarItem {
  static CurvedNavigationBarItem customNavbarItemByIcon(IconData clickIcon, IconData unclickIcon,String title,int selectedIndex , int index,){
    return CurvedNavigationBarItem(
        child: Icon(
          selectedIndex == index ? clickIcon : unclickIcon,
          size: 30,
          color: GlobalColor.waiteBG,
        ),
        label: title,
        labelStyle: GlobalTextStyle.text14blueLight400
    );
  }
  static CurvedNavigationBarItem customNavbarItemByImage(Widget clickIcon, Widget unclickIcon,String title,int selectedIndex , int index,){
    return CurvedNavigationBarItem(
        child: selectedIndex == index ? clickIcon: unclickIcon,
        label: title,
        labelStyle: GlobalTextStyle.text14blueLight400
    );
  }
}