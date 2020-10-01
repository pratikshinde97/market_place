import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/screens/customer_name_address.dart';
import 'package:provider/provider.dart';
class ConfirmOrders extends StatefulWidget {
  @override
  _ConfirmOrdersState createState() => _ConfirmOrdersState();
}


class _ConfirmOrdersState extends State<ConfirmOrders> {
  double totalAmount= 20000;

    List<Widget> finalProductList() {
    List<Container> newContainer =[];
    for(int i=0;i<Provider.of<CartModel>(context).itemCount;i++){
      newContainer.add(Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Icon(categoryList[i].iconCategory,size: 40,),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(Provider.of<CartModel>(context).items[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(Provider.of<CartModel>(context).items[i].unitQuantity,style: TextStyle(color: Colors.black,fontSize: 14),),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${Provider.of<CartModel>(context).items[i].ourPrice}',style: kTextSize14,),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${double.parse(Provider.of<CartModel>(context).items[i].ourPrice)*double.parse(Provider.of<CartModel>(context).items[i].ourPrice)}',style: TextStyle(color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),),
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
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        title: Text('Final Order'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Row(
                children: <Widget>[
                  Expanded(flex:2,child: Text('Product Name',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text('Quantity',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text('Rate',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text('Amount',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ),
            Expanded(
              child: ListView(
                children: finalProductList(),
              ),
            ),

          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 130,),
                      Expanded(flex:2,child: Text('Order amount ',style: TextStyle(fontSize: 14,color: Colors.indigo,),)),
                      Expanded(child: Text('0000',textDirection:TextDirection.rtl,style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 130,),
                      Expanded(flex:2,child: Text('Previous Balance ',style: TextStyle(fontSize: 14,color: Colors.indigo,),)),
                      Expanded(child: Text('000',textDirection:TextDirection.rtl,style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 130,),
                      Expanded(flex:2,child: Text('Delivery charges ',style: TextStyle(fontSize: 14,color: Colors.indigo,),)),
                      Expanded(child: Text('0',textDirection:TextDirection.rtl,style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  Divider(color: Colors.indigo,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 130,),
                      Expanded(flex:2,child: Text('Total amount ',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                      Expanded(child: Text('$totalAmount',textDirection:TextDirection.rtl,style: TextStyle(fontSize: 16,color: Colors.indigo,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  child: FlatButton(
                    onPressed: (){
                        Navigator.pop(context);
                    },
                    color: Colors.indigoAccent,
                    child: Text('Edit',style: TextStyle(color: Colors.white,fontSize: 14),),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  child: FlatButton(
                    onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerNameAddress(totalAmount: totalAmount,)));
                    },
                    color: Colors.indigo,
                    child: Text('Proceed to Pay',style: TextStyle(color: Colors.white,fontSize: 14),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
