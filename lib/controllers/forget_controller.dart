import 'package:get/get.dart';
import 'package:project_stud/services/repositories/change_password_repository.dart';

class ForgetController extends GetxController {
  RxBool isClick = false.obs;
  RxString user = ''.obs;
  RxString error = ''.obs;
  final ChangePasswordRepository _changeRepository = ChangePasswordRepository();
  Future<void> forget(
      String email) async {
    try {
      isClick.value = true;
      error.value = '';
      final response =
      await _changeRepository.forgetPassword(email);
      isClick.value = false;
      if (response['success']) {
        Get.offNamed('/restPage');
        isClick.value = false;
      } else {
        Get.snackbar('error', response['data']);
        isClick.value = false;
      }
    } catch (e) {
      Get.snackbar('error', '$e');
      isClick.value = false;
    }
  }

  Future<void> restPassword(
      String email,String code , String password) async {
    try {
      isClick.value = true;
      final response =
      await _changeRepository.restPassword(email,code,password);
      isClick.value = false;
      if (response['success']) {
        Get.offNamed("/login");
        // Get.snackbar('error', response['data']['message']);
        print('object');
      } else {
        Get.snackbar('error', response['data']);
      }
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }
}
