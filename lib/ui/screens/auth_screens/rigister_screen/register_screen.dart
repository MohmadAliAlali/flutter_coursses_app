import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/controllers/register_controller.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/constants/global_valid.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_click_text.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final RegisterController registerController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.waiteBG,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 121.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Create Your Account 👋 ',
                  style: GlobalTextStyle.text18Black700,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Enter your account information',
                  style: GlobalTextStyle.text16Black400,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Obx(
                  () => CoursersTextField(
                      text: 'Name',
                      controller: _nameController,
                      hintText: 'Enter your name',
                      validator: (value) => GlobalValid.validUserName(value),
                      errorMessage:
                          registerController.userNameError.value.isNotEmpty
                              ? registerController.userNameError.value
                              : null),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                CoursersTextField(
                  text: 'Email Address',
                  controller: _mobileController,
                  hintText: 'Enter your email address',
                  validator: (value) => GlobalValid.validEmail(value),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Obx(
                  () => CoursersTextField(
                      obscureText: true,
                      text: 'Password',
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      validator: (value) => GlobalValid.validPassword(value),
                      suffixIcon: Icons.remove_red_eye,
                      errorMessage:
                          registerController.passwordError.value.isNotEmpty
                              ? registerController.passwordError.value
                              : null),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Obx(() => CoursersTextField(
                  obscureText: true,
                    text: 'Confirmed Password',
                    controller: _confirmPasswordController,
                    hintText: 'Renter your password',
                    validator: (value) => GlobalValid.validPassword(value),
                    suffixIcon: Icons.remove_red_eye,
                    errorMessage:
                        registerController.passwordError.value.isNotEmpty
                            ? registerController.passwordError.value
                            : null)),
                SizedBox(
                  height: 15.h,
                ),
                Obx(() {
                  return CustomButton(
                      onPressed: registerController.isLoading.value
                          ? () {}
                          : () async{
                              if (_formKey.currentState!.validate()) {
                                SharedPreferences prefs =await SharedPreferences.getInstance();
                                registerController.register(
                                    _nameController.text,
                                    _passwordController.text,
                                    _confirmPasswordController.text,
                                    _mobileController.text);
                                prefs.setString('email', _mobileController.text);
                              }
                            },
                      child: registerController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Text(
                              'SIGNUP',
                              style: GlobalTextStyle.text14blueLight400,
                            ));
                }),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have An Account ? ',
                      style: GlobalTextStyle.text16Black400,
                    ),
                    CustomClickText(
                        onPressed: () {
                          Get.offNamed('login');
                        },
                        text: GlobalText.confirmLogin)
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
