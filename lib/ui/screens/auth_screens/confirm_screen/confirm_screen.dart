import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/core/navigation.dart';
import 'package:project_stud/ui/screens/auth_screens/info_set_screen/info_set_screen.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_click_text.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';


class ConfirmScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.backgroundPage,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Verification 📩',style: GlobalTextStyle.subheading,),
            const SizedBox(height: 20,),
            const Text('Enter your  Verification Code',style: GlobalTextStyle.body,),
            const SizedBox(height: 30,),
            const SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFieldConfirm(controller: _nameController),
                CustomTextFieldConfirm(controller: _nameController),
                CustomTextFieldConfirm(controller: _nameController),
                CustomTextFieldConfirm(controller: _nameController)
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Didn’t Receive a Code ? ',style: GlobalTextStyle.body,),
                CustomClickText(onPressed: (){
                }, text:'Click to Resend ')
              ],
            ),
            const SizedBox(height: 30,),
            CustomButton(onPressed: (){
              Navigation.navigateTo(context, InfoSetScreen());
            }, child: const Text('Verify',style: GlobalTextStyle.btnText,)),
          ],
        ),
      ),
    );
  }
}
