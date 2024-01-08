import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_kiosk/src/features/user/type_barcode/type_barcode_field_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_home_button_layout.dart';

class TypeBarcodeView extends StatelessWidget {
  const TypeBarcodeView({super.key, required this.themeController});

  final ThemeController themeController;
  static const routeName = "/type_barcode";

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final double screenHeight = MediaQuery.of(context).size.height;

    return BackgroundImageHomeButtonLayout(
      child: TypeBarcodeFieldView(
        keyboardIsOpen: keyboardIsOpen, 
        screenHeight: screenHeight, 
        themeController: themeController
      ),
    );
  }
}

