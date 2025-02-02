import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/homescreen/home_screen.dart';
import 'package:restapi_testing/login_api.dart';
import 'package:restapi_testing/previous_method/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
