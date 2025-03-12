import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const DetailScreen({super.key, required this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Map<String, dynamic> screenData;

  @override
  void initState() {
    super.initState();
    screenData = widget.data; // Initialize with received data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenData['title'])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(screenData['content'], style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate updating content dynamically
                setState(() {
                  screenData = {
                    "title": "Updated Screen",
                    "content": "This content was updated dynamically!"
                  };
                });
              },
              child: Text("Update Content"),
            )
          ],
        ),
      ),
    );
  }
}
