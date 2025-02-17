import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/better_player_plus/better_player_screen.dart';
import 'package:restapi_testing/check_links/check_links.dart';
import 'package:restapi_testing/chewei_video_player/chewei_screen.dart';
import 'package:restapi_testing/edu_tv/course_screen.dart';
import 'package:restapi_testing/youtube_player/youtube_player.dart';

import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: CheweiScreen(
        //     url:
        //         "https://d3akx1ripsfmw0.cloudfront.net/intro_video_6496a646b115e.mp4",
        //     dataSourceType: DataSourceType.contentUri),

        //is vscode better for flutter development or not or not it is using ?
        //hello World all
        home: CheweiScreen(
          url:
              'https://d3akx1ripsfmw0.cloudfront.net/intro_video_6496ba2d3291d.mp4',
          dataSourceType: DataSourceType.network,
        ));
  }
}
