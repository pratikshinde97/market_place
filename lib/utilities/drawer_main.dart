import 'package:flutter/material.dart';
import 'package:market_place/drawer_screens/about_us.dart';
import 'package:market_place/drawer_screens/contact_us.dart';
import 'package:market_place/drawer_screens/privacy_policy.dart';
import 'package:market_place/drawer_screens/terms_conditions.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
class DrawerMain extends StatelessWidget {

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFE8EAF6),
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF344955),
              ),
              accountName: Text('Jay Matadi Supershopy'),
              accountEmail: Text('abc@xyz.com'),

            ),

            new ListTile(
              leading: Icon(Icons.home, color: Colors.amber,),
              title: new Text("Home",style: TextStyle(color: Colors.black)),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
           },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.info_outline, color: Colors.amber,),
              title: new Text("About Us",style: TextStyle(color: Colors.black)),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
           },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.contacts, color: Colors.amber,),
              title: new Text("Contact Us",style: TextStyle(color: Colors.black)),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
           },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.person, color: Colors.amber,),
              title: new Text("Privacy Policy",style: TextStyle(color: Colors.black)),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
           },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.content_paste, color: Colors.amber,),
              title: new Text("Terms & conditions",style: TextStyle(color: Colors.black)),
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsConditions()));
           },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.star, color: Colors.amber,),
              title: new Text("Rate Us",style: TextStyle(color: Colors.black)),
           onTap: () {
             //Navigator.push(context, MaterialPageRoute(builder: (context)=>RateUs()));
             const url = 'https://google.com';
             //const url = "https://play.google.com/store/apps/details?id=" + appPackageName;
             launchURL(url);
             },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.input, color: Colors.amber,),
              title: new Text("LogOut",style: TextStyle(color: Colors.black)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
