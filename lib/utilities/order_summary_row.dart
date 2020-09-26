import 'package:flutter/material.dart';
class OrderSummaryRow extends StatelessWidget {
  final String stringOne;
  final String stringTwo;
  final double size;
  final Color color;
  OrderSummaryRow(this.stringOne,this.stringTwo,this.size,this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: Text('$stringOne:',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: Text(stringTwo,style: TextStyle(fontSize: size,fontWeight: FontWeight.bold,color: color),),
          ),
        ),
      ],
    );
  }
}