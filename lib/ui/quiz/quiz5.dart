import 'dart:math' as math;
import 'package:cipherapp/ui/home_page.dart';
import 'package:cipherapp/ui/quiz/quiz2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quiz5 extends StatefulWidget {
  @override
  _Quiz5State createState() => _Quiz5State();
}

class _Quiz5State extends State<Quiz5>
    with TickerProviderStateMixin {

  AnimationController controller;
  TextEditingController textController = new TextEditingController();
  var score, gameNum;
  SharedPreferences sharedPreferences;


  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    getData();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    controller.addListener(() {
      if (controller.isDismissed)
        showResult();
    });
  }


  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    score = sharedPreferences.getInt('score');
    gameNum = sharedPreferences.getInt('gameNum');
    if (score == null)
      score = 0;
    if (gameNum == null)
      gameNum = 0;
  }


  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.blue,
                      height:
                      controller.value * MediaQuery.of(context).size.height,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.topCenter,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                          animation: controller,
                                          backgroundColor: Colors.white,
                                          color: Colors.red,
                                        )),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "زمان باقیمانده",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: int.parse(timerString.substring(2, 4)) < 10
                                                  ? Colors.red
                                                  : Colors.white,
                                              fontFamily: 'IRANSansMobile'),
                                        ),
                                        Text(
                                          timerString,
                                          style: TextStyle(
                                              fontSize: 112.0,
                                              color: int.parse(timerString.substring(2, 4)) < 10
                                                  ? Colors.red
                                                  : Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 350),
                      child: Center(
                        child: ListView(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 400,
                                  child: Text(
                                    'متن آشکار HOTEL IS HERE را با رمزنگاری آفین و با کلید های (4 , 5) بصورت رمز شده درآورید.',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'IRANSansMobile'
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(
                                      color: Colors.white,
                                      width: 350,
                                      height: 50,
                                      child: Center(
                                        child: TextField(
                                          controller: textController,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800
                                          ),
                                          decoration: InputDecoration(
                                              hintText: '?',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20
                                              ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: RaisedButton(
                                    onPressed: () => showResult(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Colors.white,
                                    child: Text(
                                      'تایید',
                                      style: TextStyle(
                                          fontFamily: 'IRANSansMobile'
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              );
            }),
      ),
      onWillPop: () => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage()
      )),
    );
  }


  showResult() async {

    sharedPreferences = await SharedPreferences.getInstance();

    controller.stop();

    if (textController.text == 'NWVYHSQNYLY') {
      showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                  width: 300,
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Lottie.asset('assets/animations/success.json', height: 100),
                      Text('تبریک‌ !!!', textDirection: TextDirection.rtl, style: TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile'),),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('امتیاز شما: 100', textDirection: TextDirection.rtl, style: TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile'),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => HomePage()
                                )),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.red,
                                child: Text(
                                  'پایان',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IRANSansMobile'
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            );
          });
      sharedPreferences.setInt('score', score + 100);
    }
    else
    {
      showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                  width: 300,
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Lottie.asset('assets/animations/fail.json', height: 100),
                      Text('متاسفیم !!!', textDirection: TextDirection.rtl, style: TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile'),),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('امتیاز شما: 0', textDirection: TextDirection.rtl, style: TextStyle(fontSize: 20, fontFamily: 'IRANSansMobile'),),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => HomePage()
                                )),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.red,
                                child: Text(
                                  'پایان',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IRANSansMobile'
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            );
          });
    }
    sharedPreferences.setInt('gameNum', gameNum + 1);
  }
}



class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
