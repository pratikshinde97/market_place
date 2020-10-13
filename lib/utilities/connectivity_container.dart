import 'package:flutter/material.dart';
class ConnectivityContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF344955),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Oops ......',style: TextStyle(fontSize: 40,color: Colors.white),),
          Divider(indent: 60,endIndent: 60),
          Text('No Internet Connection',style: TextStyle(fontSize: 18,color: Colors.white),),
          Divider(indent: 60,endIndent: 60),
          SizedBox(height: 70,)
        ],
      ),
    );
  }
}
