import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/songModel.dart';
import 'package:just_audio/just_audio.dart';

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
      songName: 'Moner Jore 2',
      artistName: 'Habib',
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  String? _currentSong;
  bool _isPlaying = false;

  String? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;

  Future<void> play(String assetSong) async {
    if (_currentSong == assetSong) {
      // If the same song is clicked, toggle between play/pause
      if (_isPlaying) {
        _isPlaying = false; // Immediately update state to reflect pause
        notifyListeners(); // Notify UI to update the button icon
        await pause(); // Then call async pause
      } else {
        _isPlaying = true; // Immediately update state to reflect play
        notifyListeners(); // Notify UI to update the button icon
        await audioPlayer.play(); // Then call async play
      }
    } else {
      // If a new song is selected, play the new song
      _currentSong = assetSong;
      _isPlaying = true; // Immediately update state to reflect play
      notifyListeners(); // Notify UI to update the button icon
      await audioPlayer.setAsset(assetSong);
      await audioPlayer.play();
    }
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    notifyListeners();
  }

  Future<void> nextSong() async {
    // Loop through the song list to find the current song
    for (int i = 0; i < songList.length; i++) {
      if (_currentSong == songList[i].audioPath) {
        // Check if the current song is the last in the list
        if (i == songList.length - 1) {
          // If it's the last song, set the next song to the first one
          _currentSong = songList[0].audioPath;
        } else {
          // Otherwise, move to the next song
          _currentSong = songList[i + 1].audioPath;
        }
        _isPlaying = true;
        notifyListeners();
        await audioPlayer.setAsset(currentSong!);
        await audioPlayer.play();
        break; // Stop the loop once we find and play the next song
      }
    }
  }

  Future<void> previousSong() async {
    // Loop through the song list to find the current song
    for (int i = 0; i < songList.length; i++) {
      if (_currentSong == songList[i].audioPath) {
        // Check if the current song is the first in the list
        if (i == 0) {
          // If it's the first song, set the previous song to the last one
          _currentSong = songList[songList.length - 1].audioPath;
        } else {
          // Otherwise, move to the previous song
          _currentSong = songList[i - 1].audioPath;
        }

        // Set the song as playing and update the listeners
        _isPlaying = true;
        notifyListeners();

        // Set the audio and play the previous song
        await audioPlayer.setAsset(_currentSong!);
        await audioPlayer.play();

        break; // Stop the loop once we find and play the previous song
      }
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
