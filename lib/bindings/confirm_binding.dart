import 'package:get/get.dart';
import 'package:project_stud/controllers/confirm_controller.dart';

class ConfirmBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfirmController>(()=> ConfirmController());
  }
}