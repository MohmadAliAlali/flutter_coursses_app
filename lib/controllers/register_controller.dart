import 'package:get/get.dart';
import 'package:project_stud/services/repositories/user_repository.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxString user = ''.obs;
  RxString userNameError = ''.obs;
  RxString passwordError = ''.obs;
  RxString emailError = ''.obs;

  final UserRepository userRepository = UserRepository();
  Future<void> register(
      String username, String password, String password2, String email) async {
    try {
      isLoading.value = true;
      userNameError.value = '';
      passwordError.value = '';
      emailError.value = '';
      final response =
          await userRepository.register(username, email, password, password2);
      isLoading.value = false;
      if (response['success']) {
        // user.value = response['data']['message'];
        Get.offNamed('/vitrify');
        isLoading.value = false;
      } else {
        var data = response['data'];
        if (data['username'] != null) {
          userNameError.value = data['username'][0];
          isLoading.value = false;
        } else if (data['password'] != null) {
          passwordError.value = data['password'][0];
          isLoading.value = false;
        } else {
          Get.snackbar('error', 'message');
          isLoading.value = false;
        }
      }
    } catch (e) {
      Get.snackbar('error', 'server error$e');
      isLoading.value = false;

    }
  }
}
