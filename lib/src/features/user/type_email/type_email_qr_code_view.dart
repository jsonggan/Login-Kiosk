import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrCodeView extends StatelessWidget {
  const QrCodeView({
    super.key,
    required this.keyboardIsOpen,
    required this.screenHeight,
  });

  final bool keyboardIsOpen;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: !keyboardIsOpen ? BoxConstraints(
        minHeight: screenHeight * 0.1, // Adjust this value as needed
        maxHeight: screenHeight * 0.3, // Adjust this value as needed
      ) : BoxConstraints(
        minHeight: screenHeight * 0.1, // Adjust this value as needed
        maxHeight: screenHeight * 0.2, // Adjust this value as needed
      ),
      child: SvgPicture.asset(
        'assets/vectors/type_email/email.svg',
        semanticsLabel: 'Email address',
        height: 150,
        width: 150,
        color: Colors.grey[200],
        fit: BoxFit.fill,
      ),
    );
  }
}

