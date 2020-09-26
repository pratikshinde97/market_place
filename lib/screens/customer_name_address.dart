import 'package:flutter/material.dart';
import 'package:market_place/constants.dart';
import 'package:toast/toast.dart';
import 'package:market_place/screens/place_order.dart';
class CustomerNameAddress extends StatefulWidget {
  final double totalAmount;
  CustomerNameAddress({@required this.totalAmount});
  @override
  _CustomerNameAddressState createState() => _CustomerNameAddressState();
}

class _CustomerNameAddressState extends State<CustomerNameAddress> {

  String customerName;
  String mobileNumber;
  String address1;
  String address2;
  String landmark;
  String area;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Customer Details'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Customer Name & Address',textAlign: TextAlign.center,style: TextStyle(color: Colors.indigo,fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                   Divider(color: Colors.indigo,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                     child: TextField(
                       textCapitalization: TextCapitalization.words,
                       decoration: kTextField,
                       style: TextStyle(color: Colors.black),
                      onChanged: (value){
                         customerName = value;
                         },
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: kTextField.copyWith(
                          hintText: 'Mobile Number'
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          mobileNumber = value;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(
                            hintText: 'Address - line 1'
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          address1 = value;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(
                            hintText: 'Address - line 2'
                        ),
                        style: TextStyle(color: Colors.black,),
                        onChanged: (value){
                          address2 = value;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(
                            hintText: 'Landmark'
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          landmark = value;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(
                            hintText: 'Area, City'
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          area = value;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: RaisedButton(
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text('Submit',style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          if(customerName?.isEmpty?? true){
                            Toast.show("Please enter Customer Name", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                          }
                          else if(mobileNumber?.isEmpty?? true){
                            Toast.show("Please enter Mobile number ", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                          }
                          else if(mobileNumber.length<10){
                            Toast.show("Please enter Valid Mobile Number", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                          }
                          else if(address1?.isEmpty?? true){
                            Toast.show("Please enter address", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                          }
                          else if(area?.isEmpty?? true){
                            Toast.show("Please enter area", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceOrder(
                              customerName: customerName,mobileNumber: mobileNumber,
                              address: '$address1, $address2 $landmark $area',
                              totalAmount: widget.totalAmount,
                            )));
                          }
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
