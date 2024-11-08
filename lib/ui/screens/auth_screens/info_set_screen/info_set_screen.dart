import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/core/navigation.dart';
import 'package:project_stud/core/state_manager.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:project_stud/ui/screens/bottom_navbar.dart';

class InfoSetScreen extends StatelessWidget {
  InfoSetScreen({super.key});
  final TextEditingController _specializationController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.backgroundPage,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 88),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('Personal Information 🏫',style: GlobalTextStyle.subheading,),
            const SizedBox(height: 20,),
            const Text('Enter your Personal Information',style: GlobalTextStyle.body,),
            const SizedBox(height: 16,),
            CustomTextField(
              text: 'University',
              controller: _universityController,
              hintText: 'Enter your University',
              suffixIcon: Icons.arrow_forward_ios,
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              text: 'Specialization',
              controller: _specializationController,
              hintText: 'Enter your specialty',
              suffixIcon: Icons.arrow_forward_ios,
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              text: 'Year',
              controller: _yearController,
              hintText: 'Enter your year',
              suffixIcon: Icons.arrow_forward_ios,
            ),
            const SizedBox(height: 30,),
            CustomButton(onPressed: (){
              Navigation.navigateAndRemove(context, const BottomNavBarDemo());
              AppState.login();
            }, child: const Text('NEXT',style: GlobalTextStyle.btnText,)),
          ],
        ),
      ),
    );
  }
}
