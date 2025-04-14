import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_icons.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/core/helper/state_manager.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';


class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: 347.w, // عرض ثابت
          height: 197.h,
          // margin: EdgeInsets.fromLTRB(11.w,12.h,60.w,0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(11.w, 12.h, 11.w, 0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 0.0.w),
                  child: Text(
                    'Select Language',
                    style: GlobalTextStyle.text18Black700,
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      // width: 72.w,
                      color: Colors.transparent,
                      height: 52.h,
                      child: Row(
                        children: [
                          AppState.language == "arabic"
                              ?  GlobalIcons.radioButton
                              :  GlobalIcons.radioButtonUnClick,
                          SizedBox(
                            width: 20.w,
                          ),
                          Text('Arabic',
                              style: GlobalTextStyle.text16Black700.copyWith(
                                  color: AppState.language == "arabic"
                                      ? GlobalColor.green
                                      : GlobalColor.black1)),
                        ],
                      ),
                      onPressed: () {
                        print(AppState.language);
                        AppState.changeLanguage('arabic');
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    CustomButton(
                      color: Colors.transparent,
                      // width: ,
                      height: 52.h,
                      child: Row(
                        children: [
                          AppState.language == "english"
                              ?  GlobalIcons.radioButton
                              :  GlobalIcons.radioButtonUnClick,
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            'English',
                            style: GlobalTextStyle.text16Black700.copyWith(
                              color: AppState.language == "english"
                                  ? GlobalColor.green
                                  : GlobalColor.black1,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        AppState.changeLanguage('english');
                        Get.back();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
