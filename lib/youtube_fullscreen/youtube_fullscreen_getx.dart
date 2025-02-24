import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

class YoutubeController extends GetxController {
  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ', // Replace with your video ID
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }
}

class YoutubeScreenFullGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final YoutubeController youtubeController = Get.put(YoutubeController());

    return Scaffold(
      body: Column(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: youtubeController.youtubePlayerController,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),
              onReady: () {
                print("Player is ready.");
              },
              onEnded: (data) {
                youtubeController.youtubePlayerController
                    .seekTo(Duration(seconds: 0)); // Restart video
              },
            ),
            builder: (context, player) {
              return Column(
                children: [
                  player, // Embeds the YouTube player
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
