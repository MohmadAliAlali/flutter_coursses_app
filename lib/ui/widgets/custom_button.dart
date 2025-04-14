import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/helper/respnsive.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color color;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = 329,
    this.height = 50,
    this.color = GlobalColor.green,
  });

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: width.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: child,
      ),
    );
  }
}