import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.themeController,
  });

  static const routeName = '/home';
  final ThemeController themeController;

  @override
  State<HomeView> createState() => _HomeViewState();
}

// DropdownMenuEntry labels and values for the first dropdown menu.
enum Event {
  sentosa('SentosaFest', Colors.blue),
  tech('TechWeek', Colors.grey);

  const Event(this.label, this.color);
  final String label;
  final Color color;
}

class _HomeViewState extends State<HomeView> {
@override
  Widget build(BuildContext context) {
    final double viewportHeight = MediaQuery.of(context).size.height;
    final TextEditingController colorController = TextEditingController();

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
                      initialSelection: Event.sentosa,
                      controller: colorController,
                      // requestFocusOnTap is enabled/disabled by platforms when it is null.
                      // On mobile platforms, this is false by default. Setting this to true will
                      // trigger focus request on the text field and virtual keyboard will appear
                      // afterward. On desktop platforms however, this defaults to true.
                      requestFocusOnTap: true,
                      label: const Text('Color'),
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
                          style: MenuItemButton.styleFrom(
                            foregroundColor: color.color,
                          ),
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
