import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.themeController,
    required this.onPressed,
    required this.title,
  });

  final ThemeController themeController;
  final VoidCallback onPressed;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65, // Adjust size for circular shape
      height: 65, // Adjust size for circular shape
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: themeController.primaryColor, 
          foregroundColor: themeController.primaryOnFocus,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33)
          )
        ),
        child: SvgPicture.asset(
          'assets/vectors/type_email/next.svg',
          semanticsLabel: 'Next'
        ),
      ),
    );
  }
}