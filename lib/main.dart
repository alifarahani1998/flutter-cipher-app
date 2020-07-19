import 'package:cipherapp/ui/splash.dart';
import 'package:cipherapp/util/affine.dart';
import 'package:cipherapp/util/caesar.dart';
import 'package:cipherapp/util/diffiehellman.dart';
import 'package:cipherapp/util/playfair.dart';
import 'package:cipherapp/util/rsa.dart';
import 'package:cipherapp/util/vigenere.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/affine" : (context) =>  new Directionality(textDirection: TextDirection.rtl, child:  Affine()),
        "/caesar" : (context) =>  new Directionality(textDirection: TextDirection.rtl, child:  Caesar()),
        "/diffiehellman" : (context) =>  new Directionality(textDirection: TextDirection.rtl, child:  DiffieHellman()),
        "/playfair" : (context) =>  new Directionality(textDirection: TextDirection.rtl, child:  PlayFair()),
        "/rsa" : (context) =>  new Directionality(textDirection: TextDirection.rtl, child:  RSA()),
        "/vigenere" : (context) =>  new Directionality(textDirection: TextDirection.rtl, child:  Vigenere()),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.green,
      ),
      title: 'ramzineh',
      home: Splash(),

    );
  }
}
