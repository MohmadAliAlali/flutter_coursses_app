import 'package:flutter/material.dart';

class CustomClickText extends StatelessWidget {
  final VoidCallback onPressed;
  final Text text;
  final TextStyle? style;

  const CustomClickText({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: text
    );
  }
}