import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Caesar extends StatefulWidget {
  @override
  _CaesarState createState() => _CaesarState();
}

class _CaesarState extends State<Caesar> {

  static const platform = const MethodChannel('flutter.native/helper');
  String _responseFromNativeCode = 'Waiting for Response...';

  TextEditingController keyController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();


  Future<void> responseFromNativeCode() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('caesar', {"temp" : [keyController.text, messageController.text.replaceAll(' ', '')]});
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      _responseFromNativeCode = response;
      print(response);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              TextField(
                controller: keyController,
              ),
              TextField(
                controller: messageController,
              ),
              RaisedButton(
                onPressed: responseFromNativeCode,
              )
            ],
          )
        ),
      ),
    );
  }
}
