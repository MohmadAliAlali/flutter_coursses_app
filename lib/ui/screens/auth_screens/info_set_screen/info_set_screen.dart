import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/controllers/info_controller.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/constants/global_valid.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';

// class InfoSetScreen extends StatelessWidget {
//   const InfoSetScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//             children: [
//               Text('data')
//             ],
//         ),
//       ),
//     );
//   }
// }

class InfoSetScreen extends StatelessWidget {
  InfoSetScreen({super.key});
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final InfoController _infoController = InfoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.waiteBG,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 88),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Personal Information 🏫',
                    style: GlobalTextStyle.text18Black700,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Enter your Personal Information',
                    style: GlobalTextStyle.text16Black400,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CoursersTextField(
                    text: 'University',
                    controller: _universityController,
                    hintText: 'Enter your University',
                    validator: (value)=>GlobalValid.validUserName(value),
                  ),
                  CoursersTextField(
                    text: 'Specialization',
                    controller: _specializationController,
                    hintText: 'Enter your specialty',
                    validator: (value)=>GlobalValid.validUserName(value),
                  ),

                  CoursersTextField(
                    text: 'Year',
                    controller: _yearController,
                    hintText: 'Enter your year',
                    validator: (value)=>GlobalValid.validUserName(value),

                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx((){
                    return CustomButton(
                        onPressed: _infoController.isLoading.value ? (){}:
                            () {
                          if (_formKey.currentState!.validate()) {
                            _infoController.setInfo(
                              _universityController.text,
                              _specializationController.text,
                              _yearController.text
                            );
                          }
                        },
                        child:_infoController.isLoading.value ?
                            const CircularProgressIndicator():
                        Text(
                          'NEXT',
                          style: GlobalTextStyle.text14blueLight400,
                        )
                    );
                  })

                ],
              ),
            ),
          ),
        ));
  }
}
