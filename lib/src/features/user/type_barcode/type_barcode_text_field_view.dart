import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class TypeBarcodeTextFieldView extends StatelessWidget {
  const TypeBarcodeTextFieldView({
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
              fillColor: Colors.grey[200],
              filled: true,
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

