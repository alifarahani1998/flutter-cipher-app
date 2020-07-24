import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'dart:math' as Math;

import 'package:url_launcher/url_launcher.dart';

class DiffieHellman extends StatefulWidget {
  @override
  _DiffieHelman createState() => _DiffieHelman();
}

class _DiffieHelman extends State<DiffieHellman> {
  TextEditingController aController = new TextEditingController();
  TextEditingController bController = new TextEditingController();
  TextEditingController pController = new TextEditingController();
  TextEditingController gController = new TextEditingController();
  ButtonState stateTextWithIcon = ButtonState.idle;
  bool complete;
  String response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Center(
              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () => launch('https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange'),
                    child: Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.asset('assets/images/Whitfield_Diffie_Royal_Society.jpg'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3),
                          child: Text(
                            'بیشتر بدانید',
                            style: TextStyle(
                                fontFamily: 'IRANSansMobile',
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
        title: Text(
          'دیفی - هلمن',
          style: TextStyle(fontFamily: 'IRANSansMobile', color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          'Bob'
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.asset('assets/images/bob.png', height: 100,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: bController,
                                decoration: InputDecoration(
                                  hintText: 'b',
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  hintStyle: TextStyle(color: Colors.blue),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 70),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                            'Alice'
                        ),
                      ),
                      Image.asset('assets/images/alice.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: aController,
                                decoration: InputDecoration(
                                  hintText: 'a',
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  hintStyle: TextStyle(color: Colors.blue),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: pController,
                      decoration: InputDecoration(
                        hintText: 'p',
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: gController,
                      decoration: InputDecoration(
                        hintText: 'g',
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ProgressButton.icon(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'IRANSansMobile'
                          ),
                          iconedButtons: {
                            ButtonState.idle: IconedButton(
                                text: "رمز کن",
                                icon: Icon(Icons.lock, color: Colors.white),
                                color: Colors.blue),
                            ButtonState.loading: IconedButton(
                                text: "Loading", color: Colors.blue),
                            ButtonState.fail: IconedButton(
                                text: "ناموفق",
                                icon: Icon(Icons.cancel, color: Colors.white),
                                color: Colors.red.shade300),
                            ButtonState.success: IconedButton(
                                text: "رمز شد",
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                                color: Colors.green.shade400)
                          }, onPressed: onPressedIconWithText, state: stateTextWithIcon),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: response.isEmpty
                          ? Lottie.asset('assets/animations/lock_update.json', height: 200)
                          : Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue  ,
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'کلید مشترک',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: 'IRANSansMobile'
                                          ),
                                        ),
                                      )
                                  )
                              ),
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      response,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          )
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedIconWithText() {
    if (aController.text.isNotEmpty &&
        bController.text.isNotEmpty &&
        pController.text.isNotEmpty &&
        gController.text.isNotEmpty)
      complete = true;
    else
      complete = false;

    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Timer(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon =
                complete ? ButtonState.success : ButtonState.fail;
          });
        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });

    Timer(Duration(seconds: 2), () {
      if (stateTextWithIcon == ButtonState.success)
        power(double.parse(gController.text), double.parse(aController.text),
            double.parse(pController.text));
      else if (stateTextWithIcon == ButtonState.fail)
        Fluttertoast.showToast(
            msg: "لطفا موارد بالا را به درستی کامل نمایید",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      else {
        setState(() {
          response = '';
        });
      }
    });
  }

  void power(double a, double b, double p) {
    if (b == 1)
      setState(() {
        response = a.toString();
      });
    else
      setState(() {
        response = ((Math.pow(a, b)) % p).toString();
      });
  }
}
