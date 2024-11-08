import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/navigation.dart';
import 'package:project_stud/core/respnsive.dart';
import 'package:project_stud/core/state_manager.dart';
import 'package:project_stud/ui/screens/auth_screens/login_screen/login_screen.dart';
import 'package:project_stud/ui/screens/bottom_navbar.dart';
import 'dart:async';

import 'package:project_stud/ui/screens/intro_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  Future<void> autoLogin() async {
    AppState.init();
    Timer(const Duration(seconds: 4), () {
      if (AppState.isNotFirstUse) {
      Navigation.navigateAndRemove(context,const  IntroScreens());
      } else if(AppState.isLoggedIn) {
        Navigation.navigateAndRemove(context,const  BottomNavBarDemo());
      }else{
        Navigation.navigateAndRemove(context,  LoginScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: GlobalColor.waiteGreenColor,
          body: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 157.w,
              height: 156.h,
            ),
          ),
    );
  }
}