import 'package:flutter/material.dart';

//Simply...a footer (duh) displayed on main pages
class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 20,
        ),
        Text(
          'copyright \u00a9 2022, mediqcm by nair0lf32',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}
