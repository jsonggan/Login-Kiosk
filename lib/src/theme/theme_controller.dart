import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_model.dart';

import 'theme_service.dart';

/// A class that should be initialized to update current theme from api
class ThemeController with ChangeNotifier {
  ThemeController(this._themeService, this._currentTheme);

  ThemeModel _currentTheme;
  final ThemeService _themeService;
  
  Color get primaryColor => Color(int.parse(_currentTheme.primaryColor));

  /// Load the theme from the ThemeService. 
  Future<void> loadSettings() async {
    // call the loadTheme in service
    _currentTheme = await _themeService.loadTheme();
    notifyListeners();
  }

  /// Update and persist the theme based on current selected event.
  Future<void> updateTheme(ThemeModel newTheme) async {
    await _themeService.updateTheme(newTheme);
    _currentTheme = newTheme;
    notifyListeners();
  }
}
