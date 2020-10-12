import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16,),
                Text(productName,style: TextStyle(fontSize: 16),),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
              child: Container(
                height: 150,
                color: Colors.indigoAccent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('This is our new Product, it is better & best of its category. '
                      'This is our new Product, it is better & best of its category.'
                      'This is our new Product, it is better & best of its category.'
                      'This is our new Product, it is better & best of its category.'
                      'This is our new Product, it is better & best of its category.'
                      'This is our new Product, it is better & best of its category.',style: TextStyle(fontSize: 16),),
                ),
              ],
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
