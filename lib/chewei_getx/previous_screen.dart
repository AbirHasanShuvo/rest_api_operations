import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'screen.dart';

class PreviousScreen extends StatelessWidget {
  const PreviousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => ChewieScreenGetx(
                  url: 'https://www.w3schools.com/html/mov_bbb.mp4',
                  dataSourceType: DataSourceType.network));
            },
            child: Text("NAVIGATE_TO_OTHER_SCREEN")),
      ),
    );
  }
}
