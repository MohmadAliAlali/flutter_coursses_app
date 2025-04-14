import 'package:get/get.dart';
import 'package:project_stud/core/helper/state_manager.dart';
import 'package:project_stud/services/repositories/user_repository.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  // RxString user = ''.obs;
  RxString passwordError = ''.obs;
  RxString emailError = ''.obs;

  final UserRepository userRepository = UserRepository();
  Future<void> login(
      String email, String password) async {
    try {
      isLoading.value = true;
      passwordError.value = '';
      emailError.value = '';
      final response =
      await userRepository.loginFun(email, password);
      isLoading.value = false;
      if (response['success']) {
        AppState.setToken(response['data']['refresh'],response['data']['access']);
        Get.offNamed('/navPage');
      } else {
        var data = response['data'];
        if (data['email'] != null) {
          emailError.value = data['username'][0];
        } else if (data['password'] != null) {
          passwordError.value = data['password'][0];
        } else {
          Get.snackbar('error', 'message');
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar('error', 'server error$e');
    }
  }
}
