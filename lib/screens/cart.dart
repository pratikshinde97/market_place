import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/screens/confirm_order.dart';
import 'package:market_place/utilities/bottomNavigationButton.dart';
import 'package:market_place/utilities/quantityRow.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}





class _CartState extends State<Cart> {

  List<CategoryProducts> categoryProducts = [
    CategoryProducts(productName: 'Basmati Rice',productDescription: 'best rice in world',mrp: '55', ourPrice: '46',unitQuantity: '1 kg',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
    CategoryProducts(productName: 'Tur Dal',productDescription: 'Direct come from fresh farm abgjjkff vhjk',mrp: '95', ourPrice: '86',unitQuantity: '1 kg',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
    CategoryProducts(productName: 'tomato',productDescription: 'fresh farm product',mrp: '85', ourPrice: '76',unitQuantity: '1 kg',
      productImageName: 'http://pngall.com/eggplant-png',),
    CategoryProducts(productName: 'Kanda Lasun Masala',productDescription: 'best of its class',mrp: '55', ourPrice: '46',unitQuantity: '200 gm',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
  ];

  List<Widget> categoryProductsContainer() {
    List<Container> newContainer =[];
    for(int i=0;i<categoryProducts.length;i++){
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
                    child: Image.network(categoryProducts[i].productImageName, width: 100),
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
                                child: Text(categoryProducts[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.delete_outline,color: Colors.red,),
                            )
                          ],
                        ),

                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(categoryProducts[i].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text('Our Price - ',style: kTextSize14,),
                              Text(categoryProducts[i].mrp,style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('${categoryProducts[i].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
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
