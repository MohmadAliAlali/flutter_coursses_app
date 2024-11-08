import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/core/navigation.dart';
import 'package:project_stud/core/respnsive.dart';
import 'package:project_stud/core/state_manager.dart';
import 'package:project_stud/ui/screens/auth_screens/login_screen/login_screen.dart';
import 'package:project_stud/ui/widgets/custom_button.dart';
import 'package:project_stud/ui/widgets/custom_click_text.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  IntroScreensState createState() => IntroScreensState();
}

class IntroScreensState extends State<IntroScreens> {
  int currentIndex = 0;
  late PageController _pageController;

  final List<Map<String, String>> screens = [
    {
      'image': 'assets/images/first_photo.png',
      'title': 'Lorem ipsum dolor sit amet ',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
    },
    {
      'image': 'assets/images/second_photo.png',
      'title': 'Lorem ipsum dolor sit amet ',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec n',
    },
    {
      'image': 'assets/images/theerd_photo.png',
      'title': 'Lorem ipsum dolor sit amet ',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (currentIndex < screens.length - 1) {
      _pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigation.navigateAndRemove(context,  LoginScreen());
      AppState.firstUse();
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 82.h),
                child: Container(
                  width: double.infinity,
                  padding:  EdgeInsets.only(right: 27.w),
                  alignment: Alignment.centerRight,
                  child: CustomClickText(
                    text: 'Skip',
                    onPressed: () {
                      Navigation.navigateAndRemove(context,  LoginScreen());
                      AppState.firstUse();
                    },
                    color: GlobalColor.textColor,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: screens.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Column(
                        children: [
                          Image.asset(
                            screens[index]['image']!,
                            height: 349.h,
                            width: 326.w,
                          ),
                          SizedBox(height: 39.h),
                          Text(
                            screens[index]['title']!,
                            style: GlobalTextStyle.subheading,
                          ),
                          SizedBox(height: 16.h ),
                          Text(
                            screens[index]['description']!,
                            style: GlobalTextStyle.body,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                onPressed: _goToNextPage,
                child: Text(
                  currentIndex == screens.length - 1 ? 'FINISH' : 'NEXT',
                  style: GlobalTextStyle.btnText,
                ),
              ),
              SizedBox(height: 106.h),
            ],
          ),
          Positioned(
            bottom: 352.h,
            left: MediaQuery.of(context).size.width / 2 - (screens.length * 20 / 2),
            child: Row(
              children: List.generate(
                screens.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 40.w : 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
