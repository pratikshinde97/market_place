import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/product_database.dart';
import '../constants.dart';
import 'check_out_list.dart';
import 'package:http/http.dart' as http;

class CartModel extends ChangeNotifier {
  int _itemLength = 0;
  int countItem=1;
  int _cartCount;
   void getCartCount(int count) async{
     _cartCount = count;
     print('count = $_cartCount');
     notifyListeners();
 }
 int get cartCountFinal => _cartCount;

  // final List<CheckOutList> _items = [];
  // UnmodifiableListView<CheckOutList> get items => UnmodifiableListView(_items);
  // int get itemCount => _items.length;
  //
  // void add(CheckOutList item) {
  //   _items.add(item);
  //   notifyListeners();
  // }
  //
  // void delete(CheckOutList item) {
  //   _items.remove(item);
  //   notifyListeners();
  // }
  int get cartCount => _itemLength;

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

class GetCarts {

  // List<ProductDatabase> products = List<ProductDatabase>();
  // ProductDatabase productsById;
  // //List<ProductDatabase> productsById = List<ProductDatabase>();
  // List<ProductDatabase> searchProducts = List<ProductDatabase>();
  // List<ProductDatabase> usersProduct = [];
  // List<CartList> cartsToCompare =List<CartList>();

  int _cartCount;
  void getCartCount(int count) async{
    _cartCount = count;
    //notifyListeners();
    print('count = $_cartCount');
  }
  // void getCarts(int count,bool isLoading, bool _loading){
  //   getAllCarts(count++).then((value) {
  //     getAllProducts(count++).then((value) {
  //       loadData(count++,isLoading,_loading);
  //     });
  //   });
  //   notifyListeners();
  // }


  // Future loadData(int i, bool isLoading, bool _loading) async {
  //   await new Future.delayed(new Duration(seconds: 2));
  //   print('////////............${cartsToCompare.length}');
  //   print('////////............${products.length}');
  //   for(int i=0;i<cartsToCompare.length;i++){
  //     for(int j=0;j<products.length;j++){
  //       if(cartsToCompare[i].productId.compareTo(products[j].id)==0){
  //         getProductsById(products[j].id).then((value) {
  //
  //           usersProduct.add(value);
  //           searchProducts = usersProduct;
  //           isLoading = false;
  //           _loading = false;
  //           int cartCount = searchProducts.length;
  //           print('cartcount= $cartCount');
  //           getCartCount(cartCount);
  //
  //         });
  //       }
  //     }
  //   }
  //   //notifyListeners();
  //   print("load more");
  // }

  Future<List<ProductDatabase>> getAllProducts(i,List<ProductDatabase> products) async {
    print('/////////////////////////////????????? Get all products in');
    final res = await http.get("http://$ipAddress:8081/api/product/$i/10");
    print("<<<<<<<<<<<<<<<<<<<<<<<<<");
    if (res.statusCode == 200) {
      print('>>>>>>>>>>>>>>>>$res');
      var data = json.decode(res.body);
      print(data);

      products = data
          .map<ProductDatabase>((json) => ProductDatabase.fromJson(json))
          .toList();

      print('products len in function${products.length}');
      //notifyListeners();
      return products;
    } else {
      print('?????????????????????????????????');
      throw Exception('Failed to fetch data');
    }
  }
  Future<List<CartList>> getAllCarts(i,List<CartList> cartsToCompare) async {
    print('/////////////////////////////?????????');
    final res = await http.get("http://$ipAddress:8081/api/cart/$i/100");
    print("<<<<<<<<<<<<<<<<<<<<<<<<<");
    if (res.statusCode == 200) {
      print('>>>>>>>>>>>>>>>>$res');
      var data = json.decode(res.body);
      print(data);

      cartsToCompare = data
          .map<CartList>((json) => CartList.fromJson(json))
          .toList();

      print('users len in function${cartsToCompare.length}');
      //notifyListeners();
      return cartsToCompare;
    } else {
      print('?????????????????????????????????');
      throw Exception('Failed to fetch data');
    }
  }

  Future<ProductDatabase> getProductsById(String productId,ProductDatabase productsById) async {
    print("get product productId $productId");

    final res = await http.get("http://$ipAddress:8081/api/product/$productId");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(data);

      productsById = ProductDatabase.fromJson(data);

      //notifyListeners();
      return productsById;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}