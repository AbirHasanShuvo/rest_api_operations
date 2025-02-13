import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ChewieYouTubePlayer extends StatefulWidget {
  final String videoUrl;
  const ChewieYouTubePlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _ChewieYouTubePlayerState createState() => _ChewieYouTubePlayerState();
}

class _ChewieYouTubePlayerState extends State<ChewieYouTubePlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      var yt = YoutubeExplode();
      var videoId = VideoId(widget.videoUrl).value;
      var manifest = await yt.videos.streamsClient.getManifest(videoId);
      var streamUrl = manifest.muxed.withHighestBitrate().url.toString();
      yt.close();

      _videoPlayerController = VideoPlayerController.network(streamUrl);
      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        allowPlaybackSpeedChanging: true,
        showControls: true,
      );

      setState(() => _isLoading = false);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chewie YouTube Player")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Chewie(controller: _chewieController!),
      ),
    );
  }
}
