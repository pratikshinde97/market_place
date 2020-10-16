import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text('Contact Us',style: kAppBarTextSize18,),
        backgroundColor: Color(0xFF344955),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text('My Shop Name',style: kTextSize16,)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('Images/image2.jpg'),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text('Contact no. -',style: kTextSize16,)),
                  Expanded(child: Text('9800000000',style: kTextSize16,)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text('E mail -',style: kTextSize16,)),
                  Expanded(child: Text('abc@xyz.com',style: kTextSize16,)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text('Address -',style: kTextSize16,)),
                  Expanded(flex:2,child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna',style: kTextSize16,)),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
