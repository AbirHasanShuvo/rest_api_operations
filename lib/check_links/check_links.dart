import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckLinks extends StatelessWidget {
  const CheckLinks({super.key});

  bool isYouTubeUrl(String url) {
    // Regular expression to match YouTube URLs
    final RegExp youtubeRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/.+',
      caseSensitive: false,
    );

    // Check if the URL matches the regex
    return youtubeRegex.hasMatch(url);
  }

  @override
  Widget build(BuildContext context) {
    String url1 = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
    String url2 = "https://youtu.be/dQw4w9WgXcQ";
    String url3 = "https://example.com";
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {


              Get.snackbar("youTube link check", isYouTubeUrl(url3).toString());
            },
            child: Text("Check youTube links")),
      ),
    );
  }
}
