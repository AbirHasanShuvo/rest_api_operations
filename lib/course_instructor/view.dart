import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/course_instructor/controller.dart';

class InstructorScreen extends StatelessWidget {
  final InstructorController instructorController =
      Get.put(InstructorController());

  InstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instructors")),
      body: Obx(() {
        if (instructorController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (instructorController.instructors.isEmpty) {
          return Center(child: Text("No Instructors Found"));
        }
        return ListView.builder(
          itemCount: instructorController.instructors.length,
          itemBuilder: (context, index) {
            final instructor = instructorController.instructors[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://admin.edubd.tv/${instructor.image}"),
                ),
                title: Text(instructor.firstName),
                subtitle: Text(instructor.email),
                trailing: Text(instructor.experience),
              ),
            );
          },
        );
      }),
    );
  }
}
