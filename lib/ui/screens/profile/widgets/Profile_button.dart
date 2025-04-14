


import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_icons.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';


class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final Color color;

  const ProfileButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 349,
    this.height = 48,
    this.color = GlobalColor.green,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: width,
      height: height,
      color: GlobalColor.orange2,
      onPressed: onPressed,
      child: Padding(
        padding:  EdgeInsets.only(left:18.w,right: 18.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyle(fontSize: 16.w),),
            GlobalIcons.arrowRight
          ],
        ),
      ),
    );
  }
}
