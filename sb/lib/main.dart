import 'package:flutter/material.dart';
import 'log_in.dart';
import 'forpass.dart';
import 'home.dart';
import 'details1.dart';

void main() => runApp(GetPlaced());

class GetPlaced extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/checkstatus',
      routes: {
        '/checkstatus': (BuildContext context) => CheckStatus(),
        '/check': (BuildContext context) => Check(),
        '/forpass': (BuildContext context) => ForPass(),
        '/home': (BuildContext context) => Home(),
        '/details1': (BuildContext context) => Details1(),
      }
    );
  }
}

