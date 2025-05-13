import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'for_eduTV/enrollment_solve/binding.dart';
import 'for_eduTV/enrollment_solve/enrollment_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnrollmentView(),
      initialBinding: EnrollmentBinding(),
    );
  }
}
