import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediqcm/Config/routes.dart';
import 'package:mediqcm/Config/themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'firebase_options.dart';

/* ENTRY POINT
using Provider for theme switching
and fireStore as database
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialise firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //ThemeData file called from Config
    final themeValues = MyThemeData();

    //RiverPod ProviderScope
    return ProviderScope(
      //AdaptiveTheme wrapper for easy dark/night mode
      child: AdaptiveTheme(
        light: themeValues.lightTheme,
        dark: themeValues.darkTheme,
        initial: AdaptiveThemeMode.dark,
        builder: (theme, darkTheme) {
          return MaterialApp(
            //Responsive framework for lazy devs
            builder: (context, child) => ResponsiveWrapper.builder(child,
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(480, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                ],
                background: Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                )),
            //MaterialApp settings
            title: 'MediQcm',
            theme: theme,
            darkTheme: darkTheme,
            initialRoute: 'welcome',
            routes: myRoutes,
          );
        },
      ),
    );
  }
}
