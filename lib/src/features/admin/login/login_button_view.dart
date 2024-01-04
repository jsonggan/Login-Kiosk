import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({
    super.key,
    required this.themeController,
    required this.pin,
    required this.onSignInPressed
  });

  final ThemeController themeController;
  final String pin;
  final Function() onSignInPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: PrimaryButton(
            themeController: themeController,
            title: "Sign In",
            onPressed: onSignInPressed,),
        ),
      ],
    );
  }
}

