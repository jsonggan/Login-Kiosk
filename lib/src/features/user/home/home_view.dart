import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_layout.dart';

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
          const SizedBox(height: 24),
          const Image(image: AssetImage("assets/images/home/qr_in_mail.png")),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: themeController.primaryColor, 
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Enter Barcode',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: themeController.primaryColor, 
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
                ),
              ),
            ],)
        ],)
    
    );
  }
}