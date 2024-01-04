import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/admin/select_event/select_event_button_view.dart';
import 'package:login_kiosk/src/features/admin/select_event/select_event_dropdown_view.dart';
import 'package:login_kiosk/src/features/admin/select_event/select_event_title_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/admin_setup_layout.dart';

class SelectEventView extends StatefulWidget {
  const SelectEventView({
    super.key,
    required this.themeController,
  });

  static const routeName = '/select_event';
  final ThemeController themeController;

  @override
  State<SelectEventView> createState() => _SelectEventViewState();
}

class _SelectEventViewState extends State<SelectEventView> {
  String _event = '';

  void _updateEvent(String event) {
    setState(() {
      _event = event;
    });
  }

  void _selectEvent() {
    debugPrint("here is the event $_event");
    // call to api
    if (_event.isNotEmpty) {
      Navigator.pushNamed(context, '/home');
    } else {
      debugPrint('There is no selected event');
    }
  }

  @override
    Widget build(BuildContext context) {
      return AdminSetupLayout(
        child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SelectEventTitleView(),
            const SizedBox(height: 20.0),
            SelectEventDropdownView(
              themeController: widget.themeController,
              onChange: _updateEvent),
            const SizedBox(height: 16.0),
            SelectEventButtonView(
              onPressed: _selectEvent, 
              themeController: widget.themeController
            ),
          ],
        ),
      ));
    }
}
