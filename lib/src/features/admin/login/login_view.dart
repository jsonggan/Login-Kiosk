import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/admin/login/login_field_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/admin_setup_layout.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.themeController,
  });

  static const routeName = '/login';
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return AdminSetupLayout(child: LoginField(themeController: themeController));
  }
}

