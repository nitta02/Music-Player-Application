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
      body: Consumer<Songprovider>(builder: (context, value, child) {
        List<Songmodel> songs = value.songList;
        return ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Musicscreen(
                            imagePath: songs[index].imagePath,
                            name: songs[index].songName),
                      ));
                },
                leading: Image.asset(songs[index].imagePath),
                title: Text(songs[index].songName),
                subtitle: Text(songs[index].artistName),
              ),
            );
          },
        );
      }),
    );
  }
}
