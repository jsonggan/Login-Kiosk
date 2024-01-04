import 'package:flutter/material.dart';

class BackgroundImageLayout extends StatelessWidget {
  final Widget child;

  BackgroundImageLayout({required this.child});

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
        child: child,
      ),
    );
  }
}
