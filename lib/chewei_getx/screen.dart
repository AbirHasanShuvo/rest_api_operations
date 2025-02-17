import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/chewei_getx/controller.dart';
import 'package:video_player/video_player.dart';

class ChewieScreen extends StatelessWidget {
  final String url;
  final DataSourceType dataSourceType;

  const ChewieScreen(
      {super.key, required this.url, required this.dataSourceType});

  @override
  Widget build(BuildContext context) {
    final VideoController controller =
        Get.put(VideoController(url: url, dataSourceType: dataSourceType));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: GetBuilder<VideoController>(
              builder: (controller) =>
                  Chewie(controller: controller.chewieController),
            ),
          )
        ],
      ),
    );
  }
}
