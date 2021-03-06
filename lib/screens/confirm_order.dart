import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/product_database.dart';
import 'package:market_place/screens/customer_name_address.dart';
import 'package:market_place/screens/update_customer_name_address.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ConfirmOrders extends StatefulWidget {
  final List<ProductDatabase> allProducts;
  ConfirmOrders({this.allProducts});
  @override
  _ConfirmOrdersState createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
  double totalAmount = 20000;

  // Future<List<CartList>> fetchProductFromDatabase() async {
  //   var dbHelper = DatabaseHelperCart();
  //   Future<List<CartList>> cartList = dbHelper.getNoteList();
  //   print(cartList);
  //   return cartList;
  // }
   bool connected = true;
  @override
  Widget build(BuildContext context) {
    List<ProductDatabase> allProducts = widget.allProducts;
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        title: Text('Final Order'),
        backgroundColor: Color(0xFF344955),
      ),
      body: connected ? Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Product Name',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      child: Text(
                    'Quantity',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    'Rate',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    'Amount',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            // child: FutureBuilder<List<CartList>>(
            //   future:
            //       Provider.of<CartModel>(context).fetchProductFromDatabase(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Container(
                    child: new ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                //Icon(categoryList[i].iconCategory,size: 40,),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      allProducts[index].productName,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    // child: Text(
                                    //   snapshot.data[index].unitQuantity,
                                    //   style: TextStyle(
                                    //       color: Colors.black, fontSize: 14),
                                    // ),
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '${allProducts[index].salePrice}',
                                      style: kTextSize14,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '${allProducts[index].salePrice }',
                                      //* double.parse(snapshot.data[index].quantity)
                                      style: TextStyle(
                                          color: Colors.green[900],
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
            //       );
            //     } else if (snapshot.hasError) {
            //       return new Text("${snapshot.error}");
            //     }
            //     return new Container(
            //       alignment: AlignmentDirectional.center,
            //       child: new CircularProgressIndicator(),
            //     );
            //   },
            // ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Order amount ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                      Expanded(
                          child: Text(
                        '0000',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Previous Balance ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                      Expanded(
                          child: Text(
                        '000',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Delivery charges ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                      Expanded(
                          child: Text(
                        '0',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Total amount ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          child: Text(
                        '$totalAmount',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xFF344955),
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => getUserById() == null ?
                                  CustomerNameAddress(
                                    totalAmount: totalAmount,
                                  ) :
                              UpdateCustomerNameAddress(
                                totalAmount: totalAmount,
                              )
                          ));
                    },
                    color: Colors.amber[600],
                    child: Text(
                      'Proceed to Pay',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
          : ConnectivityContainer(),
    );
  }
  Future getUserById() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String customerId = prefs.getString('email');
    print('////////////////////$customerId');

    final res = await http.get("http://$ipAddress:8081/api/user/$customerId");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      String name = data['firstName'];
      print(name);

      return name;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
