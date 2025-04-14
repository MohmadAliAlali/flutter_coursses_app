import 'package:get/get.dart';
import 'package:project_stud/controllers/forget_controller.dart';

class RestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgetController>(()=> ForgetController());
  }
}