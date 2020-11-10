// import 'package:flutter/material.dart';
// import 'package:market_place/constants.dart';
// import 'package:market_place/model/cart_model.dart';
// import 'package:market_place/model/category_list.dart';
// import 'package:market_place/utilities/connectivity_container.dart';
// import 'package:market_place/utilities/product_image_slider.dart';
// import 'package:provider/provider.dart';
//
// class ProductDescription extends StatefulWidget {
//   final String productName;
//   ProductDescription({this.productName});
//   @override
//   _ProductDescriptionState createState() => _ProductDescriptionState();
// }
//
// class _ProductDescriptionState extends State<ProductDescription> {
//
//   List<CategoryList> mySlides = CategoryList().getCategoryList();
//
//   List<Widget> listImages(){
//     List<Padding> imageContainer =[];
//     print(mySlides.length);
//     for(int i=0;i<mySlides.length;i++){
//
//       imageContainer.add(
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           // child: Container(
//           //   height: 170,
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(40),
//           //     ),
//           //   child: Image.network(mySlides[i].imageCategory,width: 200,fit: BoxFit.cover,),
//           // ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20.0),
//               child: Image.network(
//                 mySlides[i].imageCategory,
//                 height: 170.0,
//                 width: 230.0,
//               ),
//         ),
//         )
//       );
//     }
//     return imageContainer;
//   }
//    bool connected = true;
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<CartModel>(context).checkConnectivity().then((internet) {
//       setState(() {
//         connected = internet;
//       });
//     });
//     String productName = widget.productName;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF344955),
//         title: Text('Product Description',style: kAppBarTextSize18,),
//       ),
//       body: connected ? SafeArea(
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(productName,style: TextStyle(fontSize: 16),),
//                 ],
//               ),
//             ),
//
//             Container(
//               height: 220,
//                 color: Color(0xFFE8EAF6),
//               child: ProductImageSlider()),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text('This is our new Product, it is better & best of its category. '
//                   'This is our new Product, it is better & best of its category.'
//                   'This is our new Product, it is better & best of its category.'
//                   'This is our new Product, it is better & best of its category.'
//                   'This is our new Product, it is better & best of its category.'
//                   'This is our new Product, it is better & best of its category.',style: TextStyle(fontSize: 16),),
//             ),
//             SizedBox(height: 8,),
//             Container(
//               height: 10,
//               color: Color(0xFFE8EAF6),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text('Similar Products',style: TextStyle(fontSize: 16)),
//             ),
//             Container(
//               height: 200,
//               color: Color(0xFFE8EAF6),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   children: listImages()
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             )
//           ],
//         ),
//       )
//           : ConnectivityContainer(),
//     );
//   }
// }
