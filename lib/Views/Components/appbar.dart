import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
The top AppBar
*/
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
  final String title = '';

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    // The actual Appbar with actions icons
    return AppBar(
        leading: Theme.of(context).brightness == Brightness.dark
            ? Image.asset(
                'assets/images/logo-dark.png',
                height: 50,
                width: 80,
              )
            : Image.asset(
                'assets/images/logo.png',
                height: 50,
                width: 80,
              ),
        actions: [
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? Icon(
                    FontAwesomeIcons.moon,
                    size: 25,
                    color: Colors.amber[50],
                  )
                : Icon(
                    FontAwesomeIcons.sun,
                    size: 25,
                    color: Colors.yellow[200],
                  ),
            onPressed: () {
              setState(() {
                Theme.of(context).brightness == Brightness.dark
                    ? AdaptiveTheme.of(context).setLight()
                    : AdaptiveTheme.of(context).setDark();
              });
            },
          ),
        ]);
  }
}
