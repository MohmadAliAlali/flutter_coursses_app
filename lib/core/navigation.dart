import 'package:flutter/material.dart';

class Navigation {
  static void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static void navigateAndRemove(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}