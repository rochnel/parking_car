import 'package:flutter/material.dart';
import 'package:parking_car/splach_screen1.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: SplashScreen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}