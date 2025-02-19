import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/chewei_getx/new_screen.dart';
import 'package:video_player/video_player.dart';

class CheweiScreen extends StatefulWidget {
  const CheweiScreen(
      {super.key, required this.url, required this.dataSourceType});

  final String url;
  final DataSourceType dataSourceType;

  @override
  State<CheweiScreen> createState() => _CheweiScreenState();
}

class _CheweiScreenState extends State<CheweiScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.url));
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController, aspectRatio: 16 / 9);
  }

  @override
  void dispose() {

    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4, // Adjust as needed
              child: Chewie(controller: _chewieController)),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => NewScreenGetx());
              },
              child: Text("NAVIGATE_TO_OTHER_SCREEN"))
        ],
      ),
    );
  }
}
