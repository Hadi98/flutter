import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/news.dart';

class NewsProvider with ChangeNotifier {
  List<News> _news = [];

  List<News> get news => _news;

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<News> newsList = responseData.map((data) {
        return News.fromJson({
          'id': data['id'],
          'title': data['title'],
          'body': data['body'],
        });
      }).toList();
      _news = newsList;
      notifyListeners();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
