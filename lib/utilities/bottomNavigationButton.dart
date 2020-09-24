import 'package:flutter/material.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/screens/category.dart';
import 'package:market_place/screens/home_page.dart';
import 'package:market_place/screens/orders.dart';

enum BottomButtonColor{
  home,category,orders,cart
}

class BottomNavigationButton extends StatefulWidget {

  @override
  _BottomNavigationButtonState createState() => _BottomNavigationButtonState();
}

class _BottomNavigationButtonState extends State<BottomNavigationButton> {
  BottomButtonColor bottomButtonColor;

  @override
  Widget build(BuildContext context) {
     return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 12),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  bottomButtonColor = BottomButtonColor.home;
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.home,color: bottomButtonColor == BottomButtonColor.home ? Colors.amber[800] : Colors.black),
                  SizedBox(width: 10),
                  Text('Home',style:TextStyle(fontSize: 12,
                  color: bottomButtonColor == BottomButtonColor.home ? Colors.amber[800] : Colors.black) ,),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 12),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  bottomButtonColor = BottomButtonColor.category;
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Category()));
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.home,color: bottomButtonColor == BottomButtonColor.category ? Colors.amber[800] : Colors.black),
                  SizedBox(width: 10),
                  Text('Category',style:TextStyle(fontSize: 12,
                      color: bottomButtonColor == BottomButtonColor.category ? Colors.amber[800] : Colors.black) ,),
                ],
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 12),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  bottomButtonColor = BottomButtonColor.orders;
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.business,color: bottomButtonColor == BottomButtonColor.orders ? Colors.amber[800] : Colors.black),
                  SizedBox(width: 10),
                  Text('Orders',style:TextStyle(fontSize: 12,
                      color: bottomButtonColor == BottomButtonColor.orders ? Colors.amber[800] : Colors.black) ,),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 12),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  bottomButtonColor = BottomButtonColor.cart;
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.add_shopping_cart,color: bottomButtonColor == BottomButtonColor.cart ? Colors.amber[800] : Colors.black),
                  SizedBox(width: 10),
                  Text('Cart',style:TextStyle(fontSize: 12,
                      color: bottomButtonColor == BottomButtonColor.cart ? Colors.amber[800] : Colors.black) ,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
