import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:market_place/model/cart_count.dart';
import 'package:market_place/model/cart_list.dart';

class CartModel extends ChangeNotifier {

  int countItem=1;
  final List<CartList> _items = [];
  UnmodifiableListView<CartList> get items => UnmodifiableListView(_items);
  int get itemCount => _items.length;

  void add(CartList item) {
    _items.add(item);
    notifyListeners();
  }
//  void update(CartList item) {
//    _items.up;
//    notifyListeners();
//  }
  void delete(CartList item) {
    _items.remove(item);
    notifyListeners();
  }

  void addCount(int count){
    countItem =count;
  }


  int countCartItem;
  final List<CartCount> _cartItems = [];
  UnmodifiableListView<CartCount> get cartItems => UnmodifiableListView(_cartItems);
  int get itemCartCount => _cartItems.length;

  void addCartCount(CartCount item) {
    _cartItems.add(item);
    notifyListeners();

  }



//  double totalPrice(){
//    for(int i=0;i<itemCount;i++){
//      double totalAmount = double.parse(_items[i].ourPrice)*double.parse(_items[i].ourPrice);
//    }
//    return tot
//  }

}