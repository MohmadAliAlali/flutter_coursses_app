import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/routes/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRouts.splash,
      getPages: AppRouts.routes,
      // home: VideoPlayerScreen(),
    );
  }
}
