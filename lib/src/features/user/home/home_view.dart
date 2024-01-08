import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_layout.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';
import 'package:login_kiosk/src/view/widgets/secondary_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.themeController});

  final ThemeController themeController;
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return BackgroundImageLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Find the event QR code in your registered email.",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 34
              )),
          const SizedBox(height: 30),
          const Image(image: AssetImage("assets/images/home/qr_in_mail.png")),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: SecondaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/type_barcode');
                  }, 
                  title: "Enter Barcode"),
              ),
              const SizedBox(width: 24,),
              SizedBox(
                width: 400,
                child: PrimaryButton(
                  themeController: themeController, 
                  onPressed: () {
                    Navigator.pushNamed(context, '/scan_qr');
                  }, 
                  title: 'Scan QR Code')
              ),
            ],)
        ],)
    
    );
  }
}