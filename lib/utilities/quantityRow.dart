import 'package:flutter/material.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:provider/provider.dart';
class QuantityRow extends StatefulWidget {
  final String productId;
  QuantityRow({this.productId});
  @override
  _QuantityRowState createState() => _QuantityRowState();
}


class _QuantityRowState extends State<QuantityRow> {

  int count=1;

//  void updateProduct(newPrice, productId) {
//    var dbHelper = DatabaseHelperCart();
//    dbHelper.updateProduct(newPrice, productId);
//  }

  @override
  Widget build(BuildContext context) {

    String productId = widget.productId;
    print('/////////////////////$productId');
    return   Row(
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
                      String newCount = count.toString();
                      Provider.of<CartModel>(context).updateProduct(newCount, productId);

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
                   //onTap: onTap;

                onTap: (){
                   setState(() {
                     if(count<100){
                       count++;
                       String newCount = count.toString();
                       Provider.of<CartModel>(context).updateProduct(newCount, productId);
                     }
                   });
                },
              ),
              SizedBox(width: 20,)
            ],
          ),
        ),
      ],
    );
  }
}
