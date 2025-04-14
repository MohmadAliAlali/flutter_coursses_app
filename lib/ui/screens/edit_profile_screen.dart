import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/controllers/edit_controller.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final EditController registerController = Get.find();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _berthDayController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _spisialzeController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GlobalTextStyle.text18Black700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(22.w, 20.h, 26.w, 0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoursersTextField(
                controller: _nameController,
                text: 'Name', // Add this required parameter
                hintText: 'Enter your name',
              ),
              CoursersTextField(
                controller: _berthDayController,
                text: 'Birth Day', // Add this required parameter
                hintText: 'Enter your birth date',
              ),
              CoursersTextField(
                controller: _universityController,
                text: 'University', // Add this required parameter
                hintText: 'Enter your university',
              ),
              CoursersTextField(
                controller: _spisialzeController,
                text: 'Specialization', // Add this required parameter
                hintText: 'Enter your specialization',
              ),
              CoursersTextField(
                controller: _yearController,
                text: 'Year', // Add this required parameter
                hintText: 'Enter your year',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Password',
                    style: GlobalTextStyle.text16Black400,
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text('Change Password',
                      style: GlobalTextStyle.text16Black700,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}