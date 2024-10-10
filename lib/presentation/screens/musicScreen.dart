import 'package:flutter/material.dart';

class Musicscreen extends StatefulWidget {
  const Musicscreen({super.key});

  @override
  State<Musicscreen> createState() => _MusicscreenState();
}

class _MusicscreenState extends State<Musicscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Song Name', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  // Add skip to previous track logic
                },
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  // Add play logic
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  // Add skip to next track logic
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
