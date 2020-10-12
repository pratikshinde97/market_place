import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/database_helper/database_helper_cart.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/category_products.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/screens/product_description.dart';
import 'package:provider/provider.dart';
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

  List<Widget> categoryProductsContainer() {
    List<Container> newContainer = [];
    List categoryProducts = cat.getCategoryProducts();
    for (int i = 0; i < categoryProducts.length; i++) {
      String catName = categoryProducts[i].categoryName;
      newContainer.add(categoryNameFinal.compareTo(catName) != 0
          ? Container()
          : Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Card(
                elevation: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //Icon(categoryList[i].iconCategory,size: 40,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(
                              categoryProducts[i].productImageName,
                              width: 100),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  categoryProducts[i].productName,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF344955),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  categoryProducts[i].productDescription,
                                  style: TextStyle(
                                      color: Color(0xFF344955), fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'For - ${categoryProducts[i].unitQuantity}',
                                  style: kTextSize14,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Our Price - ',
                                      style: kTextSize14,
                                    ),
                                    Text(
                                      '${categoryProducts[i].mrp}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${categoryProducts[i].ourPrice} ₹',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ProductDescription(productName: categoryProducts[i].productName,)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Product Details',style: TextStyle(fontSize: 14,color: Colors.indigoAccent)),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        categoryProducts[i]
                                    .productStatus
                                    .compareTo('Available') ==
                                0
                            ? RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onPressed: () {
                                  String productName =
                                      categoryProducts[i].productName;
                                  String productQuantity =
                                      categoryProducts[i].unitQuantity;
                                  String ourPrice =
                                      categoryProducts[i].ourPrice;
                                  String mrp = categoryProducts[i].mrp;
                                  String productImage =
                                      categoryProducts[i].productImageName;
                                  String quantity = '1';
                                  String productId =
                                      categoryProducts[i].productId;
                                  //  var databaseHelperCart = DatabaseHelperCart();
                                  //CartList cartList = CartList();
                                  // databaseHelperCart.insertNote(CartList(productName:productName,productImageName: productImage,unitQuantity:productQuantity,ourPrice: ourPrice,mrp: mrp,quantity: quantity));

                                  Provider.of<CartModel>(context).addInDatabase(
                                      CartList(
                                          quantity: quantity,
                                          productId: productId,
                                          productName: productName,
                                          productImageName: productImage,
                                          ourPrice: ourPrice,
                                          mrp: mrp,
                                          unitQuantity: productQuantity));

                                  //Provider.of<CartModel>(context).add(CartList(productName: productName,productImageName: productImage,ourPrice: ourPrice,mrp: mrp,unitQuantity:productQuantity));
                                  Toast.show(
                                      "${categoryProducts[i].productName} added to Cart",
                                      context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.CENTER);
                                },
                                color: Colors.amber[600],
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 12,
                                      ),
                                      Text(categoryProducts[i].productStatus,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12)),
                                    ]),
                              ),
                        SizedBox(
                          width: 10,
                        ),
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
    List<Container> newContainer = [];
    List categoryProducts = cat.getCategoryProducts();
    for (int i = 0; i < categoryProducts.length; i++) {
      newContainer.add(Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Icon(categoryList[i].iconCategory,size: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(categoryProducts[i].productImageName,
                        width: 100),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            categoryProducts[i].productName,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            categoryProducts[i].productDescription,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'For - ${categoryProducts[i].unitQuantity}',
                            style: kTextSize14,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Our Price - ',
                                style: kTextSize14,
                              ),
                              Text(
                                categoryProducts[i].mrp,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '${categoryProducts[i].ourPrice} ₹',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ProductDescription(productName: categoryProducts[i].productName,)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Product Details',style: TextStyle(fontSize: 14,color: Colors.indigoAccent)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  categoryProducts[i].productStatus.compareTo('Available') == 0
                      ? RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            String productName =
                                categoryProducts[i].productName;
                            String productQuantity =
                                categoryProducts[i].unitQuantity;
                            String ourPrice = categoryProducts[i].ourPrice;
                            String mrp = categoryProducts[i].mrp;
                            String productImage =
                                categoryProducts[i].productImageName;
                            String quantity = '1';
                            String productId = categoryProducts[i].productId;

                            //var databaseHelperCart = DatabaseHelperCart();
                            //databaseHelperCart.insertNote(CartList(productName:productName,productImageName: productImage,unitQuantity:productQuantity,ourPrice: ourPrice,mrp: mrp,productId:productId,quantity: quantity ));

                            Provider.of<CartModel>(context).addInDatabase(
                                CartList(
                                    quantity: quantity,
                                    productId: productId,
                                    productName: productName,
                                    productImageName: productImage,
                                    ourPrice: ourPrice,
                                    mrp: mrp,
                                    unitQuantity: productQuantity));
                            Toast.show(
                                "${categoryProducts[i].productName} added to Cart",
                                context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.CENTER);
                          },
                          color: Colors.amber[600],
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 12,
                                ),
                                Text(categoryProducts[i].productStatus,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12)),
                              ]),
                        ),
                  SizedBox(
                    width: 10,
                  ),
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
        backgroundColor: Color(0xFF344955),
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
                          child: Center(
                              child: Text(
                            categoryNameFinal,
                            style: kTextSize16,
                          )),
                        ),
                      ),
                    ),
                  ),
//              DropdownButton(
//                items: Provider.of<CartModel>(context).items[i].productName.tol,
//                value: ,
//              ),
                  Column(
                    children: categoryNameFinal.compareTo('All Categories') == 0
                        ? categoryAllProductsContainer()
                        : categoryProductsContainer(),
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(0xFF344955),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      },
                      color: Colors.amber[600],
                      child: Text(
                        'Go to Cart',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
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
