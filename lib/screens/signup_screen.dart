// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SignUp extends StatefulWidget {
//   static String id = 'SignUp';
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   bool showSpinner = false;
//   final _auth = FirebaseAuth.instance;
//   String email = '';
//   String password = '';
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 48.0,
//               ),
//               Container(
//                 height: 20.0,
//                 child: Image.asset('images/hspmlogo.png'),
//                 padding: EdgeInsets.symmetric(vertical: 30.0),
//               ),
//               SizedBox(
//                 height: 48.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 // ignore: missing_return
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Enter Your email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     borderSide:
//                         BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 48.0,
//               ),
//               TextField(
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   password = value;
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Your Password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     borderSide:
//                         BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 48.0,
//               ),
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   child: Material(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(30.0),
//                       child: MaterialButton(
//                         minWidth: 10.0,
//                         height: 40.0,
//                         onPressed: () async {
//                           setState(() {
//                             showSpinner = true;
//                           });
//                           try {
//                             final newUser =
//                                 await _auth.createUserWithEmailAndPassword(
//                                     email: email, password: password);
//                             if (newUser != null) {
//                               // Navigator.pushNamed(
//                               //     context, MainDisplayScreen.id);
//                             }
//                             setState(() {
//                               showSpinner = false;
//                             });
//                           } catch (e) {
//                             print(e);
//                           }
//                         },
//                         child: Text(
//                           'REGISTER',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                       )))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
