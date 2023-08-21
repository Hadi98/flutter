import 'package:flutter/foundation.dart';
import 'package:song/models/profile.dart';

class ProfileProvider with ChangeNotifier {
  Profile? _profile;

  Profile? get profile => _profile;

  Future<void> fetchProfileData() async {
    // Fetch profile data from your API or local storage
    // Update _profile with the fetched data
    _profile = Profile(name: 'John Doe'); // Example data
    notifyListeners();
  }
}