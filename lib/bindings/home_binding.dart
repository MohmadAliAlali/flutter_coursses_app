import 'package:get/get.dart';
import 'package:project_stud/controllers/home_controller.dart';
import 'package:project_stud/controllers/subject_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=> HomeController());
    Get.lazyPut<SubjectController>(()=> SubjectController());
  }
}