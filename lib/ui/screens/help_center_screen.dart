import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';

class HelpCenterScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.waiteBG,
      appBar: AppBar(
        backgroundColor: GlobalColor.waiteBG,
        title: Text('Help Center',style: GlobalTextStyle.text18Black700,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 26.h, 22.w, 0.w),
          child: Column(
            children: [
              CoursersTextField(
                controller: _titleController,
                text: 'Title',
                hintText: '',
              ),
              CoursersTextField(
                height: 236,
                maxL: 10,
                minL: 10,
                keyboardType:  TextInputType.multiline,
                controller: _descriptionController,
                text: 'Subject',
                hintText: '',
              ),
              SizedBox(height: 32.h,),
              CustomButton(
                height: 52.h,
                onPressed: () {  },
                child: Text(
                  'SUBMIT',
                  style: GlobalTextStyle.text14BlueLight700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
