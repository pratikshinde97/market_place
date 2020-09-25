import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/screens/customer_name_address.dart';
class ConfirmOrders extends StatefulWidget {
  @override
  _ConfirmOrdersState createState() => _ConfirmOrdersState();
}


class _ConfirmOrdersState extends State<ConfirmOrders> {

  List<CategoryProducts> categoryProducts = [
    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
  ];
  List<Widget> finalProductList() {
    List<Container> newContainer =[];
    for(int i=0;i<categoryProducts.length;i++){
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
                child: Text(categoryProducts[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(categoryProducts[i].unitQuantity,style: TextStyle(color: Colors.black,fontSize: 14),),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(categoryProducts[i].ourPrice,style: kTextSize14,),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(categoryProducts[i].ourPrice,style: TextStyle(color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: finalProductList()
                ),
              ),
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
                      Expanded(child: Text('0000',textDirection:TextDirection.rtl,style: TextStyle(fontSize: 16,color: Colors.indigo,fontWeight: FontWeight.bold),)),
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerNameAddress()));
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
