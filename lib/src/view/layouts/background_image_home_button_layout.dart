import 'package:flutter/material.dart';
import 'package:login_kiosk/src/view/widgets/back_to_home_button.dart';

class BackgroundImageHomeButtonLayout extends StatelessWidget {
  final Widget child;

  BackgroundImageHomeButtonLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: BackToHomeButton(),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
