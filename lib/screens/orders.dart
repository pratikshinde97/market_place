// import 'package:flutter/material.dart';
// import 'package:market_place/model/cart_model.dart';
// import 'package:market_place/model/order_by_date_model.dart';
// import 'package:market_place/utilities/bottomNavigationButton.dart';
// import 'package:market_place/utilities/connectivity_container.dart';
// import 'package:market_place/utilities/order_list.dart';
// import 'package:provider/provider.dart';
//
// enum delivery {
//   Delivered, Pending, Rejected
// }
// class Orders extends StatefulWidget {
//   @override
//   _OrdersState createState() => _OrdersState();
// }
//    bool connected = true;
// class _OrdersState extends State<Orders> {
//
//   List<OrderByDateModel> orderList = OrderByDateModel().getOrderList();
//
//    List<GestureDetector> userOrderList(){
//     List<GestureDetector> userContainer = [];
//     for(int i=0;i<orderList.length;i++){
//       String status =orderList[i].deliveryStatus;
//       userContainer.add(GestureDetector(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(orderList[i].date),
//                         SizedBox(height: 4,),
//                         Text(orderList[i].time)
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: status.compareTo('Delivered')==0 ? Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children:  [
//                         Icon(Icons.check,color: Colors.green[900],),
//                         SizedBox(width: 10,),
//                         Text(orderList[i].deliveryStatus,style: TextStyle(color: Colors.green[900]),),
//                       ],
//                     )
//                         : status.compareTo('Rejected')==0 ?
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children:  [
//                         Icon(Icons.close,color: Colors.red,),
//                         SizedBox(width: 10,),
//                         Text(orderList[i].deliveryStatus,style: TextStyle(color: Colors.red)),
//                       ],
//                     ) :
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children:  [
//                         Icon(Icons.pending,color: Colors.orange[500],),
//                         SizedBox(width: 10,),
//                         Text(orderList[i].deliveryStatus,style: TextStyle(color: Colors.orange[500]),),
//                       ],
//                     )
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderList(date: orderList[i].date, time: orderList[i].time,)));
//         },
//       ));
//     }
//     return userContainer;
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<CartModel>(context).checkConnectivity().then((internet) {
//       setState(() {
//         connected = internet;
//       });
//     });
//     return Scaffold(
//       backgroundColor: Color(0xFFEDF0EE),
//       appBar: AppBar(
//         title: Text('Market Place'),
//         backgroundColor: Color(0xFF344955),
//       ),
//       body: connected ? SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView(
//                 children: userOrderList(),
//               ),
//             ),
//           ],
//         ),
//       )
//           : ConnectivityContainer(),
//     );
//   }
// }
