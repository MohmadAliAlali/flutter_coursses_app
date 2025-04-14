import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/controllers/login_controller.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_click_text.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: GlobalColor.waiteBG,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              Text('Welcome Back 👋', style: GlobalTextStyle.text18Black700),
              SizedBox(height: 16.h,),
              Text('Enter your  account information', style: GlobalTextStyle.text16Black400),
              SizedBox(height: 16.h),
              CoursersTextField(
                text: 'Email Address',
                controller: _mobileController,
                hintText: 'Enter email address number',
              ),
              SizedBox(height: 20.h),
              CoursersTextField(
                text: 'Password',
                controller: _passwordController,
                hintText: 'Enter your password',
              ),
              Padding(
                padding: EdgeInsets.only(left: 200.w),
                child: CustomClickText(
                    onPressed: () async{
                      Get.toNamed('/forgetPage');
                    },
                    text: Text('Forget Password?',
                      style: GlobalTextStyle.text16Orange700,
                    )
                ),
              ),
              Obx(() {
                return Padding(
                  padding: EdgeInsets.only(top: 32.h,bottom: 48.h),
                  child: CustomButton(
                    width: 345.w,
                    height: 50.h,
                    onPressed: loginController.isLoading.value
                        ?() {
                    }
                        : () async{
                      if (_formKey.currentState!.validate()) {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        loginController.login(
                            _mobileController.text,
                            _passwordController.text,);
                        prefs.setString('email', _mobileController.text);
                      }
                    },
                    child: loginController.isLoading.value
                        ? const CircularProgressIndicator()
                        :  Text('LOGIN', style: GlobalTextStyle.text16BlueLight700),
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t Have An Account ? ',
                    style: GlobalTextStyle.text16Black700,
                  ),
                  CustomClickText(
                      onPressed: (){
                        Get.toNamed('/register');
                      },
                      text: Text('Sign UP',
                        style: GlobalTextStyle.text16Orange700,
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
