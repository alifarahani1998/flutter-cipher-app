import 'package:cipherapp/ui/navigation_view/home.dart';
import 'package:cipherapp/ui/navigation_view/profile.dart';
import 'package:cipherapp/ui/navigation_view/race.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cipherapp/assets/my_flutter_app_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Race(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        initialIndex: 0,
        backgroundColor: Colors.blue,
        color: Colors.white,
        items: <Widget>[
          Icon(MyFlutterApp.homie, size: 30, color: Colors.blue,),
          Icon(MyFlutterApp.race, size: 30, color: Colors.blue,),
          Icon(MyFlutterApp.profile, size: 30, color: Colors.blue,),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
