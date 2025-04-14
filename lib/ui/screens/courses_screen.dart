import 'package:flutter/material.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.waiteBG,
      appBar: AppBar(
        title: Text(
          "Courses in Science",
          style: GlobalTextStyle.text18Black700,
        ),
        centerTitle: true,
      ),
      // body: ,
    );
  }
}
