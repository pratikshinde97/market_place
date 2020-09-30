import 'package:flutter/material.dart';
import 'package:market_place/screens/order_submitted.dart';
import 'package:market_place/utilities/order_summary_row.dart';
class PlaceOrder extends StatefulWidget {
  final String customerName;
  final String mobileNumber;
  final String address;
  final double totalAmount;
  PlaceOrder({this.mobileNumber,this.customerName,this.address,this.totalAmount});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {

  showAlertDialog(BuildContext context){

    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Please Wait" )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        title: Text('Order Summary'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
              elevation: 2,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    color: Colors.indigoAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12,top: 12),
                      child: Text('Order Summary',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),

                  OrderSummaryRow('Customer Name',widget.customerName,16,Colors.indigo),
                  OrderSummaryRow('Delivery Address',widget.address,14,Colors.black45),
                  OrderSummaryRow('Mobile Number',widget.mobileNumber,14,Colors.black87),
                  OrderSummaryRow('Amount','${widget.totalAmount} ₹',16,Colors.green[900]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 16),
                    child: RaisedButton(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text('Place Your Order',style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                      onPressed: (){
                        //showAlertDialog(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSubmitted()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

