import 'package:flutter/material.dart';
import 'package:market_place/screens/cart.dart';
class QuantityRow extends StatefulWidget {
  @override
  _QuantityRowState createState() => _QuantityRowState();
}


class _QuantityRowState extends State<QuantityRow> {
  int count=1;
  double finalPrice;
  @override
  Widget build(BuildContext context) {
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
//                      finalPrice = price * count;
                      Cart(quantity: count,);

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
//                       finalPrice = price * count;
//                       Cart(price: finalPrice,);
//                       print(finalPrice);
                       Cart(quantity: count,);
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
