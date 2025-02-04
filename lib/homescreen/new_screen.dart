import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key, required this.message});

  final message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Text(message)],
      ),
    );
  }
}
