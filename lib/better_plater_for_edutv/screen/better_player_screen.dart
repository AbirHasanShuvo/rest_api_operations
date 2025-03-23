import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:restapi_testing/better_plater_for_edutv/controller/better_player_controller.dart';

class BetterPlayerScreen extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Better Player with GetX")),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child:
              BetterPlayer(controller: videoController.betterPlayerController),
        ),
      ),
    );
  }
}
