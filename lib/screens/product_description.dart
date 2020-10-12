import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:market_place/utilities/caurousol_product_description.dart';
import 'package:market_place/utilities/product_image_slider.dart';

class ProductDescription extends StatefulWidget {
  final String productName;
  ProductDescription({this.productName});
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    String productName = widget.productName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Description',style: kAppBarTextSize18,),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(productName,style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 200,
              child: ProductImageSlider()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('This is our new Product, it is better & best of its category. '
                  'This is our new Product, it is better & best of its category.'
                  'This is our new Product, it is better & best of its category.'
                  'This is our new Product, it is better & best of its category.'
                  'This is our new Product, it is better & best of its category.'
                  'This is our new Product, it is better & best of its category.',style: TextStyle(fontSize: 16),),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
