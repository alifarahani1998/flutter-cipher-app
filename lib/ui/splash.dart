import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cipherapp/ui/quiz/quiz1.dart';
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
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Column(
              children: <Widget>[
                Lottie.asset('assets/animations/lock_splash.json'),
                Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: SizedBox(
                          width: 250.0,
                          child: ColorizeAnimatedTextKit(
                              onTap: () {
                                print("Tap Event");
                              },
                              text: [
                                'رمزینه',
                              ],
                              textStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: "IRANSansMobile",
                                  color: Colors.white
                              ),
                              colors: [
                                Colors.white,
                                Colors.blue,
                                Colors.white,
                                Colors.white,
                              ],
                              textAlign: TextAlign.center,
                              alignment: AlignmentDirectional.center // or Alignment.topLeft
                          ),
                        ),
                      )
                  ),
                )
              ],
            )
        ),
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
    timer = new Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage()
      ));
    });
  }

}


