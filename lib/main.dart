import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/aamar_pay/player/player.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: YoutubePlayerScreen());
  }
}
