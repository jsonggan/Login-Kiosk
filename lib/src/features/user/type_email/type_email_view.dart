import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_kiosk/src/features/user/type_email/type_email_field_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_home_button_layout.dart';

class TypeEmailView extends StatelessWidget {
  const TypeEmailView({super.key, required this.themeController});

  final ThemeController themeController;
  static const routeName = "/type_barcode";

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final double screenHeight = MediaQuery.of(context).size.height;

    return BackgroundImageHomeButtonLayout(
      child: TypeEmailFieldView(
        keyboardIsOpen: keyboardIsOpen, 
        screenHeight: screenHeight, 
        themeController: themeController
      ),
    );
  }
}

