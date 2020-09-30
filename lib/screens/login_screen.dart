//import 'dart:convert';
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//class LoginPage extends StatefulWidget {
//  @override
//  LoginPageState createState() => LoginPageState();
//}
//
//class LoginPageState extends State<LoginPage> {
//  var result;
//  var data;
//  var show;
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  TextEditingController controllerEmail = TextEditingController();
//  TextEditingController controllerPassword = TextEditingController();
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//  bool _passwordVisible;
//  bool showSpinner = false;
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  bool showProgress = false;
//  String email = '';
//  String password = '';
//
//  @override
//  void initState() {
//    _passwordVisible = false;
//  }
//
//  _showMyDialog() {
//    return showDialog<void>(
//      context: context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          shape:
//              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//          content: StatefulBuilder(
//            builder: (BuildContext context, StateSetter setState) {
//              return Container(
//                height: 100,
//                child: Center(
//                  child: Text("$result"),
//                ),
//              );
//            },
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('ok'),
//              onPressed: () {
//                if (result == "Authentication Failed") {
//                  Navigator.of(context).pop();
//                } else {}
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: _scaffoldKey,
//      body: Container(
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//                begin: Alignment.centerLeft,
//                end: Alignment.centerRight,
//                colors: [Colors.purple, Colors.blue])),
//        child: Center(
//          child: SingleChildScrollView(
//            child: Padding(
//              padding: EdgeInsets.symmetric(horizontal: 14.0),
//              child: Form(
//                key: _formKey,
//                child: Column(
//                  children: [
//                    Container(
//                        height: 50.0,
//                        child: Center(
//                          child: Text(
//                            "Login",
//                            style: TextStyle(fontSize: 30, color: Colors.white),
//                          ),
//                        )),
//                    Card(
//                      child: Container(
//                        color: Colors.blueGrey,
//                        // decoration: BoxDecoration(
//                        //     gradient: LinearGradient(
//                        //         begin: Alignment.centerLeft,
//                        //         end: Alignment.centerRight,
//                        //         colors: [Colors.pink, Colors.indigoAccent])),
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
//                          children: <Widget>[
//                            SizedBox(
//                              height: 25.0,
//                            ),
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                              child: TextFormField(
//                                keyboardType: TextInputType.emailAddress,
//                                onChanged: (value) {
//                                  email = value;
//                                },
//                                //   textAlign: TextAlign.center,
//                                decoration: InputDecoration(
//                                  prefixIcon: Icon(Icons.email,
//                                      color: Colors.lightBlueAccent),
//                                  hintText: 'Enter Your Email Id',
//                                  border: OutlineInputBorder(
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(32.0)),
//                                    borderSide: BorderSide(
//                                        color: Colors.lightBlueAccent,
//                                        width: 1.0),
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(32.0)),
//                                    borderSide: BorderSide(
//                                        color: Colors.lightBlueAccent,
//                                        width: 2),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 30.0,
//                            ),
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                              child: TextFormField(
//                                onChanged: (value) {
//                                  password = value;
//                                },
//                                controller: controllerPassword,
//                                obscureText: !_passwordVisible,
//                                //     textAlign: TextAlign.center,
//                                decoration: InputDecoration(
//                                  prefixIcon: Icon(Icons.vpn_key,
//                                      color: Colors.lightBlueAccent),
//                                  hintText: 'Enter Your Password',
//                                  border: OutlineInputBorder(
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(32.0)),
//                                    borderSide: BorderSide(
//                                        color: Colors.lightBlueAccent,
//                                        width: 1.0),
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(32.0)),
//                                    borderSide: BorderSide(
//                                        color: Colors.lightBlueAccent,
//                                        width: 2),
//                                  ),
//                                  suffixIcon: IconButton(
//                                    icon: Icon(
//                                      _passwordVisible
//                                          ? Icons.visibility
//                                          : Icons.visibility_off,
//                                      color: Colors.lightBlueAccent,
//                                    ),
//                                    onPressed: () {
//                                      setState(() {
//                                        _passwordVisible = !_passwordVisible;
//                                      });
//                                    },
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 24.0,
//                            ),
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                              child: Material(
//                                color: Colors.blue,
//                                borderRadius: BorderRadius.circular(30.0),
//                                child: MaterialButton(
//                                  onPressed: () async {
//                                    setState(() {
//                                      showSpinner = true;
//                                    });
//                                    try {
//                                      if (email == null && password == null) {
//                                        SnackBar snackBar = SnackBar(
//                                            content: Text(
//                                                'Please enter Email Id  & Password to login.'),
//                                            duration: Duration(seconds: 4));
//                                        _scaffoldKey.currentState
//                                            .removeCurrentSnackBar();
//                                        _scaffoldKey.currentState
//                                            .showSnackBar(snackBar);
//                                      } else if (email == "") {
//                                        SnackBar snackBar = SnackBar(
//                                            content: Text(
//                                                'Please enter Email Id to login.'),
//                                            duration: Duration(seconds: 4));
//                                        _scaffoldKey.currentState
//                                            .removeCurrentSnackBar();
//                                        _scaffoldKey.currentState
//                                            .showSnackBar(snackBar);
//                                      } else if (password == "") {
//                                        SnackBar snackBar = SnackBar(
//                                            content: Text(
//                                                'Please enter Password to login.'),
//                                            duration: Duration(seconds: 4));
//                                        _scaffoldKey.currentState
//                                            .removeCurrentSnackBar();
//                                        _scaffoldKey.currentState
//                                            .showSnackBar(snackBar);
//                                      }
//                                      setState(() {
//                                        showProgress = true;
//                                      });
//                                      final newUser = await _auth
//                                          .signInWithEmailAndPassword(
//                                              email: email, password: password);
//                                      if (newUser != null) {
//                                        // Navigator.pushNamed(
//                                        //     context, MainDisplayScreen.id);
//                                      }
//                                      setState(() {
//                                        showSpinner = false;
//                                      });
//                                      setState(() {
//                                        showProgress = false;
//                                      });
//                                    } catch (e) {
//                                      print(e);
//                                      setState(() {
//                                        showProgress = false;
//                                      });
//                                    }
//                                  },
//                                  minWidth: 10.0,
//                                  height: 40.0,
//                                  child: Text(
//                                    'Login',
//                                    style: TextStyle(
//                                        fontSize: 15.0, color: Colors.white),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: EdgeInsets.symmetric(vertical: 5.0),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.end,
//                                children: [
//                                  InkWell(
//                                    onTap: () {},
//                                    child: Center(
//                                      child: Text(
//                                        'Forgot Password?',
//                                        style: TextStyle(
//                                            fontSize: 15.0,
//                                            fontWeight: FontWeight.w600,
//                                            color: Colors.blue),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
