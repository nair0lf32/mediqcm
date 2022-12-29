import 'package:flutter/material.dart';
import 'package:mediqcm/Views/first_route.dart';
import 'package:mediqcm/Views/home.dart';
import 'package:mediqcm/Views/login.dart';
import 'package:mediqcm/Views/register.dart';
import 'package:mediqcm/Views/welcome.dart';

/*
* All the named routes used in the App
* Called in main.dart to defines routes in the MaterialApp
* */
var myRoutes = <String, WidgetBuilder>{
  'firstRoute': (context) => MyFirstRoute(),
  'register': (context) => MyRegister(),
  'login': (context) => MyLogin(),
  'welcome': (context) => MyWelcome(),
  'home': (context) => MyHome(),
};
