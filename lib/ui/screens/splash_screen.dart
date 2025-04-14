import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/core/helper/state_manager.dart';
import 'dart:async';



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
      Get.offNamed('intro');
        // Get.offNamed('home');
      } else if(!AppState.isLoggedIn) {
        Get.offNamed('navPage');
        // Get.offNamed('home');
      }else{
        Get.offNamed('register');
        // Get.offNamed('home');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: GlobalColor.blueLight1,
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