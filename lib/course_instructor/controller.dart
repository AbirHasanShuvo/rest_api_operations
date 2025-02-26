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
      final response = await http.get(
        Uri.parse('https://admin.edubd.tv/api/v1/courses/edu-tv---vat-free-learnings/instructors'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['status'] == 1) {
          var instructorList = jsonData['data']
              .map<Instructor>((instructor) => Instructor.fromJson(instructor['instructor']))
              .toList();
          instructors.assignAll(instructorList);
        }
      } else {
        Get.snackbar("Error", "Failed to fetch data");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
