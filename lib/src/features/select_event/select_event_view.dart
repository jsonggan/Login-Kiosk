import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class SelectEventView extends StatefulWidget {
  const SelectEventView({
    super.key,
    required this.themeController,
  });

  static const routeName = '/home';
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

    return Scaffold(
      body: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/login/login.png',
            height: viewportHeight, 
            fit: BoxFit.cover
            ), 
          Expanded(
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
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
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
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: widget.themeController.primaryColor, 
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),

        ],
      ),
    );
  }
}
