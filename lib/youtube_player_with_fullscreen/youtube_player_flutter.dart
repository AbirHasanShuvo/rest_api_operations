import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: YoutubePlayerScreen(),
    );
  }
}

class YoutubePlayerControllerX extends GetxController {
  final String videoUrl = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("YouTube Player")),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: controllerX.controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print("Player is ready.");
                  },
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: player,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(SecondScreen());
                        },
                        child: Text("Go to Next Screen"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
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
