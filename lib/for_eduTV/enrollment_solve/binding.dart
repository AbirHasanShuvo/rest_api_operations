// bindings/enrollment_binding.dart
import 'package:get/get.dart';

import 'api_service.dart';
import 'controller.dart';


class EnrollmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnrollmentService());
    Get.lazyPut(() => EnrollmentController());
  }
}