import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/screens/profile/widgets/Profile_button.dart';
import 'package:project_stud/ui/screens/profile/widgets/change_language_dialog.dart';
import 'package:project_stud/ui/screens/profile/widgets/logout_dialog.dart';

import '../../../core/constants/global_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0.w, 20.h, 24.w, 0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ,Reaam👋',
                style: GlobalTextStyle.text18Black700,
              ),
              SizedBox(
                height: 103.h,
              ),
              Container(
                width: 348.w,
                height: 158.h,
                decoration: BoxDecoration(
                    color: GlobalColor.blueLight1,
                    borderRadius: BorderRadius.circular(16.r)),
              ),
              SizedBox(
                height: 20.h,
              ),
              ProfileButton(onPressed: () {
                // Get.toNamed('/editPage');
                Get.toNamed('/login');
              }, text: 'Edit Profile'),
              SizedBox(
                height: 20.h,
              ),
              ProfileButton(
                  onPressed: () => changeLanguageDialog(),
                  text: 'Change Language'),
              SizedBox(
                height: 20.h,
              ),
              ProfileButton(onPressed: () {
                Get.toNamed('/policyPage');
              }, text: 'Privacy Policy'),
              SizedBox(
                height: 20.h,
              ),
              ProfileButton(
                  onPressed: () {
                    Get.toNamed('/helpPage');
                  },
                  text: 'Help Center'),
              SizedBox(
                height: 20.h,
              ),
              ProfileButton(
                  onPressed: () => showLogoutDialog(), text: 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
  void showLogoutDialog() {
    Get.dialog(
        const LogoutDialog()
    );
  }
  void changeLanguageDialog() {
    Get.dialog(
         const ChangeLanguageDialog()
    );
  }
}
