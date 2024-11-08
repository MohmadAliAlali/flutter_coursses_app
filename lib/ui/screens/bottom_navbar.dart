import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/ui/screens/home_screen.dart';
import 'package:project_stud/ui/widgets/custom_navbar_item.dart';
import 'package:project_stud/ui/screens/product_screen.dart';
import 'package:project_stud/ui/screens/years_screen.dart';

class BottomNavBarDemo extends StatefulWidget {
  const BottomNavBarDemo({super.key});

  @override
  BottomNavBarDemoState createState() => BottomNavBarDemoState();
}

class BottomNavBarDemoState extends State<BottomNavBarDemo> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    YearsScreen(),
    const ProductListView(),
     const HomeScreen(),
    const ProductListView(),
    const ProductListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        items: [
          CustomNavbarItem.customNavbarItemByImage(
              'assets/images/icons/click_years.png',
              'assets/images/icons/click_year.png',
              'Years',
              _selectedIndex,
              0
          ),
          CustomNavbarItem.customNavbarItemByImage(
              'assets/images/icons/click_subject.png',
              'assets/images/icons/unclick_subject.png',
              'Subjects',
              _selectedIndex,
              1
          ),
          CurvedNavigationBarItem(
              child: Icon(
                _selectedIndex == 2 ? Icons.home : Icons.home_outlined,
                size: 30,
                color: GlobalColor.waiteColor,
              ),
              label: 'Home',
              labelStyle: GlobalTextStyle.btnText
          ),
          CustomNavbarItem.customNavbarItemByImage(
              'assets/images/icons/click_profile.png',
              'assets/images/icons/unclick_profile.png',
              'Profile',
              _selectedIndex,
              3
          ),
          CustomNavbarItem.customNavbarItemByIcon(
              Icons.favorite,
              Icons.favorite_outline,
              'Fav',
            _selectedIndex,
            4
          ),
        ],
        color: GlobalColor.greenColor,
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: const Color(0x00ffffff),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
