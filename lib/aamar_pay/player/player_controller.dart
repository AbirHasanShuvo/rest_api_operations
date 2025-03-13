import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerControllerX extends GetxController {
  late YoutubePlayerController controller;
  var videoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    controller = YoutubePlayerController(
      initialVideoId: '5veR6Gp3vJ4',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: true,
      ),
    );
  }

  void loadVideo(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId != null) {
      videoUrl.value = url;
      controller.load(videoId);
    } else {
      Get.snackbar('Error', 'Invalid YouTube URL');
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}