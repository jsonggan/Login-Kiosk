import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/admin/login/login_button_view.dart';
import 'package:login_kiosk/src/features/admin/login/login_text_field_view.dart';
import 'package:login_kiosk/src/features/admin/login/login_title_view.dart';
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

class LoginField extends StatefulWidget {
  const LoginField({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  String _pin = '';

  void _updatePin(String newPin) {
    setState(() {
      _pin = newPin;
    });
  }

  void _signIn() {
    debugPrint("here is the pin $_pin");
    // call to api
    Navigator.pushNamed(context, '/select_event');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const LoginTitleView(),
          const SizedBox(height: 20.0),
          LoginTextFieldView(
            themeController: widget.themeController,
            onTextChanged: _updatePin,
            ),
          const SizedBox(height: 16.0),
          LoginButtonView(
            themeController: widget.themeController,
            onSignInPressed: _signIn,
            pin: _pin),
        ],
      ),
    );
  }
}

