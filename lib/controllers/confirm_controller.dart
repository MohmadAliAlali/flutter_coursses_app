import 'package:get/get.dart';
import 'package:project_stud/core/helper/state_manager.dart';
import 'package:project_stud/services/repositories/confirm_repository.dart';

class ConfirmController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isClick = false.obs;
  RxString user = ''.obs;
  RxString error = ''.obs;


  final ConfirmRepository _confirmRepository = ConfirmRepository();
  Future<void> confirm(
      String email,String verificationCode) async {
    try {
      isLoading.value = true;
      error.value = '';
      final response =
      await _confirmRepository.confirmCode( email, verificationCode);
      isLoading.value = false;
      if (response['success']) {
        AppState.setToken(response['data']['access'], response['data']['refresh']);
        Get.offNamed('/infoPage');
      } else {
        Get.snackbar('error', response['data']);
      }
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }

  Future<void> resendCode(
      String email) async {
    try {
      isClick.value = true;
      final response =
      await _confirmRepository.resendCode(email);
      isClick.value = false;
      if (response['success']) {
        Get.snackbar('error', response['data']['message']);
      } else {
        Get.snackbar('error', response['data']);
      }
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }
}