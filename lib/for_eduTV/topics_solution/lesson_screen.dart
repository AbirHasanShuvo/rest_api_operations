import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lesson_controller.dart';

class LessonScreen extends StatelessWidget {
  final LessonController controller = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lessons")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.lessons.isEmpty) {
          return Center(child: Text("No lessons found"));
        }

        return ListView.builder(
          itemCount: controller.lessons.length,
          itemBuilder: (context, index) {
            final lesson = controller.lessons[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ListTile(
                title: Text(lesson.title),
                subtitle: Text("Duration: ${lesson.duration}"),
                trailing: Icon(Icons.play_circle_fill),
                onTap: () {
                  // Optional: Navigate to video page
                  Get.snackbar("Tapped", "Video: ${lesson.video}");
                },
              ),
            );
          },
        );
      }),
    );
  }
}
