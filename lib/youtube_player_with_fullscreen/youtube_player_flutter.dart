import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerControllerX extends GetxController {
  final String videoUrl = "https://www.youtube.com/watch?v=A3QkmsuGvx8";
  late YoutubePlayerController controller;

  @override
  void onInit() {
    super.onInit();
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
        isLive: false,
      ),
    );
  }

  @override
  void onClose() {
    controller.pause(); // Stop video before closing
    controller.dispose();
    super.onClose();
  }
}

class YoutubePlayerScreen extends StatelessWidget {
  final YoutubePlayerControllerX controllerX =
      Get.put(YoutubePlayerControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents UI shifts
      appBar: AppBar(title: Text("YouTube Player")),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controllerX.controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print("Player is ready.");
          },
        ),
        builder: (context, player) {
          return SafeArea(
            child: Column(
              children: [
                // Ensures the player maintains correct aspect ratio
                Container(
                  width: double.infinity,
                  child: player,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(SecondScreen());
                  },
                  child: Text("Go to Next Screen"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(child: Text("Video should stop playing")),
    );
  }
}
