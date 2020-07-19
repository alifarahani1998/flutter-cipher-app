import 'package:flutter/material.dart';


class Vigenere extends StatefulWidget {
  @override
  _VigenereState createState() => _VigenereState();
}

class _VigenereState extends State<Vigenere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
              'vigenere'
          ),
        ),
      ),
    );
  }
}
