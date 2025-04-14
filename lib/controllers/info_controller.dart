import 'package:get/get.dart';
import 'package:project_stud/services/repositories/info_repository.dart';

class InfoController extends GetxController{
  RxBool isLoading = false.obs;
  RxString user = ''.obs;


  final InfoRepository _confirmRepository = InfoRepository();
  Future<void> setInfo(
      String university, String specialization,String year) async {
    try {
      isLoading.value = true;
      final response =
      await _confirmRepository.infoRepo( university, specialization,year);
      isLoading.value = false;
      if (response['success']) {
        print('object');
        Get.offNamed('navPage');
      } else {
        Get.snackbar('error', response['data']);
      }
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }
}