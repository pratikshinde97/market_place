import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/check_out_list.dart';
import 'package:market_place/screens/confirm_order.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/quantityRow.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int itemsLength;

  Future<int> fetchLengthFromDatabase() async {
    var dbHelper = DatabaseHelperCart();
    int cart = await dbHelper.getCount();
    setState(() {
      itemsLength = cart;
    });
    return cart;
  }

  @override
  void initState() {
    super.initState();
    fetchLengthFromDatabase();
  }

  // Future<List<CartList>> fetchProductFromDatabase() async {
  //   var dbHelper = DatabaseHelperCart();
  //   List<CartList> cartList = await dbHelper.getNoteList();
  //   for (int i = 1; i < cartList.length; i++) {
  //     String pName = cartList[i].productName;
  //     double rate = double.parse(cartList[i].mrp);
  //     double quantity = double.parse(cartList[i].quantity);
  //     double amount =
  //         double.parse(cartList[i].quantity) * double.parse(cartList[i].mrp);
  //
  //     Provider.of<CartModel>(context).add(CheckOutList(
  //         productName: pName, rate: rate, quantity: quantity, amount: amount));
  //     print(Provider.of<CartModel>(context).itemCount);
  //     print(cartList);
  //   }
  //   return cartList;
  // }
   bool connected;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF344955),
      ),
      body: connected ? SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<CartList>>(
                future:
                    Provider.of<CartModel>(context).fetchProductFromDatabase(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int count = 2;
                    return Container(
                      child: new ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
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
                                              horizontal: 10),
                                          child: Image.network(
                                              snapshot
                                                  .data[index].productImageName,
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
                                                        snapshot.data[index]
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
                                                  GestureDetector(
                                                    onTap: () {
//                                                          setState(() {
//                                                            snapshot.data[index].removeAt(i);
//                                                            print(cartList.length);
//                                                          });
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Icon(
                                                        Icons.delete_outline,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  snapshot
                                                      .data[index].unitQuantity,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
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
                                                      '${snapshot.data[index].mrp}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 14,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                        '${snapshot.data[index].ourPrice} ₹',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .green[900],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
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
                                                snapshot.data[index].productId),
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
                    );
                  } else if (snapshot.hasError) {
                    return new Text("${snapshot.error}");
                  }
                  return new Container(
                    alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    color: Color(0xFF344955),
                    child: Center(
                        child: Text(
                      '$itemsLength  items 0 ₹',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    //child: Center(child: Text('${Provider.of<CartModel>(context).itemLength}  items 0 ₹',style: TextStyle(color: Colors.white,fontSize: 14),)),
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
                                builder: (context) => ConfirmOrders()));
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
}
