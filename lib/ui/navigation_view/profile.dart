import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  SharedPreferences preferences;
  var score, gameNum;

  @override
  void initState() {
    super.initState();
    getSpec();
  }

  getSpec() async {
    preferences = await SharedPreferences.getInstance();
    nameController.text = preferences.getString('name');
    emailController.text = preferences.getString('email');
    phoneController.text = preferences.getString('phone');
    setState(() {
      score = preferences.getInt('score');
    });
    if (score == null)
      setState(() {
        score = 0;
      });
    setState(() {
      gameNum = preferences.getInt('gameNum');
    });
    if (gameNum == null)
      setState(() {
        gameNum = 0;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)])),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Center(
                child: Column(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    'assets/images/person.png',
                    color: Colors.white,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: TextField(
                      controller: nameController,
                      cursorColor: Colors.blue,
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile', color: Colors.blue),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        focusColor: Colors.blue,
                        hoverColor: Colors.blue,
                        fillColor: Colors.blue,
                        hintText: 'نام و نام خانوادگی',
                        hintStyle: TextStyle(color: Colors.blue),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: TextField(
                      controller: emailController,
                      cursorColor: Colors.blue,
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile', color: Colors.blue),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusColor: Colors.blue,
                        hoverColor: Colors.blue,
                        fillColor: Colors.blue,
                        hintText: 'ایمیل',
                        hintStyle: TextStyle(color: Colors.blue),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: TextField(
                      controller: phoneController,
                      cursorColor: Colors.blue,
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile', color: Colors.blue),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        focusColor: Colors.blue,
                        hoverColor: Colors.blue,
                        fillColor: Colors.blue,
                        hintText: 'شماره همراه (98+)',
                        hintStyle: TextStyle(color: Colors.blue),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Text(
                        'امتیاز شما:  ' + score.toString(),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'IRANSansMobile',
                            color: Colors.blue),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Text(
                        'تعداد بازی های شما:  ' + gameNum.toString(),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'IRANSansMobile',
                            color: Colors.blue),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(Icons.settings),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Icon(Icons.info_outline),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(Icons.exit_to_app),
                            ),
                          ),
                          onTap: () => showAlert(),
                        )
                      )
                    ],
                  )
                )
              ],
            )),
          ],
        ));
  }

  showAlert() {
    showDialog(context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
                width: 300,
                height: 200,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'آیا می خواهید از حساب کاربری خود خارج شوید؟',
                        style: TextStyle(
                            fontFamily: 'IRANSansMobile',
                            fontSize: 20
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'خیر',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'IRANSansMobile',
                                  fontSize: 20
                              ),
                            ),
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: RaisedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'بله',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'IRANSansMobile',
                                    fontSize: 20
                                ),
                              ),
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
          );
        });
  }


  @override
  void dispose() {

    if (nameController.text.isNotEmpty)
      preferences.setString('name', nameController.text);
    if (phoneController.text.isNotEmpty)
      preferences.setString('phone', phoneController.text);
    if (emailController.text.isNotEmpty)
      preferences.setString('email', emailController.text);

    super.dispose();
  }
}
