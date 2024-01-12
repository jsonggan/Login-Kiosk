import 'package:flutter/material.dart';

/// A class that many Widgets can interact with to read auth token, update
/// auth token
///
/// Controllers glue Data Services to Flutter Widgets. The AuthController
/// uses the SettingsService to store and retrieve user settings.
class AuthController with ChangeNotifier {
  AuthController();

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
  }
}
