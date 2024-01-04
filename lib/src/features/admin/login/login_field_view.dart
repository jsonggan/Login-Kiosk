import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/admin/login/login_button_view.dart';
import 'package:login_kiosk/src/features/admin/login/login_text_field_view.dart';
import 'package:login_kiosk/src/features/admin/login/login_title_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

import 'package:fluttertoast/fluttertoast.dart';

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
    Fluttertoast.showToast(
      msg: "Login button clicked",  // Customize this message as needed
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0
    );
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

