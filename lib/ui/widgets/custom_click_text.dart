import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';

class CustomClickText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const CustomClickText({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = GlobalColor.clickTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}