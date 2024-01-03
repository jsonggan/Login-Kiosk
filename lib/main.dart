import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/theme/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  var themeService = ThemeService(localStorage);
  var themeModel = await themeService.loadTheme();
  final themeController = ThemeController(themeService, themeModel);

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await themeController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(themeController: themeController));
}
