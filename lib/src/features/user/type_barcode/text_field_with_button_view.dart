
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_kiosk/src/features/user/type_barcode/rounded_button.dart';
import 'package:login_kiosk/src/features/user/type_barcode/type_barcode_text_field_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class TextFieldWithButtonView extends StatefulWidget {
  const TextFieldWithButtonView({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  State<TextFieldWithButtonView> createState() => _TextFieldWithButtonViewState();
}

class _TextFieldWithButtonViewState extends State<TextFieldWithButtonView> {
    String _barcode = '';

  void _updateBarcode(String newBarcode) {
    setState(() {
      _barcode = newBarcode;
    });
  }

  void _onPressed() {
    debugPrint("here is the barcode $_barcode");

    // call to api
    if (_barcode.isNotEmpty) {
      Navigator.pushNamed(context, '/home');
    } else {
      Fluttertoast.showToast(
        msg: "Please key in your barcode",  
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 20.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypeBarcodeTextFieldView(
          themeController: widget.themeController, 
          onTextChanged: _updateBarcode,
        ),
        const SizedBox(width: 20),
        RoundedButton(
          themeController: widget.themeController, 
          onPressed: _onPressed, 
          title: ""
        )
      ],
    );
  }
}

