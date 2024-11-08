import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';

class GlobalTextStyle {
  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: GlobalColor.textColor,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
    color: GlobalColor.textColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: GlobalColor.textColor,
  );
  static const TextStyle btnText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: GlobalColor.buttonTextColor,
  );
}