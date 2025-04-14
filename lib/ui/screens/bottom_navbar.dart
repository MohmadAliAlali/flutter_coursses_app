import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_icons.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/ui/screens/home_screen.dart';
import 'package:project_stud/ui/screens/profile/profile_screen.dart';
import 'package:project_stud/ui/widgets/custom_navbar_item.dart';
import 'package:project_stud/ui/screens/product_screen.dart';

class BottomNavBarDemo extends StatefulWidget {
  const BottomNavBarDemo({super.key});

  @override
  BottomNavBarDemoState createState() => BottomNavBarDemoState();
}

class BottomNavBarDemoState extends State<BottomNavBarDemo> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const ProfileScreen(),
    HomeScreen(),
    const ProductListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        items: [
          CustomNavbarItem.customNavbarItemByImage(
              GlobalIcons.clickUser,
              GlobalIcons.unclickUser,
              'Profile',
              _selectedIndex,
              0
          ),
          CurvedNavigationBarItem(
              child: _selectedIndex == 1 ? GlobalIcons.clickHouse: GlobalIcons.clickHouse,
              label: 'Home',
              labelStyle: GlobalTextStyle.text16BlueLight400
          ),
          CustomNavbarItem.customNavbarItemByImage(
              GlobalIcons.clickHeart,
              GlobalIcons.unclickHeart,
              'Fav',
            _selectedIndex,
            2
          ),
        ],
        color: GlobalColor.green,
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: GlobalColor.waiteBG,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
