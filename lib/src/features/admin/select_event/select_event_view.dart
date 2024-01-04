import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/admin_setup_layout.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';

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

// DropdownMenuEntry labels and values for the first dropdown menu.
enum Event {
  sentosa('SentosaFest'),
  tech('TechWeek');

  const Event(this.label);
  final String label;
}

class _SelectEventViewState extends State<SelectEventView> {
@override
  Widget build(BuildContext context) {
    final double viewportHeight = MediaQuery.of(context).size.height;
    final TextEditingController eventController = TextEditingController();

    Event? selectedColor;

    return AdminSetupLayout(child: SelectEventField(eventController, selectedColor));
  }

  Expanded SelectEventField(TextEditingController eventController, Event? selectedColor) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Row(
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
          ),
        
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownMenu<Event>(
                width: 400,
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.themeController.primaryColor)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                ),
                initialSelection: Event.sentosa,
                enableSearch: false,
                enableFilter: false,
                controller: eventController,
                requestFocusOnTap: false,
                label: const Text('Event'),
                onSelected: (Event? color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                dropdownMenuEntries: Event.values
                    .map<DropdownMenuEntry<Event>>(
                        (Event color) {
                  return DropdownMenuEntry<Event>(
                    value: color,
                    label: color.label,
                    enabled: color.label != 'Grey',
                    // style: MenuItemButton.styleFrom(
                    //   foregroundColor: color.color,
                    // ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  themeController: widget.themeController,
                  title: "Next",
                  ),
              ),
            ],
          ),
        ],
      ),
    );
}
}
