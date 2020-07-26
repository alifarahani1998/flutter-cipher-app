import 'package:cipherapp/ui/quiz/quiz1.dart';
import 'package:flutter/material.dart';


class Race extends StatefulWidget {
  @override
  _RaceState createState() => _RaceState();
}

class _RaceState extends State<Race> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: InkWell(onTap:(){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Quiz1()
                )
            );
          },
            child: Container(
              decoration: BoxDecoration(
                color:  Color(0xff98ff98),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: 350,
              child: Center(
                child:
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('شروع مسابقه',style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'IRANSansMobile'),),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            '(تمام حروف را بصورت حروف بزرگ بنویسید)',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 15, fontFamily: 'IRANSansMobile')
                          ),
                        )
                      ],
                    )
                  ),
                  width: 330,
                  height: 170,
                  decoration: BoxDecoration(
                    color:  Color(0xff4cc417),
                    border: Border.all(width: 2,color: const Color(0xff347c2c),),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ) ,
              ),
            ),),
        ),
      ),
    );
  }
}