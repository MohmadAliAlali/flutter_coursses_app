import 'package:flutter/material.dart';
import 'package:project_stud/core/global_color.dart';
import 'package:project_stud/core/global_text_style.dart';
import 'package:project_stud/ui/widgets/custom_text_field.dart';
import 'package:project_stud/ui/widgets/welcome_widgite.dart';
import 'package:project_stud/seed_data/courses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  late PageController _pageController;
  List<CoursesModel> course = Courses.getCourses;

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalColor.backgroundPage,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeWidget(text: 'Reaam'),
              CustomTextFieldSearch(
                controller: _searchController,
                text: '',
                hintText: '',
                prefixIcon: Icons.search,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: double.infinity,
                height: 374,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                      child: Text(
                        'Last Videos Added',
                        style: GlobalTextStyle.subheading,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/images/icon.png',
                        width: 338,
                        height: 129,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/logo.png',
                              height: 130, fit: BoxFit.cover);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                      child: Text(
                        'Last Videos Watched',
                        style: GlobalTextStyle.subheading,
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/icon.png',
                            width: 143,
                            height: 146,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/logo.png',
                                  height: 130, fit: BoxFit.cover);
                            },
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(17)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/icon.png',
                            width: 143,
                            height: 146,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/logo.png',
                                  height: 130, fit: BoxFit.cover);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 40, 24, 25),
                child: Text(
                  'Last Subjects Studied',
                  style: GlobalTextStyle.subheading,
                ),
              ),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(16),
                children:
                List.generate(course.length, (index) {
                  return InkWell(
                    onTap:(){
                      CoursesModel? product = course[index];
                      // Navigation.navigateTo(context, ProductDetailsScreen(product: product));
                    } ,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffFBDBC6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(course[index].name, style: GlobalTextStyle.body),
                        ],
                      ),
                    )
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
