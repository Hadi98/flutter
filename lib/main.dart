import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song/providers/song_provider.dart';
import 'package:song/providers/news_provider.dart';
import 'package:song/screens/home_screen.dart';
import 'package:song/screens/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SongProvider()),
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'Song App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),

        },
      ),
    );
  }
}
