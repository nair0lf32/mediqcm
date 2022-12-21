import 'package:flutter/material.dart';
import 'package:mediqcm/Views/welcome.dart';

/*
* All the named routes used in the App
* Called in main.dart to defines routes in the MaterialApp
* */
var myRoutes = <String, WidgetBuilder>{
  'welcome': (context) => MyWelcome(),
};
