import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song/providers/song_provider.dart';
import 'package:song/providers/news_provider.dart';
import 'package:song/screens/songs_page.dart';
import 'package:song/screens/news_page.dart';
import 'package:song/screens/profile_page.dart'; // Import the profile page
import 'package:song/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> tabTitles = ['Songs', 'News', 'Profile'];

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_currentIndex) {
      case 0:
        body = Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SongsPage(),
        );
        break;
      case 1:
        body = NewsPage();
        break;
      case 2:
        body = ProfilePage();
        break;
      default:
        body = Container(); // Default to an empty container.
        break;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: _currentIndex == 0 ? Size.fromHeight(100) : Size.fromHeight(60), // Adjust the preferredSize based on _currentIndex
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: _currentIndex == 2
              ? Center(
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
              : _currentIndex == 0
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the ends
            children: [
              Text(
                tabTitles[_currentIndex],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.shuffle, color: Colors.blue),
                onPressed: () {
                  // Implement shuffle functionality here
                  // For example, you can call a shuffle method from Audio Service
                },
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tabTitles[_currentIndex],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            if (_currentIndex == 2)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: IconButton(
                  icon: Icon(Icons.settings, color: Colors.blue), // Add settings icon
                  onPressed: () {
                    // Implement settings functionality here
                  },
                ),
              ),
          ],
        ),
      ),

      body: _currentIndex == 0
          ? Container(
        width: double.infinity, // Take up the full width
        child: body,
      )
          : body,

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (_currentIndex == 2) {
            Navigator.of(context).pushNamed('/profile');
          }
        },
      ),
    );
  }
}
