import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreenFullUrl extends StatefulWidget {
  final String youtubeUrl;

  // Accept a YouTube URL when creating the screen
  YoutubeScreenFullUrl({required this.youtubeUrl});

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreenFullUrl> {
  late YoutubePlayerController _controller;

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

  @override
  void initState() {
    super.initState();
    // Initialize the player with the extracted video ID from the URL
    String videoId = extractVideoId(widget.youtubeUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),
              onReady: () {
                print("Player is ready.");
              },
              onEnded: (data) {
                _controller.seekTo(Duration(seconds: 0)); // Restart video
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
