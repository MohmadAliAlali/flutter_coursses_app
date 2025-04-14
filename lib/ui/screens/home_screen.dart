import 'package:flutter/material.dart';
import 'package:project_stud/controllers/home_controller.dart';
import 'package:project_stud/controllers/subject_controller.dart';
import 'package:project_stud/core/constants/global_color.dart';
import 'package:project_stud/core/constants/global_icons.dart';
import 'package:project_stud/core/constants/global_text_style.dart';
import 'package:project_stud/core/helper/respnsive.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  // final TextEditingController _searchController = TextEditingController();

  final List<String> images = [
    'assets/images/Frame 51.png',
    'assets/images/Frame 51.png',
    'assets/images/Frame 52.png',
  ];

  final List<String> overlayTexts = [
    "Step design sprint for ",
    "Basic skill for sketch ",
    "Apps with Firebase",
  ];

  final List<String> avatarImages = [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
  ];
  final SubjectController subjectController = Get.put(SubjectController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("hello ,Rami", style: GlobalTextStyle.text16Black400),
          actions: [GlobalIcons.notification],
          actionsPadding: const EdgeInsets.only(right: 20),
          backgroundColor: GlobalColor.waiteBG,
        ),
        backgroundColor: GlobalColor.waiteBG,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => CarouselSlider(
                    items: images.asMap().entries.map((entry) {
                      int index = entry.key;
                      String image = entry.value;
                      double translateOffset =
                          index == controller.currentIndex.value
                              ? -25.0
                              : -30.0;
                      double opacity =
                          controller.currentIndex.value == index ? 1.0 : 0.5;
                      return Opacity(
                        opacity: opacity,
                        child: Transform.translate(
                          offset: Offset(translateOffset, 0),
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(() => const DetailScreen());
                            },
                            child: Container(
                              width: 280.w,
                              margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 0.w, bottom: 0.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 20.h,
                                      width: 77.w,
                                      margin: EdgeInsets.only(
                                          top: 15.h, left: 15.w),
                                      decoration: BoxDecoration(
                                        color: GlobalColor.orange1,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "Free Videos",
                                        style: GlobalTextStyle.text16Black400
                                            .copyWith(fontSize: 12.f),
                                      ),
                                    ),
                                    SizedBox(height: 14.h),
                                    Container(
                                      width: 330.w,
                                      height: 50.h,
                                      padding: EdgeInsets.only(left: 20.w),
                                      decoration: BoxDecoration(
                                          color: const Color(0xdddcdbdb),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(28.r),
                                              bottomRight:
                                                  Radius.circular(28.r))),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage(avatarImages[index]),
                                            radius: 20,
                                          ),
                                          const SizedBox(width: 7),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  overlayTexts[index],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.black,
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 190.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "John Doe",
                                                        style: GlobalTextStyle
                                                            .text16Black700
                                                            .copyWith(
                                                                fontSize: 11.f),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons.access_time,
                                                              color: GlobalColor
                                                                  .gray1,
                                                              size: 15),
                                                          const SizedBox(
                                                              width: 5),
                                                          Text('15 m',
                                                              style: GlobalTextStyle
                                                                  .text16Black400
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12.f)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 250.0.h,
                      initialPage: 0,
                      enlargeFactor: 0.25,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                    ),
                  )),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => controller.currentIndex.value = entry.key,
                        child: Container(
                          width: controller.currentIndex.value == entry.key
                              ? 20.0
                              : 15.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: controller.currentIndex.value == entry.key
                                ? GlobalColor.orange2
                                : GlobalColor.gray1.withAlpha(80),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
                child: Text(
                  'Last Subjects Studied',
                  style: GlobalTextStyle.text16Black400,
                ),
              ),
              Obx(() {
                if (subjectController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (subjectController.subjectList.isEmpty) {
                  return const Center(child: Text('No subjects available'));
                }

                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subjectController.subjectList.length,
                    itemBuilder: (context, index) {
                      final subject = subjectController.subjectList[index];
                      return Container(
                        height: 80.h,
                        margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.w),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/icon.png'),
                                fit: BoxFit.contain,
                                alignment: Alignment.centerLeft,
                                opacity: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            color: GlobalColor.blueLight3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 100.0.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(subject.title,
                                      style: GlobalTextStyle.text16BlueLight700
                                          .copyWith(
                                              fontSize: 25.f,
                                              color: GlobalColor.textColor)),
                                  Text(
                                    subject.description,
                                    style: GlobalTextStyle.text16BlueLight700
                                        .copyWith(color: GlobalColor.textColor),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: GlobalColor.orange1,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border(
                                      right: BorderSide(
                                          color: GlobalColor.green,
                                          width: 5.w),
                                      left: BorderSide(
                                          color: GlobalColor.green,
                                          width: 5.w))),
                              child: Center(
                                  child: Text(
                                '12',
                                style: GlobalTextStyle.text16BlueLight700
                                    .copyWith(fontSize: 35.f),
                              )),
                            )
                          ],
                        ),
                      );
                    },
                );
              }),
              SizedBox(
                height: 25.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
