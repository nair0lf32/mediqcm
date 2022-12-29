import 'package:flutter/material.dart';
import 'package:mediqcm/Services/user_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFirstRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyFirstRouteState();
}

class _MyFirstRouteState extends State<MyFirstRoute> {
  //nice function to checks if user is logged in or not
  void checkUserStatus() async {
    var _auth = MyUserAuth();
    if (_auth.isLogged()) {
      Navigator.popAndPushNamed(context, 'home');
    } else {
      Navigator.popAndPushNamed(context, 'login');
    }
  }

  //Function to check if new user or not
  Future<void> checkNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _isNew = prefs.getBool('isNewUser');
    if (_isNew == false) {
      //If he is not new, is he logged in?
      checkUserStatus();
    } else {
      //You are hereby declared a new user! welcome!
      await prefs.setBool('isNewUser', true);
      Navigator.pushReplacementNamed(context, 'welcome');
    }
  }

  @override
  void initState() {
    super.initState();
    //Check if new user
    checkNewUser();
  }

  @override
  Widget build(BuildContext context) {
    //Just for the sake of it!!
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
