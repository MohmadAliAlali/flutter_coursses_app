import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';

mixin CustomNavbarItem {
  static CurvedNavigationBarItem customNavbarItemByIcon(IconData clickIcon, IconData unclickIcon,String title,int selectedIndex , int index,){
    return CurvedNavigationBarItem(
        child: Icon(
          selectedIndex == index ? clickIcon : unclickIcon,
          size: 30,
          color: GlobalColor.waiteColor,
        ),
        label: title,
        labelStyle: GlobalTextStyle.btnText
    );
  }
  static CurvedNavigationBarItem customNavbarItemByImage(String clickIcon, String unclickIcon,String title,int selectedIndex , int index,){
    return CurvedNavigationBarItem(
        child: Image.asset(
          selectedIndex == index ? clickIcon: unclickIcon,
          color: GlobalColor.waiteColor,
        ),
        label: title,
        labelStyle: GlobalTextStyle.btnText
    );
  }
}