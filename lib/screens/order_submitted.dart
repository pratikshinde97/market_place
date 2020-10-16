import 'package:flutter/material.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:provider/provider.dart';

class OrderSubmitted extends StatefulWidget {
  @override
  _OrderSubmittedState createState() => _OrderSubmittedState();
}

class _OrderSubmittedState extends State<OrderSubmitted> {
  back() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/HomePage', (Route<dynamic> route) => false);
  }
  bool connected = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return WillPopScope(
      onWillPop: () {
       return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Market Place'),
          backgroundColor: Color(0xFF344955),
        ),
        body: connected ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF344955),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 8, top: 16),
                      child: Text(
                        'Congratulations',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 16,
                      ),
                      child: Text(
                        'Your Order is Submitted Successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        'Go to Home Page',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.amber[600],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
            : ConnectivityContainer(),
      ),
    );
  }
}
