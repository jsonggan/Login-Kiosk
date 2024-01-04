import 'package:flutter/material.dart';
import 'package:login_kiosk/src/features/admin/login/login_title_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:login_kiosk/src/view/layouts/admin_setup_layout.dart';
import 'package:login_kiosk/src/view/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.themeController,
  });

  static const routeName = '/login';
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return AdminSetupLayout(child: LoginField(themeController: themeController));
  }
}

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const LoginTitleView(),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeController.primaryColor,
                        width: 1.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeController.primaryColor,
                        width: 1.0
                      )),
                    labelText: 'PIN',
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
                child: PrimaryButton(
                  themeController: themeController,
                  title: "Sign In",
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_event');
                  },),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

