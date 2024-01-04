import 'package:flutter/material.dart';

class SelectEventTitleView extends StatelessWidget {
  const SelectEventTitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child:  Text(
            'Select Event',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
