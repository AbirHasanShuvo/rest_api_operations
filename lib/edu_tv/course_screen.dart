import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/edu_tv/controller.dart';

class CourseScreen extends StatelessWidget {
  final CourseController courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Details")),
      body: Obx(() {
        if (courseController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final course = courseController.course.value;
        if (course == null) {
          return Center(child: Text("No data available"));
        }

        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(course.shortDescription),
              SizedBox(height: 8),
              Text(
                "Fee: ${course.courseFee}",
              ),
            ],
          ),
        );
      }),
    );
  }
}
