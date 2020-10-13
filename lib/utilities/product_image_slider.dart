import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:market_place/model/slider_model.dart';
import 'package:market_place/screens/home_page.dart';

class ProductImageSlider extends StatefulWidget {
  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  //PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF344955) : Colors.grey[500],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    //controller = new PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Container(
              height: 150,
              width: 250,
              child: PageView(
                //controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                  ),
                  SlideTile(
                    imagePath: mySLides[3].getImageAssetPath(),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height:50,
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      i == slideIndex
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false),
                  ],
                ),
              ),
            ],
          )
        ],
      );
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(imagePath,fit: BoxFit.cover,),
    );
  }
}

