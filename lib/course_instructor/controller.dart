import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restapi_testing/course_instructor/model.dart';
import 'dart:convert';

class InstructorController extends GetxController {
  var isLoading = true.obs;
  var instructors = <Instructor>[].obs;

  @override
  void onInit() {
    fetchInstructors();
    super.onInit();
  }

  Future<void> fetchInstructors() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://admin.edubd.tv/api/v1/courses/edu-tv---vat-free-learnings/instructors'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == 1) {
          var instructorList = jsonData['data'] as List;
          instructors.value = instructorList
              .map((item) => Instructor.fromJson(item['instructor']))
              .toList();
        }
      } else {
        Get.snackbar("Error", "Failed to load instructors");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
