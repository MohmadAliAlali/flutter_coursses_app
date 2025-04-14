import 'package:get/get.dart';
import 'package:project_stud/model/subject_model.dart';
import 'package:project_stud/services/repositories/subject_repository.dart';

class SubjectController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<Subject> subjectList = <Subject>[].obs;
  final SubjectRepository repository = SubjectRepository();

  @override
  void onInit() {
    fetchSubjects();
    super.onInit();
  }

  Future<void> fetchSubjects() async {
    try {
      isLoading(true);
      final response = await repository.subjectList();
      if (response['success']) {
        subjectList.assignAll(response['data']);
      } else {
        Get.snackbar(
          'Error',
          response['error'] ?? 'Unknown error occurred',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Server Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshSubjects() async {
    await fetchSubjects();
  }
}