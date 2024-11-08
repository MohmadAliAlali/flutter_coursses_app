import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/core/navigation.dart';
import 'package:project_stud/ui/screens/auth_screens/confirm_screen/confirm_screen.dart';
import 'package:project_stud/ui/screens/auth_screens/login_screen/login_screen.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_click_text.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.backgroundPage,
        body:SingleChildScrollView(
        padding: const EdgeInsets.only(top: 121),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Create Your Account 👋 ',style: GlobalTextStyle.subheading,),
            const SizedBox(height: 20,),
            const Text('Enter your account information',style: GlobalTextStyle.body,),
            const SizedBox(height: 16,),
            CustomTextField(
              text: 'Name',
              controller: _nameController,
              hintText: 'Enter your name',
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              text: 'Mobile number',
              controller: _mobileController,
              hintText: 'Enter your mobile number',
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              text: 'Password',
              controller: _passwordController,
              hintText: 'Enter your password',
            ),
            const SizedBox(height: 20,),
            CustomTextField(
              text: 'Confirmed Password',
              controller: _confirmPasswordController,
              hintText: 'Renter your password',
            ),
            const SizedBox(height: 25,),
            CustomButton(onPressed: (){
              Navigation.navigateTo(context, ConfirmScreen());
            }, child: const Text('SIGNUP',style: GlobalTextStyle.btnText,)),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have An Account ? ',style: GlobalTextStyle.body,),
                CustomClickText(onPressed: (){
                  Navigation.navigateTo(context,  LoginScreen());
                }, text:'Log in')
              ],
            )

          ],
        ),
      )
    );
  }



  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}