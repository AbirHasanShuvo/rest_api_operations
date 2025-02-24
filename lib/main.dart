import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/better_player_plus/better_player_screen.dart';
import 'package:restapi_testing/check_links/check_links.dart';
import 'package:restapi_testing/chewei_getx/screen.dart';
import 'package:restapi_testing/chewei_video_player/chewei_screen.dart';
import 'package:restapi_testing/chewei_getx/previous_screen.dart';
import 'package:restapi_testing/edu_tv/course_screen.dart';
import 'package:restapi_testing/youtube_explode/youtube_player.dart';
import 'package:restapi_testing/youtube_fullscreen/youtube_iframe.dart';
import 'package:restapi_testing/youtube_player/youtube_player.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:

            // ChewieScreenGetx(
            //     url:
            //         'https://d3akx1ripsfmw0.cloudfront.net/intro_video_6496a646b115e.mp4',
            //     dataSourceType: DataSourceType.network),

            YoutubeScreenFull());
  }
}
