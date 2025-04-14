import 'package:get/get.dart';
import 'package:project_stud/model/courses_model.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxList<CoursesModel> courses = <CoursesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchCourses() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      courses.assignAll([
        CoursesModel(name: "Mathematics",id: 1,image: "",description: "",time: 10),
        CoursesModel(name: "Physics",id: 1,image: "",description: "",time: 10),
        CoursesModel(name: "Chemistry",id: 1,image: "",description: "",time: 10),
        CoursesModel(name: "Biology",id: 1,image: "",description: "",time: 10),
      ]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load courses: $e');
    }
  }
}