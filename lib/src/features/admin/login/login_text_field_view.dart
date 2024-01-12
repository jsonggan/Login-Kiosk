import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class LoginTextFieldView extends StatelessWidget {
  const LoginTextFieldView({
    super.key,
    required this.themeController,
    required this.onTextChanged,
  });

  final ThemeController themeController;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeController.primaryColor,
                  width: 1.0
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: themeController.primaryColor,
                  width: 1.0
                )),
              labelText: 'PIN',
            ),
            obscureText: false,
            onChanged: (value) {
              onTextChanged(value);
            }
          ),
        ),
      ],
    );
  }
}

