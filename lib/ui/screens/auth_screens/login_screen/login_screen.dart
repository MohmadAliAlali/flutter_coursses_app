import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/core/respnsive.dart';
import 'package:project_stud/repositories/user_repository.dart';
import 'package:project_stud/ui/screens/home_screen.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository authController = Get.put(UserRepository());
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 91.h)),
            Image.asset(
              'assets/images/near.png',
              width: 113.w,
              height: 113.h,
            ),
            SizedBox(height: 20.h),
            Text('Welcome Back 👋', style: TextStyle(fontSize: 24.w)),
            SizedBox(height: 16.h),
            CustomTextField(
              text: 'Mobile number',
              controller: _mobileController,
              hintText: 'Enter your mobile number',
            ),
            SizedBox(height: 20.h),
            CustomTextField(

              text: 'Password',
              controller: _passwordController,
              hintText: 'Enter your password',
            ),
            SizedBox(height: 20.h),
            Obx(() {
              return CustomButton(
                width: 345.w,
                height: 48.h,
                onPressed: authController.isLoading.value
                    ?() {
                }
                    : () {
                  authController.loginFun(
                    _mobileController.text,
                    _passwordController.text,
                  );
                  Get.to(const HomeScreen());
                },
                child: authController.isLoading.value
                    ? const CircularProgressIndicator()
                    :  Text('LOGIN', style: TextStyle(fontSize: 16.w)),
              );
            })
          ],
        ),
      ),
    );
  }
}
