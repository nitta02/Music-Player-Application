import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/songModel.dart';
import 'package:flutter_application_1/core/provider/songProvider.dart';
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
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: Consumer<Songprovider>(builder: (context, value, child) {
        List<Songmodel> songs = value.songList;
        return ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              title: Text(songs[index].songName),
            );
          },
        );
      }),
    );
  }
}
