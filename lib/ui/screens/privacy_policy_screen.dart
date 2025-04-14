import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';

String data = """Lorem ipsum dolor sit amet consectetur. Viverra vivamus erat commodo non morbi elit viverra lorem. Tristique commodo augue est pulvinar mollis. Nulla urna iaculis sem nam molestie feugiat egestas. Odio nullam dapibus elementum viverra risus posuere ornare sed pretium. Et eleifend tempus vel lorem. Convallis volutpat magna fames in egestas.
Lorem ipsum dolor sit amet consectetur. Viverra vivamus erat commodo non morbi elit viverra lorem. Tristique commodo augue est pulvinar mollis. Nulla urna iaculis sem nam molestie feugiat egestas. Odio nullam dapibus elementum viverra risus posuere ornare sed pretium. Et eleifend tempus vel lorem. Convallis volutpat magna fames in egestas.\n\n
Lorem ipsum dolor sit amet consectetur. Viverra vivamus erat commodo non morbi elit viverra lorem. Tristique commodo augue est pulvinar mollis. Nulla urna iaculis sem nam molestie feugiat egestas. Odio nullam dapibus elementum viverra risus posuere ornare sed pretium. Et eleifend tempus vel lorem. Convallis volutpat magna fames in egestas.
""";
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy",style: GlobalTextStyle.text18Black700,),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.w, 40.h, 28.w, 30.h),
        child: Text(data,style: GlobalTextStyle.text14blueLight400.copyWith(color: GlobalColor.black1),),
      ),
    );
  }
}
