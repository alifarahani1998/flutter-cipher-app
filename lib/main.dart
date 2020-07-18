import 'package:cipherapp/ui/splash.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.green,
      ),
      title: 'ramzineh',
      home: Splash(),

    );
  }
}
