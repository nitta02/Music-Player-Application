import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/songModel.dart';

class Songprovider extends ChangeNotifier {
  List<Songmodel> songList = [
    Songmodel(
      imagePath: 'lib/assets/images/moner jore.png',
      audioPath: 'lib/assets/audio/moner jore.mp3',
      songName: 'Moner Jore',
      artistName: 'Habib',
    ),
    Songmodel(
      imagePath: 'lib/assets/images/moner jore.png',
      audioPath: 'lib/assets/audio/moner jore.mp3',
      songName: 'Moner Jore',
      artistName: 'Habib',
    ),
  ];
}
