import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/check_out_list.dart';
import 'package:market_place/model/product_database.dart';
import 'package:market_place/screens/confirm_order.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/quantityRow.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _loading = true;
  int count;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    count = 1;
     //Provider.of<CartModel>(context).getCarts(count,isLoading,_loading);
  getAllCarts(count++).then((value) {
     getAllProducts(count++).then((value) {
        _loadData(count++);
      });
    });
  }

  Future _loadData(int i) async {
    await new Future.delayed(new Duration(seconds: 2));
    print('////////............${cartsToCompare.length}');
    print('////////............${products.length}');
    for(int i=0;i<cartsToCompare.length;i++){
      for(int j=0;j<products.length;j++){
        if(cartsToCompare[i].productId.compareTo(products[j].id)==0){
          getProductsById(products[j].id).then((value) {
            setState(() {
              usersProduct.add(value);
              _searchProducts = usersProduct;
              isLoading = false;
              _loading = false;
              int cartCount = _searchProducts.length;
              print('cartcount= $cartCount');
              Provider.of<CartModel>(context).getCartCount(cartCount);
            });
          });
        }
      }
    }

    print("load more");
  }

  int pageNo = 1;
  var data1;
  int index;
  int qun = 10;
  List<ProductDatabase> products = List<ProductDatabase>();
  ProductDatabase productsById;
  //List<ProductDatabase> productsById = List<ProductDatabase>();
  List<ProductDatabase> _searchProducts = List<ProductDatabase>();
  List<ProductDatabase> usersProduct = [];
  List<CartList> cartsToCompare =List<CartList>();
   bool connected = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    //Provider.of<CartModel>(context).getCarts(count,isLoading,_loading);
   // Provider.of<CartModel>(context).fetchLengthFromDatabase();
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF344955),
      ),
      body: connected ? SafeArea(
        child: Column(
          children: <Widget>[
            _loading
                ? Expanded(
                  child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Color(0xFF344955),
                    valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
              ),
            ),
                ) :
            Expanded(
              // child: FutureBuilder<List<ProductDatabase>>(
              //   future: getAllProducts(i),
              //       //Provider.of<CartModel>(context).fetchProductFromDatabase(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       int count = 2;
              //       return Container(

                      child: new ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _searchProducts.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color:  Color(0xFFE8EAF6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        //Icon(categoryList[i].iconCategory,size: 40,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10,vertical: 10),
                                          child: Image.memory(
                                              _searchProducts[index].file1,
                                              width: 100),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                        _searchProducts[index]
                                                            .productName,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF344955),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
//                                                          setState(() {
//                                                            snapshot.data[index].removeAt(i);
//                                                            print(cartList.length);
//                                                          });
                                                    },
                                                    child: Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.symmetric(
                                              //           horizontal: 10),
                                              //   child: Text(
                                              //     snapshot
                                              //         .data[index].unitQuantity,
                                              //     style: TextStyle(
                                              //         fontSize: 14,
                                              //         color: Colors.grey),
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   height: 4,
                                              // ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Our Price - ',
                                                      style: kTextSize14,
                                                    ),
                                                    Text(
                                                      '${_searchProducts[index].mrp}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 14,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(width:10),
                                                    Text(
                                                      '${_searchProducts[index].salePrice} ₹',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .green[900],
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        QuantityRow(
                                            productId:
                                           _searchProducts[index].id),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    color: Color(0xFF344955),
                    child: Center(
                        child: Text(
                      //'$itemsLength  items 0 ₹',
                          '${Provider.of<CartModel>(context).cartCountFinal} items 0 ₹',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmOrders(allProducts: _searchProducts,)));
                      },
                      color: Colors.amber[600],
                      child: Text(
                        'CheckOut',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
          : ConnectivityContainer(),
    );
  }

   Future<List<ProductDatabase>> getAllProducts(i) async {
     print('/////////////////////////////????????? Get all products in');
     final res = await http.get("http://$ipAddress:8081/api/product/$i/10");
     print("<<<<<<<<<<<<<<<<<<<<<<<<<");
     if (res.statusCode == 200) {
       print('>>>>>>>>>>>>>>>>$res');
       var data = json.decode(res.body);
       print(data);
       setState(() {
         products = data
             .map<ProductDatabase>((json) => ProductDatabase.fromJson(json))
             .toList();
       });
       print('products len in function${products.length}');

       return products;
     } else {
       print('?????????????????????????????????');
       throw Exception('Failed to fetch data');
     }
   }
     Future<List<CartList>> getAllCarts(i) async {
       print('/////////////////////////////?????????');
       final res = await http.get("http://$ipAddress:8081/api/cart/$i/100");
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

  Future<ProductDatabase> getProductsById(String productId) async {
    print("get product productId $productId");

    final res = await http.get("http://$ipAddress:8081/api/product/$productId");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(data);
      setState(() {
        productsById = ProductDatabase.fromJson(data);
      });
      return productsById;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
