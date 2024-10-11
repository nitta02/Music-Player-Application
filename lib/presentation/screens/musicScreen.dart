import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/provider/songProvider.dart';
import 'package:provider/provider.dart';

class Musicscreen extends StatelessWidget {
  final String name;
  final String imagePath;
  const Musicscreen({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: Consumer<Songprovider>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {
                    // Add skip to previous track logic
                    value.previousSong();
                  },
                ),
                IconButton(
                  icon: value.isPlaying &&
                          value.currentSong == value.songList[0].audioPath
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                  onPressed: () async {
                    // Add play logic
                    await value.play(value.songList[0].audioPath);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {
                    // Add skip to next track logic
                    value.nextSong();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
