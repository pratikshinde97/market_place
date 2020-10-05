import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/category_list.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/screens/category.dart';
import 'package:market_place/screens/orders.dart';
import 'package:market_place/utilities/carousol_class.dart';
import 'package:market_place/utilities/new_expanded.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryList cat = CategoryList();
  String categoryName;


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
                flex: 5,
                child: Image.network(categoryList[i].imageCategory,
                   width: 110 ,),
              ),
//              SizedBox(
//                height: 12,
//              ),
              Expanded(
                flex: 1,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        title: Text(
          'Market Place',
          style: kAppBarTextSize18,
        ),
        actions: <Widget>[
          InkWell(
              child: Icon(Icons.add_shopping_cart),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
          SizedBox(width: 10,)
        ],
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  children: <Widget>[
//                    SizedBox(
//                      height: 10,
//                    ),
                    Container(
                      height: 130,
                        child: CarouselClass()),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider()),
                        Expanded(child: Center(child: Text('Categories',style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold)))),
                        Expanded(child: Divider()),
                      ],
                    ),
                    //Center(child: Text('Categories',style: TextStyle(fontSize: 16,color: Colors.black),)),

                    Container(
                      child: CustomScrollView(
                        shrinkWrap: true,
                        primary: false,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(30),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
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
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  NewExpanded(
                    iconData: Icons.home,
                    tabName: 'Home',
                    color: Colors.indigo,
                  ),
                  NewExpanded(
                    onTap: () {
                      categoryName = 'All Categories';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Category(categoryName)));
                    },
                    iconData: Icons.category,
                    tabName: 'Category',
                  ),
                  NewExpanded(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                    iconData: Icons.business,
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
      ),
    );
  }
}
