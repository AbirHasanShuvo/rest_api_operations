import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  var isInitialized = false.obs; // Observable for tracking initialization

  @override
  void onInit() {
    super.onInit();
    String videoUrl = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"; // Replace with your URL
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId != null) {
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
      isInitialized.value = true; // Mark as initialized
    } else {
      print("Error: Invalid YouTube URL"); // Debugging
    }
  }

  @override
  void onClose() {
    if (isInitialized.value) {
      youtubePlayerController.dispose();
    }
    super.onClose();
  }
}
