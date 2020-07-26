import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class RSA extends StatefulWidget {
  @override
  _RSAState createState() => _RSAState();
}

class _RSAState extends State<RSA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset('assets/animations/fail.json', height: 100),
              Text(
                'این رمزنگاری در نسخه بعدی فعال خواهد بود',
                style: TextStyle(
                    fontFamily: 'IRANSansMobile',
                    fontSize: 20
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
