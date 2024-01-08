import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_kiosk/src/features/user/scan_qr/qr_listener.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_layout.dart';
import 'package:login_kiosk/src/view/widgets/back_to_home_button.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';

class ScanQrView extends StatelessWidget {
  const ScanQrView({super.key, required this.themeController});

  final ThemeController themeController;
  static const routeName = "/scan_qr";

  @override
  Widget build(BuildContext context) {
    return BackgroundImageLayout(
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: BackToHomeButton(themeController: themeController),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Present your QR code.",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34
                  )),
              const SizedBox(height: 30),
              SizedBox(
                height: 350,
                child: SvgPicture.asset(
                  'assets/vectors/scan_qr/qr_code.svg',
                  semanticsLabel: 'Acme Logo'
                ),
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: PrimaryButton(
                      themeController: themeController, 
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      }, 
                      title: 'Enter Barcode')
                  ),
                ],)
            ],
          ),
          const QrReaderView(),
        ],
      )
    
    );
  }
}

