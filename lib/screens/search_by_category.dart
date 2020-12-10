import 'package:flutter/material.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/category_list.dart';
import 'package:market_place/screens/cart.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/search_categories.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
class SearchByCategory extends StatefulWidget {
  @override
  _SearchByCategoryState createState() => _SearchByCategoryState();
}

class _SearchByCategoryState extends State<SearchByCategory> {
  //List<CategoryList> categoryList = CategoryList().getCategoryList();
  bool connected = true;

  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      backgroundColor:  Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Text('Search By Category',style: kAppBarTextSize18),
        backgroundColor: Color(0xFF344955),
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

      ),
      body: connected ? SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xFF344955),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    showSearch(
                      context: context,
                      delegate: CustomSearchHintDelegateCategories(),
                    );
                  },
                  child: Container(
                    height: 50,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Search Category',
                                style: TextStyle(color: Colors.grey,fontSize: 16),
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
            ),
            Divider(color: Colors.grey,),
            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //       itemCount: categoryList.length,
            //       itemBuilder: (context, index){
            //         return Column(
            //           children: [
            //             Row(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            //                   child: Text(categoryList[index].categoryName,style: TextStyle(fontSize: 16),),
            //                 ),
            //               ],
            //             ),
            //
            //             Divider(color: Colors.grey,indent: 10,endIndent: 10,)
            //           ],
            //         );
            //       },
            //   ),
            // ),
          ],
        )
      )
          : ConnectivityContainer(),
    );
  }
}
