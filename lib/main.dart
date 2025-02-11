import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/chewei_video_player/chewei_screen.dart';
import 'package:restapi_testing/for_eduTV/edutv_homescreen.dart';
import 'package:restapi_testing/homescreen/home_screen.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheweiScreen(
          url:
              "https://d3akx1ripsfmw0.cloudfront.net/intro_video_6496a646b115e.mp4",
          dataSourceType: DataSourceType.contentUri),
    );
  }
}
