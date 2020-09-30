import 'package:flutter/material.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:market_place/screens/mobile_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MobileLogin(),
    );
  }
}
