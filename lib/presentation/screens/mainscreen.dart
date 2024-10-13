// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/songModel.dart';
import 'package:flutter_application_1/core/provider/songProvider.dart';
import 'package:flutter_application_1/presentation/screens/musicScreen.dart';
import 'package:flutter_application_1/presentation/widgets/drawer.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Playlist'),
      ),
      body: Consumer<SongProvider>(builder: (context, provider, child) {
        List<Songmodel> songs = provider.songList;

        if (songs.isEmpty) {
          return const Center(child: Text("No songs available"));
        }

        return ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicScreen(
                        artistName: song.artistName,
                        imagePath: song.imagePath,
                        name: song.songName,
                      ),
                    ),
                  );
                },
                leading: Image.asset(song.imagePath),
                title: Text(song.songName),
                subtitle: Text(song.artistName),
              ),
            );
          },
        );
      }),
    );
  }
}
