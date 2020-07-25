import 'package:cipherapp/ui/quiz/quiz1.dart';
import 'package:flutter/material.dart';


class Race extends StatefulWidget {
  @override
  _RaceState createState() => _RaceState();
}

class _RaceState extends State<Race> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 150,
            width: 350,
            child: Center(
              child:
              Container(
                child: Center(
                  child: new Text('شروع مسابقه',style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'IRANSansMobile'),),
                ),
                width: 330,
                height: 130,
                decoration: BoxDecoration(
                  color:  Color(0xff4cc417),
                  border: Border.all(width: 2,color: const Color(0xff347c2c),),
                  borderRadius: BorderRadius.circular(20),
                ),
              ) ,
            ),
          ),),
      ),
    );
  }
}