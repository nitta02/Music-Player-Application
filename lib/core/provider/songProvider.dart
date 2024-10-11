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
  String? _currentSong; // Store the current song's audio path
  bool _isPlaying = false;
  bool _isLoading = false; // To show loading state

  String? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading; // Getter for loading state

  // Method to load and play the song
  Future<void> loadAndPlay(String assetSong) async {
    _isLoading = true; // Show loading state
    notifyListeners();

    try {
      await audioPlayer.setAsset(assetSong); // Preload the asset
      _currentSong = assetSong; // Set the current song
      await play(); // Play the preloaded song
    } catch (e) {
      print("Error loading song: $e");
    } finally {
      _isLoading = false; // Remove loading state
      notifyListeners();
    }
  }

  // Play the song if loaded
  Future<void> play() async {
    if (_currentSong != null) {
      await audioPlayer.play();
      _isPlaying = true;
      notifyListeners();
    }
  }

  // Pause the song
  Future<void> pause() async {
    await audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Handle play/pause toggle
  Future<void> togglePlayPause(String assetSong) async {
    if (_currentSong == assetSong && _isPlaying) {
      await pause();
    } else if (_currentSong == assetSong && !_isPlaying) {
      await play();
    } else {
      await loadAndPlay(assetSong); // Load and play the new song
    }
  }

  // Play the next song
  Future<void> nextSong() async {
    int currentIndex =
        songList.indexWhere((song) => song.audioPath == _currentSong);
    if (currentIndex == -1) return;

    // Move to the next song
    currentIndex = (currentIndex + 1) % songList.length;
    await loadAndPlay(songList[currentIndex].audioPath!); // Load next song
  }

  // Play the previous song
  Future<void> previousSong() async {
    int currentIndex =
        songList.indexWhere((song) => song.audioPath == _currentSong);
    if (currentIndex == -1) return;

    // Move to the previous song
    currentIndex = (currentIndex - 1 + songList.length) % songList.length;
    await loadAndPlay(songList[currentIndex].audioPath!); // Load previous song
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
