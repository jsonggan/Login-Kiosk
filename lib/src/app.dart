import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_kiosk/src/features/user/home/home_view.dart';
import 'package:login_kiosk/src/features/admin/select_event/select_event_view.dart';
import 'package:login_kiosk/src/features/admin/login/login_view.dart';
import 'package:login_kiosk/src/features/user/scan_qr/scan_qr_view.dart';
import 'package:login_kiosk/src/features/user/type_barcode/type_barcode_view.dart';
import 'package:login_kiosk/src/theme/theme_controller.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],

          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          theme: ThemeData(fontFamily: 'Helvetica'),
          darkTheme: ThemeData.dark(),

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SelectEventView.routeName:
                    return SelectEventView(themeController: widget.themeController);
                  case HomeView.routeName:
                    return HomeView(themeController: widget.themeController);
                  case ScanQrView.routeName:
                    return ScanQrView(themeController: widget.themeController);
                  case TypeBarcodeView.routeName:
                    return TypeBarcodeView(themeController: widget.themeController);
                  default:
                    return ScanQrView(themeController: widget.themeController);
                }
              },
            );
          },
        );
      },
    );
  }
}
