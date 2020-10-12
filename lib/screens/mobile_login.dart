import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_place/screens/home_page.dart';

class MobileLogin extends StatelessWidget {
  // final _phoneController = TextEditingController();
  String _phoneController;
  final _codeController = TextEditingController();
  List<Color> colors = [ Colors.purple,  Colors.blue];

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;
          print(user);

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                        //    user: user,
                        )));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Entering code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                      //   user: user,
                                      )));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent
          // gradient: LinearGradient(
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //     List:  colors)
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    maxLength: 10,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Mobile Number"),
                    onChanged: (value) {
                      _phoneController = "+91" + value;
                    },
                    //controller: _phoneController,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("LOGIN"),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(16),
                      onPressed: () {
                        final phone = _phoneController;

                        loginUser(phone, context);
                      },
                      color: Colors.indigo,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
