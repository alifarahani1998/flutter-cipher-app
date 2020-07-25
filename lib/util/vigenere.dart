import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:url_launcher/url_launcher.dart';

class vigenere extends StatefulWidget {
  @override
  _vigenere createState() => _vigenere();
}

class _vigenere extends State<vigenere> {
  static const platform = const MethodChannel('flutter.native/helper');

  TextEditingController keyController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  ButtonState stateTextWithIcon = ButtonState.idle;
  bool complete;
  String response = '';


  Future<void> responseFromNativeCode() async {
    try {
      final String result = await platform.invokeMethod('vigenere', {'temp2' : [keyController.text, messageController.text.replaceAll(' ', '')]});
      setState(() {
        response = result;
      });
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      print(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Center(
              child: Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: InkWell(
                    onTap: () => launch('https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher'),
                    child: Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.asset(
                                'assets/images/Vigenere.jpg'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            'بیشتر بدانید',
                            style: TextStyle(
                                fontFamily: 'IRANSansMobile',
                                color: Colors.blue
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
        ],
        title: Text(
          'ویگنر',
          style: TextStyle(
              fontFamily: 'IRANSansMobile',
              color: Colors.white
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Center(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        cursorColor: Colors.blue,
                        controller: keyController,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'کلید',
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
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        cursorColor: Colors.blue,
                        controller: messageController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'متن آشکار',
                          prefixIcon: Icon(
                            Icons.email,
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
                    Directionality(
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
                    Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: response.isEmpty
                            ? Lottie.asset('assets/animations/lock_update.json', height: 200)
                            : Container(
                            width: 300,
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
                                            'متن رمز',
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
                )
              ],
            )),
      ),
    );
  }

  void onPressedIconWithText() {

    if (keyController.text.isNotEmpty && messageController.text.isNotEmpty)
      complete = true;
    else complete = false;

    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Timer(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon = complete
                ? ButtonState.success
                : ButtonState.fail;
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
        responseFromNativeCode();
      else if (stateTextWithIcon == ButtonState.fail)
        Fluttertoast.showToast(
            msg: "لطفا موارد بالا را به درستی کامل نمایید",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
      else {
        setState(() {
          response = '';
        });
      }
    });
  }
}

