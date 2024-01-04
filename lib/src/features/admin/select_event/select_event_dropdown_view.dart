import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.
enum Event {
  sentosa('SentosaFest'),
  tech('TechWeek');

  const Event(this.label);
  final String label;
}

class SelectEventDropdownView extends StatefulWidget {
  SelectEventDropdownView({
    super.key,
    required this.themeController,
    required this.onChange
  });

  final ThemeController themeController;
  final Function(String) onChange;

  @override
  State<SelectEventDropdownView> createState() => _SelectEventDropdownViewState();
}

class _SelectEventDropdownViewState extends State<SelectEventDropdownView> {
  final TextEditingController eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownMenu<Event>(
          onSelected: (Event? selectedEvent) {
            widget.onChange(selectedEvent!.label);
          },
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
          dropdownMenuEntries: Event.values
              .map<DropdownMenuEntry<Event>>(
                  (Event color) {
            return DropdownMenuEntry<Event>(
              value: color,
              label: color.label,
              enabled: color.label != 'Grey',
            );
          }).toList(),

          
        ),
      ],
    );
  }
}
