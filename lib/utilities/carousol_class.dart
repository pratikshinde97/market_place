import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:market_place/model/category_list.dart';
class CarouselClass extends StatefulWidget {
  @override
  _CarouselClassState createState() => _CarouselClassState();
}

class _CarouselClassState extends State<CarouselClass> {
  int pageNo = 1;
  var data1;
  int index;
  int qun = 10;
  List<CategoryList> _users = List<CategoryList>();
  List<CategoryList> _searchUsers = List<CategoryList>();
  List<CategoryList> usersdata = [];
  List<CategoryList> dataList = new List();

  int count;
  bool isLoading = false;

  @override
  void initState() {
    count = 1;
    _loadData(count++);
    super.initState();
  }
  Future _loadData(int i) async {
    await new Future.delayed(new Duration(seconds: 2));
    getCategories(i).then((value) {
      setState(() {
        usersdata.addAll(value);
        _searchUsers = usersdata;
        isLoading = false;
      });
    });
    print("load more");
  }


  List<Widget> categoryContainer() {
    List<Container> newContainer = [];
    //  List categoryList = cat.getCategoryList();
    for (int i = 0; i < _searchUsers.length; i++) {
      newContainer.add(Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.memory(
              _searchUsers[i].img,
            )
        ),
      ),);
    }
    return newContainer;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),
          items: categoryContainer(),
        )
    );
  }

  Future<List<CategoryList>> getCategories(i) async {
    print('/////////////////////////////?????????');
    final res =
    await http.get("http://192.168.43.23:8081/api/sliderimages/$i/10");
    print("<<<<<<<<<<<<<<<<<<<<<<<<<");
    if (res.statusCode == 200) {
      print('>>>>>>>>>>>>>>>>$res');
      var data = json.decode(res.body);
      //var c = data['categoryName'];
      print(data);

      List v1 = [];
      v1 = data.toList();
      _users = data
          .map<CategoryList>((json) => CategoryList.fromJson(json))
          .toList();
      print(_users.length);

      // print(catData.length);
      // print(catData);
      return _users;
    } else {
      print('?????????????????????????????????');
      throw Exception('Failed to fetch data');
    }
  }
}

