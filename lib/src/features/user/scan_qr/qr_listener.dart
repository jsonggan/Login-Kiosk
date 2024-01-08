import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrReaderView extends StatefulWidget {
  const QrReaderView({
    super.key,
  });

  @override
  State<QrReaderView> createState() => _QrReaderViewState();
}

class _QrReaderViewState extends State<QrReaderView> {
  final FocusNode _focusNode = FocusNode();
  String _scannedCode = '';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final key = event.data.logicalKey;

      if (key == LogicalKeyboardKey.enter) {
        // back to default state when the enter key is pressed
        debugPrint('Scanned QR Code: $_scannedCode');
        Navigator.pushNamed(context, "/success");
        setState(() {
          _scannedCode = '';
        });
      } else {
        // Check if the key is a character key
        final String keyLabel = key.keyLabel;
        if (keyLabel.length == 1 && event.data is RawKeyEventDataAndroid) {
          final RawKeyEventDataAndroid data = event.data as RawKeyEventDataAndroid;
          String char = keyLabel;
          
          // Handle shift key for capitalization
          if (data.isShiftPressed) {
            char = char.toUpperCase();
          } else {
            char = char.toLowerCase();
          }
          
          setState(() {
            _scannedCode += char;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: _handleKey,
      child: Container(),
    );
  }
}

