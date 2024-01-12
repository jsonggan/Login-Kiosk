import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/user/type_email/text_field_with_button_view.dart';
import 'package:login_kiosk/src/features/user/type_email/type_email_qr_code_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class TypeEmailFieldView extends StatelessWidget {
  const TypeEmailFieldView({
    super.key,
    required this.keyboardIsOpen,
    required this.screenHeight,
    required this.themeController,
  });

  final bool keyboardIsOpen;
  final double screenHeight;
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Please type your registered email.",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 34,
            fontWeight: FontWeight.w700
            )),
        SizedBox(height: keyboardIsOpen ? 10 : 30),
        QrCodeView(keyboardIsOpen: keyboardIsOpen, screenHeight: screenHeight),
        SizedBox(height: keyboardIsOpen ? 10 : 30),
        TextFieldWithButtonView(themeController: themeController)
      ],);
  }
}
