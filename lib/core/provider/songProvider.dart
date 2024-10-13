// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/model/songModel.dart';

class SongProvider extends ChangeNotifier {
  final List<Songmodel> _songList = [
    Songmodel(
      imagePath: 'lib/assets/images/moner jore.png',
      audioPath: 'lib/assets/audio/moner jore.mp3',
      songName: 'Moner Jore',
      artistName: 'Habib',
    ),
    Songmodel(
      imagePath: 'lib/assets/images/moner jore.png',
      audioPath: 'lib/assets/audio/moner jore copy.mp3',
      songName: 'Moner Jore 2',
      artistName: 'Habib',
    ),
  ];

  int? _currentSongIndex;

  // Getter--------------------------------------
  List<Songmodel> get songList => _songList;
  int? get currentSongIndex => _currentSongIndex;

  // Setter --------------------------------
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      playSong();
    }
    notifyListeners();
  }

  // Audio Player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Playing or Not
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  SongProvider() {
    listenDuration();
  }

  void listenDuration() {
    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      nextSong();
    });
  }

  // Play
  void playSong() async {
    if (currentSongIndex == null) {
      print('No song is selected to play.');
      return; // Exit the function if no song is selected
    }

    final String path = songList[currentSongIndex!].audioPath;
    print('Playing song: $path'); // Debugging log
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // Pause
  void pauseSong() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Resume
  void resumeSong() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // Pause or Resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pauseSong();
    } else {
      resumeSong();
    }
    notifyListeners();
  }

  // Play Next song
  void nextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _songList.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        _currentSongIndex = 0; // Loop back to the first song
      }
      playSong(); // Play the next song
    }
  }

  // Play Previous song
  void previousSong() async {
    if (currentSongIndex == null || currentSongIndex! <= 0) {
      print('No previous song available.');
      return; // Exit if no previous song exists
    }

    // Decrement the current index to go to the previous song
    currentSongIndex = currentSongIndex! - 1;

    final String path = songList[currentSongIndex!].audioPath;
    print('Playing previous song: $path'); // Debugging log
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // Seek a song running position
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
}
