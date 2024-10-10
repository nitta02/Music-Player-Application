class Songmodel {
  final String songName;
  final String artistName;
  final String audioPath;

  Songmodel(
    this.audioPath, {
    required this.songName,
    required this.artistName,
  });
}
