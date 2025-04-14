import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_text_style.dart';

class GlobalText {
  static Text welcomeSKIP = Text('SKIP',style: GlobalTextStyle.text16Black400,);
  static Text welcomeTitle = Text('Lorem ipsum dolor sit amet',style: GlobalTextStyle.text18Black700,);
  static Text welcomeDescription = Text('Lorem ipsum dolor sit amet consectetur.Accumsan scelerisque viverra conguemattis purus. Sed urna aliquet pulvinarmauris donec ',
    style: GlobalTextStyle.text16Black400,
    textAlign: TextAlign.center,
  );
  static Text confirmResend = Text('Click to Resend',style: GlobalTextStyle.text16Orange700,);
  static Text confirmResendClicked = Text('Click to Resend',style: GlobalTextStyle.text16Black700,);
  static Text confirmLogin = Text('Log in',style: GlobalTextStyle.text16Orange700,);


}