import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:restapi_testing/edu_tv/course_model.dart';

class CourseController extends GetxController {
  var isLoading = true.obs;
  var course = Rxn<CourseData>();

  @override
  void onInit() {
    fetchCourse();
    super.onInit();
  }

  Future<void> fetchCourse() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://admin.edubd.tv/api/v1/courses/professional-vat-management'));

      if (response.statusCode == 200) {
        final CourseModel courseModel = CourseModel.fromJson(response.body);
        course.value = courseModel.data;
      } else {
        Get.snackbar("Error", "Failed to load data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
