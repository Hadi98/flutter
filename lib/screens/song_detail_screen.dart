import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:song/models/song.dart';
import 'package:song/widgets/custom_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongDetailScreen extends StatefulWidget {
  final Song song;

  SongDetailScreen({required this.song});

  @override
  _SongDetailScreenState createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  late Future<List<String>> _futureSuggestedPhotos;

  @override
  void initState() {
    super.initState();
    _futureSuggestedPhotos = fetchSuggestedPhotos();
  }

  Future<List<String>> fetchSuggestedPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=${widget.song.id}'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<String> suggestedPhotos = responseData
          .take(5)
          .map<String>((data) => data['thumbnailUrl'])
          .toList();
      return suggestedPhotos;
    } else {
      throw Exception('Failed to load suggested photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> titleWords = widget.song.title.split(' ');
    String appBarTitle = titleWords.take(1).join(' ');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 48,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.angleLeft, color: Colors.blue),
                  SizedBox(width: 2), // Add some spacing between icon and text
                  Text(
                    "Songs",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 140.0), // Add padding to the right
              child: Text(
                appBarTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: _futureSuggestedPhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading suggested photos'));
          } else {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.network(
                    widget.song.thumbnailUrl,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Text(
                    'You might also like:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String suggestedPhotoUrl = snapshot.data![index];
                      return ListTile(
                        leading: Image.network(
                          suggestedPhotoUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text('Suggested Photo ${index + 1}'),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // Replace with the desired index
        onTap: (index) {
          // Handle navigation based on index (0, 1, 2)
        },
      ),
    );
  }
}
