import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
    );

    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        looping: true,
        aspectRatio: 16 / 9,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableFullscreen: true,
          enableMute: true,
        ),
      ),
    );

    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Better Player Plus")),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(30, (index) {
                  return Text("Hello World");
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
