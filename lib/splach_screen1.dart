import 'package:flutter/material.dart';
import 'package:parking_car/inscription.dart';
import 'dart:async';

class SplashScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<SplashScreen1>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration = Duration(seconds: 5);
    return Timer(duration, router);
  }
  router(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Inscription()));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/logo2.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "Parking Car",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}