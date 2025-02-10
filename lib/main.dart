import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/for_eduTV/edutv_homescreen.dart';
import 'package:restapi_testing/homescreen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: EdutvHomescreen(),
    );
  }
}
