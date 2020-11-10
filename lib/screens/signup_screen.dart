import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/screens/login_screen.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _passwordVisible;
  bool showSpinner = false;
  bool showProgress = false;
  String email = '';
  String password = '';
  String cPassword = '';

  @override
  void initState() {
    _passwordVisible = false;
  }

  Future<Sign> createUser(String email,String password) async {
    print('////////////?????????????????????');
    final http.Response response = await http.post(
      'http://192.168.43.23:8081/api/user/create',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),

    );
    print('////////////');
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('////////////////////////?????????');
      return Sign.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print('////////////::::::::::::::::::::::::');
      throw Exception('Failed to load album');

    }
  }

  bool connected = true;
  @override
  Widget build(BuildContext context) {

    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      key: _scaffoldKey,
      body: connected ? Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue])),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "SignUp",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        )),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  email = value;
                                },
                                controller: controllerEmail,
                                decoration: kDecoration
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: TextFormField(
                                style: TextStyle(color: Colors.white),

                                cursorColor: Colors.white,
                                onChanged: (value) {
                                  password = value;
                                },
                                controller: controllerPassword,
                                obscureText: !_passwordVisible,
                                decoration: kDecorationPassword.copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: TextFormField(
                                style: TextStyle(color: Colors.white),

                                cursorColor: Colors.white,
                                onChanged: (value) {
                                  cPassword = value;
                                },
                                controller: controllerConfirmPassword,
                                obscureText: !_passwordVisible,
                                decoration: kDecorationPassword.copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  hintText: 'Confirm Password',
                                )
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Material(
                              color: Color(0xFF344955),
                              borderRadius: BorderRadius.circular(30.0),
                              child: MaterialButton(
                                onPressed: () async {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  try {
                                    if (email == "") {
                                      final snackBar = SnackBar(content: Text('Please enter Email Id'));
                                      _scaffoldKey.currentState.showSnackBar(snackBar);
                                    } else if (password == "") {
                                      final snackBar = SnackBar(content: Text('Please enter Password'));
                                      _scaffoldKey.currentState.showSnackBar(snackBar);
                                    }
                                    else if (cPassword == "") {
                                      final snackBar = SnackBar(content: Text('Please enter Confirm Password'));
                                      _scaffoldKey.currentState.showSnackBar(snackBar);
                                    }
                                    else if (cPassword.compareTo(password)!= 0) {
                                      final snackBar = SnackBar(content: Text('Password & Confirm Password did not match'));
                                      _scaffoldKey.currentState.showSnackBar(snackBar);
                                    }
                                    else{
                                      setState(() {
                                        showProgress = true;
                                      });
                                      setState(() {
                                        showSpinner = false;
                                        showProgress = false;
                                      });
                                       createUser(controllerEmail.text,controllerPassword.text);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                    }
                                  } catch (e) {
                                    print(e);
                                    setState(() {
                                      showProgress = false;
                                    });
                                  }
                                },
                                minWidth: 10.0,
                                height: 40.0,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
          : ConnectivityContainer(),
    );
  }
}

class Sign {
  final String email;
  final String password;

  Sign({this.email, this.password});

  factory Sign.fromJson(Map<String, dynamic> json) {
    return Sign(
      email: json['email'],
      password: json['password'],
    );
  }
}