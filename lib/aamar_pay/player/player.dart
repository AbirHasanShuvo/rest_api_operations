import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'player_controller.dart';
import 'package:get/get.dart';

class YoutubePlayerScreen extends StatelessWidget {
  final YoutubePlayerControllerX playerController =
      Get.put(YoutubePlayerControllerX());
  final TextEditingController urlController = TextEditingController();

  YoutubePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("YouTube Player")),
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: playerController.controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,

                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello "),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                      Text("Hello Everyone"),
                    ],
                  ),
                ))

                // Row(
                //   children: [
                //     Expanded(
                //       child: TextField(
                //         controller: urlController,
                //         decoration: const InputDecoration(
                //           hintText: "Enter YouTube URL",
                //         ),
                //       ),
                //     ),
                //     IconButton(
                //       icon: const Icon(Icons.play_arrow),
                //       onPressed: () {
                //         playerController.loadVideo(urlController.text);
                //       },
                //     ),
                //   ],
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
