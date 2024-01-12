import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.themeController,
    required this.onTextChanged,
    required this.labelText,
  });

  final ThemeController themeController;
  final Function(String) onTextChanged;
  final String labelText;

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
              labelText: labelText,
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

