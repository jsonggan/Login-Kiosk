import 'package:shared_preferences/shared_preferences.dart';
import 'theme_model.dart';
import 'dart:convert';

/// A service that stores and retrieves theme.
///
/// By default, this class persist theme.
class ThemeService {
  SharedPreferences localStorage;

  ThemeService(this.localStorage);

  /// Loads the theme from local storage.
  Future<ThemeModel> loadTheme() async {
    final String? themeString = localStorage.getString('theme');
    if (themeString != null) {
      return ThemeModel.fromJson(json.decode(themeString));
    }
    // Load default theme
    return ThemeModel.defaultTheme();
  }

  Future<void> updateTheme(ThemeModel theme) async {
    await localStorage.setString('theme', json.encode(theme.toJson()));
  }
}
