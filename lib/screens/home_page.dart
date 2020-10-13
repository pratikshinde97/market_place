import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/category_list.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/screens/category.dart';
import 'package:market_place/screens/orders.dart';
import 'package:market_place/utilities/carousol_class.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/new_expanded.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CategoryList cat = CategoryList();
  String categoryName;
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure'),
            content: Text('Do you want to exit ?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  List<Widget> categoryContainer() {
    List<Container> newContainer = [];
    List categoryList = cat.getCategoryList();
    for (int i = 0; i < categoryList.length; i++) {
      newContainer.add(Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            categoryName = categoryList[i].categoryName;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(categoryName)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Icon(categoryList[i].iconCategory,size: 40,),
              Expanded(
                flex: 3,
                child: Image.network(
                  categoryList[i].imageCategory,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                //flex: 1,
                child: Text(
                  categoryList[i].categoryName,
                  style: kBottomTextSize,
                ),
              )
            ],
          ),
        ),
      ));
    }
    return newContainer;
  }

  bool connected;
  @override
  Widget build(BuildContext context) {

    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFE8EAF6),
        appBar: AppBar(
          title: Text(
            'Market Place',
            //style: kAppBarTextSize18,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Color(0xFF344955),
        ),
         // body: connected ? OnlineWork() : OfflineWork();
        body: connected ? SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView(
                    children: <Widget>[
                      Container(height: 140, child: CarouselClass()),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: Color(0xFF344955),
                            indent: 20,
                          )),
                          Expanded(
                              child: Center(
                                  child: Text('Categories',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold)))),
                          Expanded(
                              child: Divider(
                            color: Color(0xFF344955),
                            endIndent: 20,
                          )),
                        ],
                      ),

                      Container(
                        child: CustomScrollView(
                          shrinkWrap: true,
                          primary: false,
                          slivers: <Widget>[
                            SliverPadding(
                              padding: const EdgeInsets.all(16),
                              sliver: SliverGrid.count(
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                crossAxisCount: 2,
                                children: categoryContainer(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 54,
                color: Color(0xFF344955),
                child: Row(
                  children: <Widget>[
                    NewExpanded(
                      iconData: Icons.home,
                      tabName: 'Home',
                      color: Colors.yellow[700],
                    ),
                    NewExpanded(
                      onTap: () {
                        categoryName = 'All Categories';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category(categoryName)));
                      },
                      color: Colors.white,
                      iconData: Icons.category,
                      tabName: 'Category',
                    ),
                    NewExpanded(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Orders()));
                      },
                      iconData: Icons.business,
                      color: Colors.white,
                      tabName: 'Orders',
                    ),
//                  NewExpanded(
//                    onTap: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => Cart()));
//                    },
//                    iconData: Icons.shopping_cart,
//                    tabName: 'Cart',
//                  ),
                  ],
                ),
              ),
            ],
          ),
        )
            : ConnectivityContainer(),
        ),
    );
  }
}
