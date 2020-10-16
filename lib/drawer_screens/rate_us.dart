// import 'package:flutter/material.dart';
// import 'package:market_place/constants.dart';
// class RateUs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE8EAF6),
//       appBar: AppBar(
//         title: Text('Rate Us',style: kAppBarTextSize18,),
//         backgroundColor: Color(0xFF344955),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Center(child: Text('My Shop Name',style: kTextSize16,)),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage('Images/image2.jpg'),
//               ),
//             ),
//             SizedBox(height: 100,),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: RaisedButton(
//                 onPressed: (){
//
//                 },
//                 color: Colors.amber,
//                 child: Text('Rate Now'),
//               ),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:rate_my_app/rate_my_app.dart';
//
//
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   RateMyApp _rateMyApp = RateMyApp(
//     preferencesPrefix: 'rateMyApp_',
//     minDays: 3,
//     minLaunches: 7,
//     remindDays: 2,
//     remindLaunches: 5,
//     // appStoreIdentifier: '',
//     // googlePlayIdentifier: '',
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _rateMyApp.init().then((_) {
//       // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
//       // if (_rateMyApp.shouldOpenDialog) {
//       _rateMyApp.showStarRateDialog(
//         context,
//         title: 'Enjoying Flutter Rating Prompt?',
//         message: 'Please leave a rating!',
//         onRatingChanged: (stars) {
//           return [
//             FlatButton(
//               child: Text('Ok'),
//               onPressed: () {
//                 if (stars != null) {
//                   _rateMyApp.doNotOpenAgain = true;
//                   _rateMyApp.save().then((v) => Navigator.pop(context));
//
//                   if (stars <= 3) {
//                     print('Navigate to Contact Us Screen');
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (_) => ContactUsScreen(),
//                     //   ),
//                     // );
//                   } else if (stars <= 5) {
//                     print('Leave a Review Dialog');
//                     // showDialog(...);
//                   }
//                 } else {
//                   Navigator.pop(context);
//                 }
//               },
//             ),
//           ];
//         },
//         dialogStyle: DialogStyle(
//           titleAlign: TextAlign.center,
//           messageAlign: TextAlign.center,
//           messagePadding: EdgeInsets.only(bottom: 20.0),
//         ),
//         starRatingOptions: StarRatingOptions(),
//       );
//       // }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//     );
//   }
// }