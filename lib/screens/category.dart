import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/utilities/bottomNavigationButton.dart';
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

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
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 5,
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
                              Text(categoryProducts[i].mrp,style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('${categoryProducts[i].ourPrice} ₹',style: kTextSize14,),
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
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: (){

                    },
                    color: Colors.indigoAccent,
                    child:Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 12),),
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
        title: Text('Market Place'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          //color: Color(0xFFEDF0EE),
          height: MediaQuery.of(context).size.height,
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
                      child: Center(child: Text('Category Name',style: kTextSize16,)),
                    ),
                  ),
                ),
              ),
//              DropdownButton(
//                value: ,
//              ),
              Column(
                children: categoryProductsContainer(),
              )

            ],
          ),
        ),
      ),
    );
  }
}
