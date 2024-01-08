import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/widgets/secondary_button.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({
    super.key,
    this.themeController,
  });

  final ThemeController? themeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SecondaryButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          }, 
          title: 'Back To Home'),
      )
    );
  }
}