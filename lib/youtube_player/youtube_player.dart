import 'package:flutter/material.dart';

class YoutubePlayerFlutter extends StatelessWidget {
  const YoutubePlayerFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Youtube Player"),
      ),
    );
  }
}
