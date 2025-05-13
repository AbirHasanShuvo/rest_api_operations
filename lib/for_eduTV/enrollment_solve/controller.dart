// controllers/enrollment_controller.dart
import 'package:get/get.dart';

import 'api_service.dart';
import 'model.dart';


class EnrollmentController extends GetxController {
  final EnrollmentService _enrollmentService = Get.find();
  final Rx<EnrollmentResponse?> enrollmentResponse = Rx<EnrollmentResponse?>(null);
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    fetchEnrollments();
    super.onInit();
  }

  Future<void> fetchEnrollments() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _enrollmentService.getEnrollments();
      enrollmentResponse(response);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  List<Enrollment> get enrollments =>
      enrollmentResponse.value?.data?.enrollments ?? [];
}