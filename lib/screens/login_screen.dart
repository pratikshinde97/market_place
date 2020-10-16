import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:market_place/screens/signup_screen.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _passwordVisible;
  bool showSpinner = false;
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email = '';
  String password = '';

  @override
  void initState() {
    _passwordVisible = false;
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
                            "Login",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        )),
                    Container(
                      //     color: Colors.blueGrey,
                      // decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //         begin: Alignment.centerLeft,
                      //         end: Alignment.centerRight,
                      //         colors: [Colors.pink, Colors.indigoAccent])),
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
                              //     textAlign: TextAlign.center,
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
                                       final snackBar = SnackBar(content: Text('Please enter Email Id to login.'));
                                       _scaffoldKey.currentState.showSnackBar(snackBar);
                                    } else if (password == "") {
                                      final snackBar = SnackBar(content: Text('Please enter Password to login.'));
                                      _scaffoldKey.currentState.showSnackBar(snackBar);
                                    }
                                    setState(() {
                                      showProgress = true;
                                    });
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                     // final snackBar = SnackBar(content: Text('Wrong Email Id or Password'));
                                     // _scaffoldKey.currentState.showSnackBar(snackBar);

                                    setState(() {
                                      showSpinner = false;
                                      showProgress = false;
                                    });
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
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                  },
                                  child: Center(
                                    child: Text(
                                      'New User ? Sign Up',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
