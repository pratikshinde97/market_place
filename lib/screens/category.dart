import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/screens/cart.dart';
import 'package:toast/toast.dart';
class Category extends StatefulWidget {
  final String categoryName;
  Category(this.categoryName);
  @override
  _CategoryState createState() => _CategoryState();
}


class _CategoryState extends State<Category> {
  String categoryNameFinal;

  @override
  void initState() {
    super.initState();
    categoryNameFinal = widget.categoryName;
  }
  CategoryProducts cat = CategoryProducts();
  List<CartList> cartList = CartList().getCartList();

  List<Widget> categoryProductsContainer() {
    List<Container> newContainer =[];
    List categoryProducts = cat.getCategoryProducts();
    for(int i=0;i<categoryProducts.length;i++){
      String catName = categoryProducts[i].categoryName;
      newContainer.add(
       categoryNameFinal.compareTo(catName)!=0?
       Container() :
       Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(categoryProducts[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(categoryProducts[i].productDescription,style: TextStyle(color: Colors.grey,fontSize: 12),),
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('For - ${categoryProducts[i].unitQuantity}',style: kTextSize14,),
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
                                child: Text('${categoryProducts[i].ourPrice} ₹',style:TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),

                      ],
                    ),
                  )

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  categoryProducts[i].productStatus.compareTo('Available')==0?
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                        Toast.show("${categoryProducts[i].productName} added to Cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                        String productName = categoryProducts[i].productName;
                        String productQuantity = categoryProducts[i].unitQuantity;
                        double ourPrice = categoryProducts[i].ourPrice;
                        double mrp = categoryProducts[i].mrp;
                        String productImage = categoryProducts[i].productImageName;
                        //cartList.add(CartList(categoryName:productName,productImageName: productImage,unitQuantity:productQuantity,ourPrice: ourPrice,mrp: mrp));
                        // print(cartList.length);
                      CartItems().addItem(productName, productImage, mrp, ourPrice, productQuantity);

                    },
                    color: Colors.indigoAccent,
                    child:Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 12),),
                  )
                  :
                  Padding(
                    padding: const EdgeInsets.only(bottom:10.0,top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.close,color: Colors.red,size: 12,),
                          Text(categoryProducts[i].productStatus,style:TextStyle(color: Colors.red,fontSize: 12)),
                        ]
                    ),
                  ),

                  SizedBox(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ));
    }
    return newContainer;
  }

  List<Widget> categoryAllProductsContainer() {
    List<Container> newContainer =[];
    List categoryProducts = cat.getCategoryProducts();
    for(int i=0;i<categoryProducts.length;i++){
      newContainer.add(
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(categoryProducts[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 4,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(categoryProducts[i].productDescription,style: TextStyle(color: Colors.grey,fontSize: 12),),
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('For - ${categoryProducts[i].unitQuantity}',style: kTextSize14,),
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
                                    child: Text('${categoryProducts[i].ourPrice} ₹',style:TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8,),

                          ],
                        ),
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      categoryProducts[i].productStatus.compareTo('Available')==0?
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          Toast.show("${categoryProducts[i].productName} added to Cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                            String productName = categoryProducts[i].productName;
                            String productQuantity = categoryProducts[i].unitQuantity;
                            double ourPrice = categoryProducts[i].ourPrice;
                            double mrp = categoryProducts[i].mrp;
                            String productImage = categoryProducts[i].productImageName;
                            cartList.add(CartList(categoryName:productName,productImageName: productImage,unitQuantity:productQuantity,ourPrice: ourPrice,mrp: mrp));
                            print(cartList.length);
                            },
                        color: Colors.indigoAccent,
                        child:Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 12),),
                      )
                          :
                      Padding(
                        padding: const EdgeInsets.only(bottom:10.0,top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.close,color: Colors.red,size: 12,),
                              Text(categoryProducts[i].productStatus,style:TextStyle(color: Colors.red,fontSize: 12)),
                            ]
                        ),
                      ),

                      SizedBox(width: 10,),
                    ],
                  ),
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
        title: Text('Category'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 50,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(child: Text(categoryNameFinal,style: kTextSize16,)),
                        ),
                      ),
                    ),
                  ),
//              DropdownButton(
//                value: ,
//              ),
                  Column(
                    children: categoryNameFinal.compareTo('All Categories')==0?
                    categoryAllProductsContainer() :
                    categoryProductsContainer(),
                  )

                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: (){
                         Navigator.pop(context);
                      },
                      color: Colors.indigoAccent,
                      child: Text('Back',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                      },
                      color: Colors.indigo,
                      child: Text('Go to Cart',style: TextStyle(color: Colors.white,fontSize: 14),),
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
