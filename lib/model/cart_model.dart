import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_list.dart';

import 'check_out_list.dart';

class CartModel extends ChangeNotifier {
  int _itemLength = 0;
  int countItem=1;
  final List<CheckOutList> _items = [];
  UnmodifiableListView<CheckOutList> get items => UnmodifiableListView(_items);
  int get itemCount => _items.length;

  void add(CheckOutList item) {
    _items.add(item);
    notifyListeners();
  }

  void delete(CheckOutList item) {
    _items.remove(item);
    notifyListeners();
  }

  Future<int> fetchLengthFromDatabase() async {
    var dbHelper = DatabaseHelperCart();
    int cart = await dbHelper.getCount();
    _itemLength = cart;
    notifyListeners();
    return _itemLength;
  }
  int get cartCount => _itemLength;

//  Future<int> fetchLengthFromDatabase() async{
//    var dbHelper = DatabaseHelperCart();
//    int cart =await dbHelper.getCount();
//    itemLength = cart;
//    return itemLength;
//  }
//  Future<int> fetchLengthFromDatabase() {
//    var dbHelper = DatabaseHelperCart();
//    Future<int> cart = dbHelper.getCount();
////     setState(() {
////       itemsLength = cart;
////     });
//    return cart;
//  }




  Future<List<CartList>> fetchProductFromDatabase() async {
    var dbHelper = DatabaseHelperCart();
    Future<List<CartList>> cartList = dbHelper.getNoteList();
    return cartList;
  }

  void addInDatabase(CartList cart){
    var databaseHelperCart = DatabaseHelperCart();
    databaseHelperCart.insertNote(cart);

  }

  void updateProduct(newPrice, productId) {
    var dbHelper = DatabaseHelperCart();
    dbHelper.updateProduct(newPrice, productId);
  }

  Future<bool> checkConnectivity() async {
    bool connect;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    notifyListeners();
    return connect;
  }

}