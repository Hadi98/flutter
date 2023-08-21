import 'package:flutter/cupertino.dart';
import 'package:song/models/song.dart';

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];

  List<Song> get songs => _songs;

  Future<void> fetchSongs() async {
    await Future.delayed(Duration(seconds: 2));

    _songs = [
      Song(id: 1, title: 'Song 1', thumbnailUrl: 'url1'),
      Song(id: 2, title: 'Song 2', thumbnailUrl: 'url2'),
      // Add more songs here
    ];

    notifyListeners();
  }
}
