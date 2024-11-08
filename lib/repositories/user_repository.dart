import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_stud/services/api_service.dart';

class UserRepository {
  var isLoading = false.obs;

  Future<void> loginFun(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await http.post(
        UserService.loginUrl,
        body: {
          'username': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Registration successful');
      } else {
        Get.snackbar('Error', 'Registration failed. Please try again.');
      }
    }catch (e){
      print('{$e}');
    }
    isLoading.value = false;
  }

  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    final Uri url = Uri.parse('http://127.0.0.1:8000/api/token/');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {

      Get.snackbar('Success', 'Registration successful');
    } else {
      Get.snackbar('Error', 'Registration failed. Please try again.');
    }
    isLoading.value = false;
  }


}