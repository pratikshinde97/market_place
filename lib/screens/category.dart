import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/model/product_database.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/screens/product_description.dart';
import 'package:market_place/screens/search_by_category.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/my_dialog.dart';
import 'package:market_place/utilities/search_products.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {

  final String categoryName;
  final String categoryId;
  Category({this.categoryName,this.categoryId});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String categoryNameFinal;
  String categoryId;
  bool _loading = true;
  int count;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    count = 1;
    _loadData(count++);
    categoryNameFinal = widget.categoryName;
    categoryId = widget.categoryId;
    print(categoryId);
  }

  Future _loadData(int i) async {
    await new Future.delayed(new Duration(seconds: 2));
    if(categoryNameFinal.compareTo('All Categories') != 0){
      getProducts(categoryId).then((value) {
        setState(() {
          usersProduct.addAll(value);
          _searchProducts = usersProduct;
          isLoading = false;
          _loading = false;
        });
      });
    }
    else{
      getAllProducts(i).then((value) {
        setState(() {
          usersProduct.addAll(value);
          _searchProducts = usersProduct;
          isLoading = false;
          _loading = false;
        });
      });
    }

    print("load more");
  }

  int pageNo = 1;
  var data1;
  int index;
  int qun = 10;
  List<ProductDatabase> products = List<ProductDatabase>();
  List<ProductDatabase> _searchProducts = List<ProductDatabase>();
  List<ProductDatabase> usersProduct = [];
  List<ProductDatabase> dataList = new List();
  http.Response response;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //CategoryProducts cat = CategoryProducts();

  List<Widget> categoryProductsContainer() {
    List<Container> newContainer = [];
    //List categoryProducts = cat.getCategoryProducts();
    for (int i = 0; i < _searchProducts.length; i++) {

      // String catName = products[i].categoryName;
      // newContainer.add(categoryNameFinal.compareTo(catName) != 0
      //     ? Container()
        //  :
      newContainer.add(
    Container(
              color:  Color(0xFFE8EAF6),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Card(
                elevation: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //Icon(categoryList[i].iconCategory,size: 40,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.memory(
                              _searchProducts[i].file1,
                              width: 100),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  _searchProducts[i].productName,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF344955),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  products[i].productDescription,
                                  style: TextStyle(
                                      color: Color(0xFF344955), fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 10),
                              //   child: Text(
                              //     'For - ${products[i].unitQuantity}',
                              //     style: kTextSize14,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 4,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Our Price - ',
                                      style: kTextSize14,
                                    ),
                                    Text(
                                      '${_searchProducts[i].mrp}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width:10),
                                    Text(
                                      '${_searchProducts[i].salePrice} ₹',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ProductDescription(productName: _searchProducts[i].productName,)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Product Details',style: TextStyle(fontSize: 14,color: Colors.indigoAccent)),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // products[i]
                        //             .productStatus
                        //             .compareTo('Available') ==
                        //         0
                        //     ?
                        RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onPressed: () {

                                  String productId = products[i].id;
                                  createCart(productId);
                                  // String productName =
                                  //     categoryProducts[i].productName;
                                  // String productQuantity =
                                  //     categoryProducts[i].unitQuantity;
                                  // String ourPrice =
                                  //     categoryProducts[i].ourPrice;
                                  // String mrp = categoryProducts[i].mrp;
                                  // String productImage =
                                  //     categoryProducts[i].productImageName;
                                  // String quantity = '1';

                                  // //  var databaseHelperCart = DatabaseHelperCart();
                                  // //CartList cartList = CartList();
                                  // // databaseHelperCart.insertNote(CartList(productName:productName,productImageName: productImage,unitQuantity:productQuantity,ourPrice: ourPrice,mrp: mrp,quantity: quantity));
                                  //
                                  // Provider.of<CartModel>(context).addInDatabase(
                                  //     CartList(
                                  //         quantity: quantity,
                                  //         productId: productId,
                                  //         productName: productName,
                                  //         productImageName: productImage,
                                  //         ourPrice: ourPrice,
                                  //         mrp: mrp,
                                  //         unitQuantity: productQuantity));

                                  //Provider.of<CartModel>(context).add(CartList(productName: productName,productImageName: productImage,ourPrice: ourPrice,mrp: mrp,unitQuantity:productQuantity));

                                  // final snackBar = SnackBar(content: Text('added to Cart'),duration: Duration(seconds: 2),);
                                  // _scaffoldKey.currentState.showSnackBar(snackBar);

                                },
                                color: Colors.amber[600],
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                            // : Padding(
                            //     padding: const EdgeInsets.only(
                            //         bottom: 10.0, top: 10),
                            //     child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: <Widget>[
                            //           Icon(
                            //             Icons.close,
                            //             color: Colors.red,
                            //             size: 12,
                            //           ),
                            //           Text(categoryProducts[i].productStatus,
                            //               style: TextStyle(
                            //                   color: Colors.red, fontSize: 12)),
                            //         ]),
                            //   ),
                        ,
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
    }
    return newContainer;
  }


   bool connected = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:  Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text(categoryNameFinal,style: kAppBarTextSize18),
        backgroundColor: Color(0xFF344955),
        actions: <Widget>[
          Stack(
            children: [
              InkWell(
                child: Center(child: Icon(Icons.add_shopping_cart_outlined,size: 34,color: Colors.white,)),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
              ),
              Positioned(
                top: 9.0,
                left: 10,

                child: CircleAvatar(
                  backgroundColor: Colors.amber[800],
                  radius: 8,
                  child: Text('${Provider.of<CartModel>(context).cartCount}',style: TextStyle(fontSize: 8, color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),

          SizedBox(
            width: 10,
          )
        ],
      ),
      body: connected ? SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(12, 10, 12, 2),
                  //   child: Container(
                  //     height: 50,
                  //     child: Card(
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(12.0),
                  //         child: Center(
                  //             child: Text(
                  //           categoryNameFinal,
                  //           style: kTextSize16,
                  //         )),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Container(
                    color: Color(0xFF344955),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 6),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => SearchByCategory()));
                              },
                              child: Container(
                                height: 40,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Search Category',
                                            style: TextStyle(color: Colors.grey,fontSize: 12),
                                          ),
                                        ),
                                        Icon(Icons.search,color:Colors.grey),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                showSearch(
                                  context: context,
                                  delegate: CustomSearchHintDelegateProducts(),
                                );
                              },
                              child: Container(
                                height: 40,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Search Product',
                                            style: TextStyle(color: Colors.grey,fontSize: 12),
                                          ),
                                        ),
                                        Icon(Icons.search,color:Colors.grey),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _loading
                      ? Padding(
                        padding: const EdgeInsets.only(top: 250.0),
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
                    children: categoryProductsContainer(),
                  )
                  // Column(
                  //   children: categoryNameFinal.compareTo('All Categories') == 0
                  //       ? categoryAllProductsContainer()
                  //       : categoryProductsContainer(),
                  // )
                ],
              ),
            ),
            Container(
              height: isLoading ? 50.0 : 0,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(0xFF344955),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      },
                      color: Colors.amber[600],
                      child: Text(
                        'Go to Cart',
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

  Future<List<ProductDatabase>> getProducts(String categoryId) async {
    print("categoryId $categoryId");
    final res = await http.get(
        "http://$ipAddress:8081/api/product/productByCategoryId/$categoryId");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      setState(() {
        products = data
            .map<ProductDatabase>((json) => ProductDatabase.fromJson(json))
            .toList();
      });
      print(products);
      return products;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // Future<List<ProductDatabase>> getAllProducts(i) async {
  //   final res = await http.get(
  //       "http://$ipAddress:8081/api/product/1/20");
  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);
  //     setState(() {
  //       products = data
  //           .map<ProductDatabase>((json) => ProductDatabase.fromJson(json))
  //           .toList();
  //     });
  //     return products;
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }
  Future<List<ProductDatabase>> getAllProducts(i) async {
    print('/////////////////////////////?????????');
    final res = await http.get("http://$ipAddress:8081/api/product/1/10");
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
      print('users len in function${products.length}');

      return products;
    } else {
      print('?????????????????????????????????');
      throw Exception('Failed to fetch data');
    }
  }
  Future<CartList> createCart(String productId) async {
    print('////////////?????????????????????');
    response = await http.post(
      'http://$ipAddress:8081/api/cart/create',

      headers: <String, String>{
        'Content-Type': 'application/json;  charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'productId': productId,

      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('////////////////////////?????????');
      // setState(() {
      //   _loading = !_loading;
      // });
      MyDialog().showMyDialog(this.context, 'Cart',
          'Added to Cart successfully');
      return CartList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // setState(() {
      //   _loading = !_loading;
      // });
      print('////////////::::::::::::::::::::::::');
      MyDialog().showMyDialog(this.context, 'Cart',
          'There is some error in adding this Product in Cart . Please try again.');
      throw Exception('Failed to load album');
    }
  }
}
