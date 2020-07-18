import 'dart:async';

import 'package:cipherapp/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Lottie.asset('assets/animations/lock_splash.json')
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    waitTime();
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  waitTime() {
    timer = new Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage()
      ));
    });
  }

}



