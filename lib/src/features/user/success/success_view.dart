import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_home_button_layout.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.themeController});
  
  final ThemeController themeController;
  static const routeName = "/success";

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
              'assets/vectors/success/success.svg',
              semanticsLabel: 'Success'
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Verified!",
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
              const Text(
                "Printing badge",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34,
                  fontWeight: FontWeight.w700
                  )
              ),
              const SizedBox(width: 15),
              Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}