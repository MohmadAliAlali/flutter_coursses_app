import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';

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
    this.color = GlobalColor.greenColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}