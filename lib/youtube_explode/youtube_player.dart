import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen(this.videoUrl);

  final String videoUrl;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource dataSource =
        BetterPlayerDataSource.network(widget.videoUrl);
    _controller = BetterPlayerController(
      BetterPlayerConfiguration(),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(controller: _controller);
  }

  void playVideo(String videoId) async {
    Map<String, String> qualities = await getVideoQualities(videoId);
    String selectedUrl = qualities["720p"] ?? qualities.values.first;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoPlayerScreen(selectedUrl)),
    );
  }

  Future<Map<String, String>> getVideoQualities(String videoId) async {
    final yt = YoutubeExplode();
    final manifest = await yt.videos.streamsClient.getManifest(videoId);
    yt.close();

    final streams = manifest.videoOnly;
    Map<String, String> qualities = {};

    for (var stream in streams) {
      qualities[stream.qualityLabel] = stream.url.toString();
    }

    return qualities;
  }
}
