import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_count.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/screens/confirm_order.dart';
import 'package:market_place/utilities/quantityRow.dart';
import 'package:provider/provider.dart';
class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {
//    int itemsLength;
//  double finalPrice;
//  CartList cartList;

  Future<List<CartList>> fetchProductFromDatabase() async {
    var dbHelper = DatabaseHelperCart();
    Future<List<CartList>> cartList = dbHelper.getNoteList();
    return cartList;
  }


//    List<Widget> categoryProductsContainer() {
//    List<Container> newContainer =[];
//    for(int i=0;i<Provider.of<CartModel>(context).itemCount;i++){
//      final int finalCount=1;
//      newContainer.add(Container(
//        color: Colors.white,
//        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
//        child: Card(
//          elevation: 2,
//          child: Column(
//            children: <Widget>[
//              Row (
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  //Icon(categoryList[i].iconCategory,size: 40,),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                    child: Image.network(Provider.of<CartModel>(context).items[i].productImageName, width: 100),
//                  ),
//                  Expanded(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        SizedBox(height: 8,),
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Text(Provider.of<CartModel>(context).items[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
//                              ),
//                            ),
//                            GestureDetector(
//                              onTap: (){
//                                Provider.of<CartModel>(context).delete(Provider.of<CartModel>(context).items[i]);
//                              },
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Icon(Icons.delete_outline,color: Colors.red,),
//                              ),
//                            )
//                          ],
//                        ),
//
//                        SizedBox(height: 8,),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Text(Provider.of<CartModel>(context).items[i].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
//                        ),
//                        SizedBox(height: 4,),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Row(
//                            children: <Widget>[
//                              Text('Our Price - ',style: kTextSize14,),
//                              Text('${Provider.of<CartModel>(context).items[i].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
//                              Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Text('${Provider.of<CartModel>(context).items[i].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
//                              ),
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 12,),
//
//                      ],
//                    ),
//                  )
//
//                ],
//              ),
//              //QuantityRow(),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Container(
//                    child: Row(
//                      children: <Widget>[
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          onTap:   (){
//                            int count =1;
//
//                              if(count>=1){
//                                count--;
////                                Provider.of<CartModel>(context).addCount(count);
////                                print(Provider.of<CartModel>(context).countItem);
//                                Provider.of<CartModel>(context).items[i].countItems.add(count);
////                                Provider.of<CartModel>(context).addCartCount(CartCount(count));
////                                print(Provider.of<CartModel>(context).itemCartCount);
//
//                                //Provider.of<CartModel>(context).addCount(count);
////                      finalPrice = widget.price * count;
////                      print(finalPrice);
////                      Cart(price: finalPrice,);
//                                //Navigator.pop(context,finalPrice);
//                                //Cart(quantity: count,);
//
//                              }
//
//                          },
//                        ),
//                        Container(
//                          width: 50,
//                          height: 30,
//                          decoration: BoxDecoration(
//                            border: Border.all(width: 1,color: Colors.indigoAccent),
//
//                          ),
//                          child: Center(child: Text('${Provider.of<CartModel>(context).countItem}',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
//                        ),
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          //onTap: onTap;
//
//                          onTap: (){
//
//                              int count =1;
//                              if(count<100){
//                                count++;
////                                Provider.of<CartModel>(context).addCartCount(CartCount(count));
////                                print(Provider.of<CartModel>(context).itemCartCount);
////                                Provider.of<CartModel>(context).addCount(count);
////                                print(Provider.of<CartModel>(context).countItem);
//                                Provider.of<CartModel>(context).items[i].countItems.add(count);
//                                print(Provider.of<CartModel>(context).items[i].countItems);
//
//                              }
//
//                          },
//                        ),
//                        SizedBox(width: 20,)
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//
//              SizedBox(height: 10,),
//            ],
//          ),
//        ),
//      ));
//    }
//    return newContainer;
//  }


  @override
  Widget build(BuildContext context) {
    fetchProductFromDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
//            Expanded(
////              child: ListView(
////                children: categoryProductsContainer(),
////              ),
//            ),
                        Expanded(
              child: FutureBuilder<List<CartList>>(
                future: fetchProductFromDatabase(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                     int count=2;
                    return Container(
                      child: new ListView.builder(

                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,

                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  children: <Widget>[
                                    Row (
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        //Icon(categoryList[i].iconCategory,size: 40,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Image.network(snapshot.data[index].productImageName, width: 100),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 8,),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(snapshot.data[index].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
//                                                          setState(() {
//                                                            snapshot.data[index].removeAt(i);
//                                                            print(cartList.length);
//                                                          });
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Icon(Icons.delete_outline,color: Colors.red,),
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 8,),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Text(snapshot.data[index].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
                                              ),
                                              SizedBox(height: 4,),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text('Our Price - ',style: kTextSize14,),
                                                    Text('${snapshot.data[index].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text('${snapshot.data[index].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 12,),

                                            ],
                                          ),
                                        )

                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        //QuantityRow(price: double.parse(snapshot.data[index].ourPrice),),
                                        //quantityValue(),
                                        QuantityRow(productId: snapshot.data[index].productId),
                                      ],
                                    ),

                                    SizedBox(height: 10,),
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
                    color: Colors.indigoAccent,
                    child: Center(child: Text('${Provider.of<CartModel>(context).itemCount}  items 0 ₹',style: TextStyle(color: Colors.white,fontSize: 14),)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmOrders()));
                      },
                      color: Colors.indigo,
                      child: Text('CheckOut',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      );

  }
}
