// views/enrollment_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class EnrollmentView extends GetView<EnrollmentController> {
  const EnrollmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Enrollments'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${controller.errorMessage.value}',
                  style: const TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                  onPressed: controller.fetchEnrollments,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.enrollments.isEmpty) {
          return const Center(child: Text('No enrollments found'));
        }

        return ListView.builder(
          itemCount: controller.enrollments.length,
          itemBuilder: (context, index) {
            final enrollment = controller.enrollments[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice: ${enrollment.invoiceNo}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Date: ${enrollment.date}'),
                    Text('Status: ${enrollment.paymentStatus}'),
                    Text('Total: ${enrollment.grandTotal} BDT'),
                    const SizedBox(height: 12),
                    const Text(
                      'Courses:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...enrollment.enrollmentItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.course != null)
                              Text(
                                item.course!.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            Text('Fee: ${item.courseFee} BDT'),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}