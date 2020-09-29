import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/screens/confirm_order.dart';
import 'package:market_place/utilities/bottomNavigationButton.dart';
import 'package:market_place/utilities/quantityRow.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {
  int count=1;
  double finalPrice;
  List<CartList> cartList = CartList().getCartList();

  List<Widget> categoryProductsContainer() {
    List<Container> newContainer =[];
    for(int i=0;i<cartList.length;i++){
      newContainer.add(Container(
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
                    child: Image.network(cartList[i].productImageName, width: 100),
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
                                child: Text(cartList[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  cartList.removeAt(i);
                                  print(cartList.length);
                                });
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
                          child: Text(cartList[i].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text('Our Price - ',style: kTextSize14,),
                              Text('${cartList[i].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('${cartList[i].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
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
              //QuantityRow(price: cartList[i].ourPrice,),
              Row(
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
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                                color: Colors.indigoAccent
                            ),
                            child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
                          ),
                          onTap:   (){
                            setState(() {
                              if(count>=1){
                                count--;
                                finalPrice = cartList[i].ourPrice * count;
                                print(finalPrice);
                              }
                            });
                          },
                        ),
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.indigoAccent),

                          ),
                          child: Center(child: Text('$count',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                                color: Colors.indigoAccent
                            ),
                            child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
                          ),
                          onTap: (){
                            setState(() {
                              if(count<100){
                                count++;
                                finalPrice = cartList[i].ourPrice * count;
                                print(finalPrice);
                              }
                            });
                          },
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ));
    }
    return newContainer;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
               children: categoryProductsContainer(),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: (){

                      },
                      color: Colors.indigoAccent,
                      child: Text('0 items 0 ₹',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
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
