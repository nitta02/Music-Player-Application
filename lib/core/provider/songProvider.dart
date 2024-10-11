import 'package:audioplayers/audioplayers.dart';
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
      songName: 'Moner Jore 2',
      artistName: 'Habib',
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  String? _currentSong;
  bool _isPlaying = false;

  String? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  Songprovider() {
    listentoDuration();
  }

  void listentoDuration() {
    // Listener for total duration
    audioPlayer.onDurationChanged.listen(
      (event) {
        print("Total Duration: $event"); // Debug output
        _totalDuration = event;
        notifyListeners();
      },
    );

    // Listener for current position
    audioPlayer.onPositionChanged.listen(
      (onPosition) {
        print("Current Position: $onPosition"); // Debug output
        _currentDuration = onPosition; // Assign to the correct variable
        notifyListeners();
      },
    );

    // Listener for complete position
    audioPlayer.onPlayerComplete.listen(
      (onComplete) {},
    );
  }

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
        await audioPlayer.resume(); // Use resume if the player is paused
      }
    } else {
      // If a new song is selected, play the new song
      _currentSong = assetSong;
      _isPlaying = true; // Immediately update state to reflect play
      notifyListeners(); // Notify UI to update the button icon
      await audioPlayer.setSourceAsset(assetSong); // Set the source first
      await audioPlayer.resume(); // Use resume to play
    }
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    notifyListeners();
  }

  Future<void> nextSong() async {
    for (int i = 0; i < songList.length; i++) {
      if (_currentSong == songList[i].audioPath) {
        if (i == songList.length - 1) {
          _currentSong = songList[0].audioPath;
        } else {
          _currentSong = songList[i + 1].audioPath;
        }
        _isPlaying = true;
        notifyListeners();
        await audioPlayer.setSourceAsset(_currentSong!);
        await audioPlayer.resume();
        break;
      }
    }
  }

  Future<void> previousSong() async {
    for (int i = 0; i < songList.length; i++) {
      if (_currentSong == songList[i].audioPath) {
        if (i == 0) {
          _currentSong = songList[songList.length - 1].audioPath;
        } else {
          _currentSong = songList[i - 1].audioPath;
        }
        _isPlaying = true;
        notifyListeners();
        await audioPlayer.setSourceAsset(_currentSong!);
        await audioPlayer.resume();
        break;
      }
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void pauseSong() async {
    await audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeSong() async {
    await audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrresume() async {
    if (_isPlaying) {
      pauseSong();
    } else {
      resumeSong();
    }
    notifyListeners();
  }

  void playNextSong() async {}

  void playpreviousSong() async {}

  //seek the song position

  void seekPosition(Duration duration) async {
    await audioPlayer.seek(duration);
  }
}
