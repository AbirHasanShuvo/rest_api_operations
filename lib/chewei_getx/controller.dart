import 'dart:io';
import 'package:chewie/chewie.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  final String url;
  final DataSourceType dataSourceType;

  VideoController({required this.url, required this.dataSourceType});

  @override
  void onInit() {
    super.onInit();
    switch (dataSourceType) {
      case DataSourceType.asset:
        videoPlayerController = VideoPlayerController.asset(url);
        break;
      case DataSourceType.network:
        videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(url));
        break;
      case DataSourceType.file:
        videoPlayerController = VideoPlayerController.file(File(url));
        break;
      case DataSourceType.contentUri:
        videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(url));
        break;
    }

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
