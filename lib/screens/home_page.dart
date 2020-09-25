import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/category_list.dart';
import 'package:market_place/screens/category.dart';
import 'package:market_place/utilities/carousol_class.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryList> categoryList = [
    CategoryList(
      categoryName: 'cat-1',
      imageCategory:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    ),
    CategoryList(
      categoryName: 'cat-2',
      imageCategory:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    ),
    CategoryList(
      categoryName: 'cat-3',
      imageCategory:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ),
    CategoryList(
      categoryName: 'cat-4',
      imageCategory:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    ),
  ];

  List<Widget> categoryContainer() {
    List<Container> newContainer = [];
    for (int i = 0; i < categoryList.length; i++) {
      newContainer.add(Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Category()));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Icon(categoryList[i].iconCategory,size: 40,),
              Expanded(
                flex: 3,
                child: Image.network(categoryList[i].imageCategory,
                    height: 70, width: 90),
              ),
              SizedBox(
                height: 12,
              ),
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
          style: kAppTextSize18,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CarouselClass(),
              Container(
                child: CustomScrollView(
                  shrinkWrap: true,
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(40),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 26,
                        mainAxisSpacing: 26,
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
    );
  }
}
