import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class QuantityRow extends StatefulWidget {
  final String productId;
  QuantityRow({this.productId});
  @override
  _QuantityRowState createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {
  int count = 1;

//  void updateProduct(newPrice, productId) {
//    var dbHelper = DatabaseHelperCart();
//    dbHelper.updateProduct(newPrice, productId);
//  }

  @override
  Widget build(BuildContext context) {
    String productId = widget.productId;
   // print('/////////////////////$productId');
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Color(0xFF344955)),
                  child: Center(
                      child: Text(
                    '-',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )),
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                      int newCount = count;
                      updateCart(productId, newCount);
                    }
                  });
                },
              ),
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF344955)),
                ),
                child: Center(
                    child: Text(
                  '$count',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF344955),
                      fontWeight: FontWeight.bold),
                )),
              ),
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Color(0xFF344955)),
                  child: Center(
                      child: Text(
                    '+',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )),
                ),
                //onTap: onTap;

                onTap: () {
                  setState(() {
                    if (count < 100) {
                      count++;
                      int newCount = count;
                      updateCart(productId, newCount);
                    }
                  });
                },
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
  Future<CartList> updateCart(String id,int quantity) async {
    print('////////////////////$quantity');
    print('////////////////////$id');

    final http.Response response = await http.put(
      'http://$ipAddress:8081/api/cart/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'quantity': quantity,
      }),
    );
    if (response.statusCode == 200) {
       print('---------------Updated');
      // setState(() {
      //   _loading = !_loading;
      // });

      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      return CartList.fromJson(jsonDecode(response.body));
    } else {
      print('---------------Not Updated');
      // setState(() async{
      //   _loading = !_loading;
      // });

      throw Exception('Failed to load album');
    }
  }
}
