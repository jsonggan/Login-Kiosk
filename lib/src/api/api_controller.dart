import 'package:flutter/material.dart';

/// A class that allow call to the api server
///
/// Controllers glue api service to other classes. The ApiController
/// uses the SettingsService to store and retrieve user settings.
class ApiController with ChangeNotifier {
  ApiController();

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
  }
}
