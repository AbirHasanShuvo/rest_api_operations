import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

//it has bottom pixel error
class YoutubeController extends GetxController {
  late YoutubePlayerController youtubePlayerController;

  // Function to extract video ID from the URL
  String extractVideoId(String url) {
    final uri = Uri.parse(url);
    String videoId = '';

    if (uri.host == 'www.youtube.com' || uri.host == 'youtube.com') {
      videoId = Uri.parse(url).queryParameters['v'] ?? '';
    } else if (uri.host == 'youtu.be') {
      videoId = uri.pathSegments.first;
    }
    return videoId;
  }

  // Initialize the YoutubePlayerController with the extracted video ID
  void initPlayer(String url) {
    final videoId = extractVideoId(url);

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
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

class YoutubeScreenFullUrlGetx extends StatelessWidget {
  final String youtubeUrl;

  // Accept a YouTube URL when creating the screen
  const YoutubeScreenFullUrlGetx({super.key, required this.youtubeUrl});

  @override
  Widget build(BuildContext context) {
    // Initialize the YoutubeController using GetX
    final YoutubeController youtubeController = Get.put(YoutubeController());

    // Initialize the player with the YouTube URL
    youtubeController.initPlayer(youtubeUrl);

    return Scaffold(
      appBar: AppBar(title: Text("YouTube Player")),
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
