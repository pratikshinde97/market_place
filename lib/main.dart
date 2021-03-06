import 'package:flutter/material.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:market_place/screens/login_screen.dart';
import 'package:market_place/screens/mobile_login.dart';
import 'package:market_place/screens/splash.dart';
import 'package:market_place/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'model/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Schyler',
        ),
        home: HomePage(),
      ),
    );
  }
}
