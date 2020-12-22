import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/user_info.dart';
import 'package:market_place/screens/order_submitted.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/order_summary_row.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class PlaceOrder extends StatefulWidget {
  // final String customerName;
  // final String mobileNumber;
  // final String address;
  final double totalAmount;
  PlaceOrder(
      {this.totalAmount});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  List<CartList> cartsToCompare =List<CartList>();
  String customerId;

  @override
  void initState() {
    super.initState();
    getUserById();
    getAllCarts();
  }
  void checkUserData(){
    if(userData==null){
      setState(() {
        _loadData = true;
      });
    }
    else{
      setState(() {
        _loadData = false;
      });
    }
  }
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5), child: Text("Please Wait")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  bool _loadData = true;
  Sign userData;
   bool connected = true;
  @override
  Widget build(BuildContext context) {
    checkUserData();
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        title: Text('Order Summary'),
        backgroundColor: Color(0xFF344955),
      ),
      body: connected ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
              elevation: 2,
              child: _loadData
                  ? Padding(
                padding: const EdgeInsets.only(top: 150.0,bottom: 30),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Color(0xFF344955),
                    valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),
              ) :
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    color: Color(0xFF344955),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        'Order Summary',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  OrderSummaryRow(
                      'Customer Name', '${userData.firstName} ${userData.lastName}', 16, Colors.black),
                  OrderSummaryRow(
                      'Delivery Address', '${userData.addressLine1}, ${userData.addressLine2} ${userData.landmark}'
                      ' ${userData.area} ${userData.city} ${userData.pincode}', 14, Colors.black45),
                  userData.mobileNumber == null ? Container() :
                   OrderSummaryRow(
                       'Mobile Number', userData.mobileNumber, 14, Colors.black87),
                  OrderSummaryRow('Amount', '${widget.totalAmount} ₹', 16,
                      Colors.green[900]),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: RaisedButton(
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Place Your Order',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      onPressed: () {
                        getOrder();
                        //showAlertDialog(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => OrderSubmitted()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
          : ConnectivityContainer(),
    );
  }
  Future<Sign> getUserById() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
     customerId = prefs.getString('email');
    print('////////////////////$customerId');

    final res = await http.get("http://$ipAddress:8081/api/user/$customerId");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(data);
      setState(() {
        userData = Sign.fromJson(data);
      });

      return userData;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
  Future<List<CartList>> getAllCarts() async {
    print('/////////////////////////////?????????');
    final res = await http.get("http://$ipAddress:8081/api/cart/1/100");
    print("<<<<<<<<<<<<<<<<<<<<<<<<<");
    if (res.statusCode == 200) {
      print('>>>>>>>>>>>>>>>>$res');
      var data = json.decode(res.body);
      print(data);
      setState(() {
        cartsToCompare = data
            .map<CartList>((json) => CartList.fromJson(json))
            .toList();
      });
      print('users len in function${cartsToCompare.length}');

      return cartsToCompare;
    } else {
      print('?????????????????????????????????');
      throw Exception('Failed to fetch data');
    }
  }
  Future getOrder() {
    for(int i=0;i<cartsToCompare.length;i++) {
      print('cartsToCompare[i].quantity${cartsToCompare[i].quantity}');
      if(customerId.compareTo(cartsToCompare[i].customerId)==0) {
         createOrder(cartsToCompare[i].customerId, 60,cartsToCompare[i].productId);
      }
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderSubmitted()));

  }
  Future createOrder(String customerId,int quantity, String productId) async {
    print('////////////?????????????????????');
    http.Response response = await http.post(
      'http://$ipAddress:8081/api/temporaryorders/addOrders',

      headers: <String, String>{
        'Content-Type': 'application/json;  charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'customerId': customerId,
        'quantity': quantity,
        'productId': productId
      }),
    );
    print('customerId,,,,,,,,,,,,,,,,,,,,,,,, $customerId');
    //print('quantity,,,,,,,,,,,,,,,,,,,,,,,, $quantity');
    print('productId,,,,,,,,,,,,,,,,,,,,,,,, $productId');
    if (response.statusCode == 201) {

      print('////////////////////////?????????');
      // setState(() {
      //   _loading = !_loading;
      // });

    } else {

      print('////////////::::::::::::::::::::::::');

      throw Exception('Failed to load album');
    }
  }
}
