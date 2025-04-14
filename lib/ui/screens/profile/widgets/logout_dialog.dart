import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';


class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

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
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 49.0.w),
                  child: Text(
                    'Are you sure you want to exit the application?',
                    style: GlobalTextStyle.text18Black700,
                  ),
                ),
                SizedBox(height: 48.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: 72.w,
                      height: 52.h,
                      child: Text('NO',
                          style: GlobalTextStyle.text16Black700
                              .copyWith(color: GlobalColor.whiteFont)),
                      onPressed: () => Get.back(),
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    CustomButton(
                      color: GlobalColor.orange2,
                      width: 72.w,
                      height: 52.h,
                      child: Text(
                        'Yes',
                        style: GlobalTextStyle.text16Black700,
                      ),
                      onPressed: () {
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
