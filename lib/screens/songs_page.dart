import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:song/providers/song_provider.dart';
import 'package:provider/provider.dart';
import 'package:song/widgets/songs_list.dart';
import 'package:song/models/song.dart';

class SongsPage extends StatefulWidget {
  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  late Future<List<Song>> _futureSongs;

  @override
  void initState() {
    super.initState();
    _futureSongs = fetchSongs();
  }

  Future<List<Song>> fetchSongs() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Song> songs = responseData.map((data) {
        return Song.fromJson({
          'id': data['id'],
          'title': data['title'],
          'thumbnailUrl': data['thumbnailUrl'],
        });
      }).toList();
      return songs;
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context, listen: false);

    return FutureBuilder<List<Song>>(
      future: _futureSongs,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading songs'));
        } else {
          return SongsList(songs: snapshot.data!);
        }
      },
    );
  }
}
