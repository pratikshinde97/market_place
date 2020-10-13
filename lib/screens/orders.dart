import 'package:flutter/material.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/utilities/bottomNavigationButton.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}
   bool connected;
class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Place'),
        backgroundColor: Color(0xFF344955),
      ),
      body: connected ? SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(),
            ),
          ],
        ),
      )
          : ConnectivityContainer(),
    );
  }
}
