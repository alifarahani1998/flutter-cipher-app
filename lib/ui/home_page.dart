import 'package:cipherapp/cipher/cipher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    List<Cipher> cipherList = new List();
    cipherList.add(Cipher('سزار', 'assets/images/caesar.jpg'));
    cipherList.add(Cipher('ویگنر', 'assets/images/caesar.jpg'));
    cipherList.add(Cipher('آفین', 'assets/images/caesar.jpg'));
    cipherList.add(Cipher('دیفی هلمن', 'assets/images/caesar.jpg'));
    cipherList.add(Cipher('پلیفیر', 'assets/images/caesar.jpg'));
    cipherList.add(Cipher('rsa', 'assets/images/caesar.jpg'));


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'رمزینه',
          style: TextStyle(fontFamily: 'IRANSansMobile'),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: cipherList.length,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.red,
                    child: InkWell(
                      onTap: () => print("fsd"),
                      child: Container(
                          height: 100,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
                              child: Image.asset(cipherList[position].picUrl),
                            ),
                          )
                      ),
                    )
                ),
              );
            }),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.transparent,
        color: Colors.yellow,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.gamepad, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
