import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/user/type_barcode/text_field_with_button_view.dart';
import 'package:login_kiosk/src/features/user/type_barcode/type_barcode_qr_code_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class TypeBarcodeFieldView extends StatelessWidget {
  const TypeBarcodeFieldView({
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
          "Please type the barcode found below the QR code.",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 34,
            fontWeight: FontWeight.w700
            )),
        SizedBox(height: keyboardIsOpen ? 10 : 30),
        QrCodeView(keyboardIsOpen: keyboardIsOpen, screenHeight: screenHeight),
        SizedBox(height: keyboardIsOpen ? 5 : 10),
        const Text(
          "EXAMPLE-123A545",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 34,
            fontWeight: FontWeight.w700
            )),
        SizedBox(height: keyboardIsOpen ? 10 : 30),
        TextFieldWithButtonView(themeController: themeController)
      ],);
  }
}
