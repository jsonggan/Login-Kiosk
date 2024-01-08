import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_home_button_layout.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';

class FailView extends StatelessWidget {
  const FailView({super.key, required this.themeController});
  
  final ThemeController themeController;
  static const routeName = "/fail";

  @override
  Widget build(BuildContext context) {
    return BackgroundImageHomeButtonLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: SvgPicture.asset(
              'assets/vectors/fail/fail.svg',
              semanticsLabel: 'Fail'
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Unverified! Please try again.",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 34,
              fontWeight: FontWeight.w700
              )
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: PrimaryButton(
                  themeController: themeController, 
                  onPressed: () {
                    Navigator.pushNamed(context, "/scan_qr");
                  }, 
                  title: "Scan QR Code"
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}