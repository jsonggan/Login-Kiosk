import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_kiosk/src/features/user/type_barcode/rounded_button.dart';
import 'package:login_kiosk/src/features/user/type_barcode/type_barcode_text_field_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/background_image_layout.dart';
import 'package:login_kiosk/src/view/widgets/back_to_home_button.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';
import 'package:login_kiosk/src/view/widgets/text_input_field.dart';

class TypeBarcodeView extends StatelessWidget {
  const TypeBarcodeView({super.key, required this.themeController});

  final ThemeController themeController;
  static const routeName = "/type_barcode";

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final double screenHeight = MediaQuery.of(context).size.height;

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
                "Please type the barcode found below the QR code.",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34,
                  fontWeight: FontWeight.w700
                  )),
              SizedBox(height: keyboardIsOpen ? 10 : 30),
              
              ConstrainedBox(
                constraints: !keyboardIsOpen ? BoxConstraints(
                  minHeight: screenHeight * 0.1, // Adjust this value as needed
                  maxHeight: screenHeight * 0.3, // Adjust this value as needed
                ) : BoxConstraints(
                  minHeight: screenHeight * 0.1, // Adjust this value as needed
                  maxHeight: screenHeight * 0.2, // Adjust this value as needed
                ),
                child: SvgPicture.asset(
                  'assets/vectors/type_barcode/qr_code.svg',
                  semanticsLabel: 'demo QR code'
                ),
              ),
              
              SizedBox(height: keyboardIsOpen ? 5 : 10),
              const Text(
                "EXAMPLE-123A545",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34,
                  fontWeight: FontWeight.w700
                  )),
              SizedBox(height: keyboardIsOpen ? 10 : 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeBarcodeTextFieldView(themeController: themeController, onTextChanged: (value) {
                    debugPrint(value);
                  }),
                  const SizedBox(width: 20),
                  RoundedButton(themeController: themeController, onPressed: () {
                    debugPrint('rounded button');
                  }, title: "asd")
                ],
              )
            ],),
        ],
      )
    
    );
  }
}

