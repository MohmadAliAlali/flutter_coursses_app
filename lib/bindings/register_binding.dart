

import 'package:get/get.dart';
import 'package:project_stud/controllers/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(()=> RegisterController());
  }
}