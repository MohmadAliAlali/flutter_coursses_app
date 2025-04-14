import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/controllers/confirm_controller.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_click_text.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_stud/core/helper/respnsive.dart';

class ConfirmScreen extends StatelessWidget {
  final ConfirmController confirmController = Get.find();
  String? vCode; // This will store the verification code

  ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.waiteBG,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 95.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verification 📩',
              style: GlobalTextStyle.text18Black700,
            ),
            SizedBox(height: 20.h),
            Text(
              'Enter your Verification Code',
              style: GlobalTextStyle.text16Black400,
            ),
            SizedBox(height: 30.h),
            // ConfirmationCodeInput widget with onCompleted callback
            ConfirmationCodeInput(
              onCompleted: (code) {
                vCode = code; // Store the entered code in vCode
              },
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t Receive a Code? ',
                  style: GlobalTextStyle.text16Black400,
                ),
                Obx((){
                  return CustomClickText(
                    onPressed: confirmController.isClick.value ? (){}:
                        () async{
                          SharedPreferences prefs =await SharedPreferences.getInstance();
                          String? email = prefs.getString('email');
                          if (email != null && email.isNotEmpty) {
                            confirmController.resendCode(
                                email
                            );
                          }
                    },
                    text: confirmController.isClick.value ? GlobalText.confirmResendClicked:
                    GlobalText.confirmResend,
                  );
                }
                )
              ],
            ),
            SizedBox(height: 30.h),
            Obx(() {
              return CustomButton(
                onPressed: confirmController.isLoading.value
                    ? (){}
                    : () async{
                  SharedPreferences prefs =await SharedPreferences.getInstance();
                  String? email = prefs.getString('email');
                  if (vCode != null && vCode!.isNotEmpty &&email != null && email.isNotEmpty) {
                    confirmController.confirm(
                        email,
                        vCode!
                    );
                  }
                },
                child: confirmController.isLoading.value
                    ? const CircularProgressIndicator()
                    : Text(
                  'Verify',
                  style: GlobalTextStyle.text14blueLight400,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}