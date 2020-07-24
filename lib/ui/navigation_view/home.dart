import 'package:cipherapp/cipher/cipher.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Cipher> cipherList = new List();


  @override
  void initState() {
    super.initState();
    cipherList.add(Cipher('caesar', 'سزار', 'assets/images/caesar.jpg'));
    cipherList.add(Cipher('vigenere', 'ویگنر', 'assets/images/Vigenere.jpg'));
    cipherList.add(Cipher('affine', 'آفین', 'assets/images/affine.jpg'));
    cipherList.add(Cipher('diffiehellman', 'دیفی هلمن', 'assets/images/Whitfield_Diffie_Royal_Society.jpg'));
    cipherList.add(Cipher('playfair', 'پلیفیر', 'assets/images/playfair.jpg'));
    cipherList.add(Cipher('rsa', 'rsa', 'assets/images/rsa.jpg'));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'رمزینه',
            style: TextStyle(fontFamily: 'IRANSansMobile'),
          ),
        ),
        body: Container(
          color: Colors.blue,
          child: ListView.builder(
              itemCount: cipherList.length,
              itemBuilder: (BuildContext context, int position) {
                return Padding(
                  padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, '/${cipherList[position].className}'),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)])),
                            height: 100,
                            child: Stack(
                              children: <Widget>[
                                position % 2 == 0
                                    ? Align(
                                  alignment: Alignment.centerRight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Image.asset(
                                        cipherList[position].picUrl),
                                  ),
                                )
                                    : Align(
                                  alignment: Alignment.centerLeft,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    child: Image.asset(
                                        cipherList[position].picUrl),
                                  ),
                                ),
                                Center(
                                  child: Text(cipherList[position].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'IRANSansMobile'
                                    ),),
                                )
                              ],
                            )),
                      )),
                );
              }),
        ));
  }
}