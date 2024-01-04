import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBBBBBB), 
        foregroundColor: const Color(0xFF2D2D2D),
        side: const BorderSide(
          width: 1.0,
          color: Color(0xFF2D2D2D)
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
          ),
      ),
    );
  }
}
