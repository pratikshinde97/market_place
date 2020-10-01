import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/screens/confirm_order.dart';
import 'package:market_place/utilities/quantityRow.dart';
import 'package:provider/provider.dart';
class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {


    List<Widget> categoryProductsContainer() {
    List<Container> newContainer =[];
    for(int i=0;i<Provider.of<CartModel>(context).itemCount;i++){
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
                    child: Image.network(Provider.of<CartModel>(context).items[i].productImageName, width: 100),
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
                                child: Text(Provider.of<CartModel>(context).items[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
//                                setState(() {
//                                  cartList.removeAt(i);
//                                  print(cartList.length);
//                                });
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
                          child: Text(Provider.of<CartModel>(context).items[i].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text('Our Price - ',style: kTextSize14,),
                              Text('${Provider.of<CartModel>(context).items[i].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('${Provider.of<CartModel>(context).items[i].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
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
              QuantityRow(),

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
                children: categoryProductsContainer(),
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
