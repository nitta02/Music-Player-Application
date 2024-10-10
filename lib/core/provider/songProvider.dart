import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/songModel.dart';

class Songprovider extends ChangeNotifier {
  List<Songmodel> songList = [
    Songmodel(
      'lib/assets/audio/moner jore.mp3',
      songName: 'Moner Jore',
      artistName: 'Habib',
    ),
    Songmodel(
      'lib/assets/audio/moner jore.mp3',
      songName: 'Moner Jore',
      artistName: 'Habib',
    ),
  ];
}
