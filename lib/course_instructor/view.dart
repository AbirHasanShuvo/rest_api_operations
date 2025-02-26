import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/course_instructor/controller.dart';


class InstructorScreen extends StatelessWidget {
  final InstructorController controller = Get.put(InstructorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instructors")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.instructors.isEmpty) {
          return Center(child: Text("No instructors found."));
        }

        return ListView.builder(
          itemCount: controller.instructors.length,
          itemBuilder: (context, index) {
            final instructor = controller.instructors[index];

            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(instructor.image),
                ),
                title: Text("${instructor.firstName} ${instructor.lastName}"),
                subtitle: Text(instructor.bio),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Get.snackbar("Instructor", "${instructor.username}");
                },
              ),
            );
          },
        );
      }),
    );
  }
}
