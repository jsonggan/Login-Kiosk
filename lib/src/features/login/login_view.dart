import 'package:flutter/material.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.themeController,
  });

  static const routeName = '/login';
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    final double viewportHeight = MediaQuery.of(context).size.height;

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
                        'Sign in to FrontHAUS',
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
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'PIN',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: false,
                      ),
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
                          // Handle sign in
                        },
                        style: ElevatedButton.styleFrom(
                          primary: themeController.primaryColor, 
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 16.0,
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
