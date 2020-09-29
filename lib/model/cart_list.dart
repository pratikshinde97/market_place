
import 'package:flutter/material.dart';

class CartList {
  final String categoryName;
  final String productName;
  final String productImageName;
  final String productDescription;
  final double mrp;
  final double ourPrice;
  final String unitQuantity;
  final String productStatus;


  CartList({this.categoryName,this.mrp,this.ourPrice,this.productDescription,this.productImageName,this.productName,this.unitQuantity,this.productStatus});

  List<CartList> getCartList(){
    List<CartList> cartList = [
      CartList(productName: 'Basmati Rice',productDescription: 'best rice in world',mrp: 55, ourPrice: 46,unitQuantity: '1 kg',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
      CartList(productName: 'Tur Dal',productDescription: 'Direct come from fresh farm abgjjkff vhjk',mrp: 95, ourPrice: 86,unitQuantity: '1 kg',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
      CartList(productName: 'tomato',productDescription: 'fresh farm product',mrp:85, ourPrice: 76,unitQuantity: '1 kg',
      productImageName: 'http://pngall.com/eggplant-png',),
      CartList(productName: 'Kanda Lasun Masala',productDescription: 'best of its class',mrp: 55, ourPrice: 46,unitQuantity: '200 gm',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),

    ];
    return cartList;
  }
}

 class CartItems with ChangeNotifier {
   Map<String, CartList> _items = {};

   Map<String, CartList> get items {
     return {..._items};
   }

   int get itemCount {
     return _items.length;
   }

   void addItem(String productName, String productImageName, double mrp,
       double ourPrice, String unitQuantity) {
//    if (_items.containsKey(pdtid)) {
//      _items.update(
//          pdtid,
//              (existingCartItem) => CartItem(
//              id: DateTime.now().toString(),
//              name: existingCartItem.name,
//              quantity: existingCartItem.quantity + 1,
//              price: existingCartItem.price));
//    } else {
//      _items.putIfAbsent(
//          pdtid,
//              () => CartItem(
//            name: name,
//            id: DateTime.now().toString(),
//            quantity: 1,
//            price: price,
//          ));
//    }
//    _items.update(
//
//              (existingCartItem) => CartList(
//                  productName: existingCartItem.productName,
//                  productImageName: existingCartItem.productImageName ,
//                  mrp: existingCartItem.mrp,
//                  ourPrice: existingCartItem.ourPrice,
//                  unitQuantity: existingCartItem.unitQuantity));
//    notifyListeners();
//  }

     void removeItem(String id) {
       _items.remove(id);
       notifyListeners();
     }

//  void removeSingleItem(String id) {
//    if (!_items.containsKey(id)) {
//      return;
//    }
//    if (_items[id].quantity > 1) {
//      _items.update(
//          id,
//              (existingCartItem) => CartItem(
//              id: DateTime.now().toString(),
//              name: existingCartItem.name,
//              quantity: existingCartItem.quantity - 1,
//              price: existingCartItem.price));
//    }
//    notifyListeners();
//  }

//  double get totalAmount {
//    var total = 0.0;
//    _items.forEach((key, cartItem) {
//      total += cartItem.price * cartItem.quantity;
//    });
//    return total;
//  }

     void clear() {
       _items = {};
       notifyListeners();
     }
   }
 }