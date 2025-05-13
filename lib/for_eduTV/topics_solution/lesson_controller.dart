import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'lesson_model.dart';

class LessonController extends GetxController {
  var lessons = <Lesson>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLessons([41, 42]);
  }

  Future<void> fetchLessons(List<int> topicIds) async {
    try {
      isLoading.value = true;
      print("Fetching lessons...");

      List<Lesson> allLessons = [];

      for (int topicId in topicIds) {
        final url =
            "https://admin.edubd.tv/api/v1/courses/topic/$topicId/lessons";
        print("Calling: $url");

        final response = await http.get(Uri.parse(url));
        print("Status: ${response.statusCode}");
        print("Body: ${response.body}");

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> lessonList = jsonData['data']['data'];
          final List<Lesson> parsedLessons =
              lessonList.map((e) => Lesson.fromJson(e)).toList();
          allLessons.addAll(parsedLessons);
        } else {
          Get.snackbar("Error", "Failed to fetch topic $topicId");
        }
      }

      lessons.value = allLessons;
      print("Total lessons fetched: ${lessons.length}");
    } catch (e) {
      print("Fetch error: $e");
      Get.snackbar("Error", "Something went wrong!");
    } finally {
      isLoading.value = false;
    }
  }
}
