import 'package:flutter/material.dart';
import 'package:market_place/model/category_products.dart';

import '../constants.dart';
class OrderList extends StatefulWidget {
  final String date;
  final String time;
  OrderList({this.date,this.time});
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {

  List<CategoryProducts> categoryProducts = CategoryProducts().getCategoryProducts();

  List<Widget> finalProductList() {
    List<Container> newContainer =[];
    for(int i=0;i<categoryProducts.length;i++){
      int count = i+1;
      newContainer.add(Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Icon(categoryList[i].iconCategory,size: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('$count',style: TextStyle(color: Colors.black,fontSize: 14),),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(categoryProducts[i].productName,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(child: Text(categoryProducts[i].unitQuantity,style: TextStyle(color: Colors.black,fontSize: 14),)),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(child: Text('${categoryProducts[i].ourPrice}',style: kTextSize14,)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(child: Text('${categoryProducts[i].ourPrice}',style: TextStyle(color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),)),
              ),
            )

          ],
        ),
      ));
    }
    return newContainer;
  }

  @override
  Widget build(BuildContext context) {
    String date = widget.date;
    String time = widget.time;
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        title: Text('Final Order'),
        backgroundColor: Color(0xFF344955),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(date)),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(time),
                    ],
                  )),

                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'No.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'Product Name',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      child: Center(
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      child: Center(
                        child: Text(
                          'Rate',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      child: Text(
                        'Amount',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 8,
          ),
          Expanded(
            child: ListView(
              children: finalProductList(),
            ),
          ),
          Container(
            height: 8,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Order amount ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                      Expanded(
                          child: Text(
                            '0000',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Previous Balance ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                      Expanded(
                          child: Text(
                            '000',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Delivery charges ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )),
                      Expanded(
                          child: Text(
                            '0',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Total amount ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          child: Text(
                            '20000',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
