import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';

class SelectEventButtonView extends StatelessWidget {
  const SelectEventButtonView({super.key, required this.onPressed, required this.themeController});

  final Function() onPressed;
  final ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: PrimaryButton(
            onPressed: onPressed,
            themeController: themeController,
            title: "Next",
            ),
        ),
      ],
    );
  }
}