import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/controllers/forget_controller.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';



class RestPasswordScreen extends StatelessWidget {
  RestPasswordScreen({super.key});
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _codeController = TextEditingController();
  String? vCode;
  final ForgetController forgetController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Password',style: GlobalTextStyle.text18Black700,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.e),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Enter code from email and new password',
                  style: GlobalTextStyle.text16Black400,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CoursersTextField(
                    controller: _passwordController,
                    hintText: 'Enter new password ',
                    text: 'Password'
                ),
                const Text('Enter virfy code'),
                SizedBox(height: 10.h,),
                ConfirmationCodeInput(
                  onCompleted: (code) {
                    vCode = code; // Store the entered code in vCode
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.only(top: 32.h,bottom: 48.h),
                    child: CustomButton(
                      width: 345.w,
                      height: 50.h,
                      onPressed: forgetController.isClick.value
                          ?() {
                      }
                          : () async{
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          String? email = prefs.getString('email');
                          forgetController.restPassword(
                            email!,
                            _passwordController.text,
                            vCode!,

                          );

                        }
                      },
                      child: forgetController.isClick.value
                          ? const CircularProgressIndicator()
                          :  Text('LOGIN', style: GlobalTextStyle.text16BlueLight700),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
