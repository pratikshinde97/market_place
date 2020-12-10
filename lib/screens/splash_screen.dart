import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:market_place/screens/intoduction_screen.dart';
import 'package:market_place/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<void> checkLogin() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var email = prefs.getString('email');
  //   print(email);
  //   //runApp(MaterialApp(home: email == null ? Login() : Home()));
  //   Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) =>  email == null ? LoginPage() : HomePage()));
  // }
  // Future checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool _seen = (prefs.getBool('seen') ?? false);
  //
  //   if (_seen) {
  //     // Navigator.of(context).pushReplacement(
  //     //     new MaterialPageRoute(builder: (context) => new HomePage()));
  //     checkLogin();
  //   } else {
  //     prefs.setBool('seen', true);
  //     Navigator.of(context).pushReplacement(new MaterialPageRoute(
  //         builder: (context) => new IntroductionScreen()));
  //   }
  // }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      //checkFirstSeen();
    });
  }

  // @override
  // void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  "Market Application",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF344955),
                  ),
                ),
                SizedBox(height: 20),
                // Padding(
                //     padding: EdgeInsets.only(bottom: 30.0),
                //     child: new Image.asset(
                //       'Images/image2.jpg',
                //       height: 200.0,
                //       fit: BoxFit.scaleDown,
                //     ))
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text("Powered By"),
                new Text(
                  "SP-Technovations",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF344955),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
