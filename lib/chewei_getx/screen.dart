import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/chewei_getx/controller.dart';
import 'package:restapi_testing/chewei_getx/new_screen.dart';
import 'package:video_player/video_player.dart';

class ChewieScreenGetx extends StatelessWidget {
  final String url;
  final DataSourceType dataSourceType;

  const ChewieScreenGetx(
      {super.key, required this.url, required this.dataSourceType});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(ChewieControllerX(url: url, dataSourceType: dataSourceType));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GetBuilder<ChewieControllerX>(
            builder: (controller) => SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height *
                    0.4, // Adjust as needed
                child: Chewie(controller: controller.chewieController)),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                controller.stopVideo();
                Get.to(() => NewScreenGetx());
              },
              child: Text("NAVIGATE_TO_OTHER_SCREEN"))
        ],
      ),
    );
  }
}
