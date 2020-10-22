import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/category_list.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/screens/category.dart';
import 'package:market_place/screens/orders.dart';
import 'package:market_place/screens/search_by_category.dart';
import 'package:market_place/utilities/carousol_class.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/drawer_main.dart';
import 'package:market_place/utilities/networking.dart';
import 'package:market_place/utilities/new_expanded.dart';
import 'package:market_place/utilities/search_products.dart';
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

  bool connected = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    Provider.of<CartModel>(context).fetchLengthFromDatabase();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFE8EAF6),
        appBar: AppBar(
          title: Text(
            'Market Place',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          actions: <Widget>[
            Stack(
              children: [
                InkWell(
                  child: Center(child: Icon(Icons.add_shopping_cart_outlined,size: 34,color: Colors.white,)),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Cart()));
                  },
                ),
                Positioned(
                  top: 9.0,
                  left: 10,

                  child: CircleAvatar(
                    backgroundColor: Colors.amber[800],
                    radius: 8,
                    child: Text('${Provider.of<CartModel>(context).cartCount}',style: TextStyle(fontSize: 8, color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),

            SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Color(0xFF344955),
        ),
        drawer: DrawerMain(),
        body: connected ? SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFF344955),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SearchByCategory()));
                          },
                          child: Container(
                            height: 40,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Search Category',
                                        style: TextStyle(color: Colors.grey,fontSize: 12),
                                      ),
                                    ),
                                    Icon(Icons.search,color:Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            print('hi');
                            showSearch(
                              context: context,
                              delegate: CustomSearchHintDelegateProducts(),
                            );

                          },
                          child: Container(
                            height: 40,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Search Product',
                                        style: TextStyle(color: Colors.grey,fontSize: 12),
                                      ),
                                    ),
                                    Icon(Icons.search,color:Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      color: Colors.amber[700],
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
                      tabName: 'All Categories',
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
                 NewExpanded(
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Cart()));
                   },
                   iconData: Icons.shopping_cart,
                   color: Colors.white,
                   tabName: 'Cart',
                 ),
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

