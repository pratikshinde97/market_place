import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_place/constants.dart';
import 'package:market_place/model/cart_list.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/user_info.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:market_place/utilities/my_dialog.dart';
import 'package:provider/provider.dart';
import 'package:market_place/screens/place_order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerNameAddress extends StatefulWidget {
  final double totalAmount;
  CustomerNameAddress({@required this.totalAmount});
  @override
  _CustomerNameAddressState createState() => _CustomerNameAddressState();
}

class _CustomerNameAddressState extends State<CustomerNameAddress> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String firstName;
  String lastName;
  String city;
  String pincode;
  String customerName;
  String mobileNumber;
  String address1;
  String address2;
  String landmark;
  String area;
  bool _loading = false;
  bool connected = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context).checkConnectivity().then((internet) {
      setState(() {
        connected = internet;
      });
    });
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFEDF0EE),
      appBar: AppBar(
        backgroundColor: Color(0xFF344955),
        title: Text('Customer Details'),
      ),
      body: connected ? Container(
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
                      child: Text(
                        'Customer Name & Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF344955),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      color: Color(0xFF344955),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          customerName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                        maxLength: 10,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: kTextField.copyWith(
                          hintText: 'Mobile Number',
                          counterText: '',
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          mobileNumber = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration:
                            kTextField.copyWith(hintText: 'Address - line 1'),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          address1 = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration:
                            kTextField.copyWith(hintText: 'Address - line 2'),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          address2 = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(hintText: 'Landmark'),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          landmark = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(hintText: 'Area, City'),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          area = value;
                        },
                      ),
                    ),
                    _loading
                        ? Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          backgroundColor: Color(0xFF344955),
                          valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.amber),
                        ),
                      ),
                    ) :
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: RaisedButton(
                        color: Colors.amber[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (customerName?.isEmpty ?? true) {
                            final snackBar = SnackBar(content: Text('Please Enter Customer Name'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else if (mobileNumber?.isEmpty ?? true) {
                            final snackBar = SnackBar(content: Text('Please Enter Mobile Number'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else if (mobileNumber.length < 10) {
                            final snackBar = SnackBar(content: Text('Please Enter Valid Mobile Number'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else if (address1?.isEmpty ?? true) {
                            final snackBar = SnackBar(content: Text('Please Enter Address Line1'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else if (address2?.isEmpty ?? true) {
                            final snackBar = SnackBar(content: Text('Please Enter Address Line2'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else if (address1?.isEmpty ?? true) {
                            final snackBar = SnackBar(content: Text('Please enter address'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else if (landmark?.isEmpty ?? true) {
                            final snackBar = SnackBar(content: Text('Please Enter Landmark'),duration: Duration(seconds: 2),);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          } else {
                            setState(() {
                              _loading = !_loading;
                            });
                            updateCustomerInCart( firstName:firstName ,  lastName: lastName,  addressLine1: address1,  addressLine2:address2,
                               city: city, mobileNumber: mobileNumber,  landmark: landmark,  pincode:pincode);
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlaceOrder(
                                          customerName: customerName,
                                          mobileNumber: mobileNumber,
                                          address:
                                              '$address1, $address2 $landmark $area',
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
      )
          : ConnectivityContainer(),
    );
  }
  Future<Sign> updateCustomerInCart({String firstName, String lastName, String addressLine1, String addressLine2,
     String city, String mobileNumber, String landmark, String pincode}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String customerId = prefs.getString('email');
    print('////////////////////$customerId');

    final http.Response response = await http.put(
      'http://$ipAddress:8081/api/user/$customerId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': customerId,
        'firstName' : firstName,
        'lastName' : lastName,
        'addressLine1' : addressLine1,
        'addressLine2' : addressLine2,
        'city' : city,
        'mobileNumber' : mobileNumber,
        'landmark': landmark,
        'pincode' : pincode,

      }),
    );
    //'area' area,
    if (response.statusCode == 200) {
      setState(() {
        _loading = !_loading;
      });
      final snackBar = SnackBar(content: Text( 'Customer Information Updated successfully'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      // MyDialog().showMyDialog(this.context, 'Customer Information',
      //     'Customer Information Updated successfully');
      return Sign.fromJson(jsonDecode(response.body));
    } else {
      setState(() async{
        _loading = !_loading;
      });
      final snackBar = SnackBar(content: Text('Error in Updating Customer Information , please try it again'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      // MyDialog().showMyDialog(this.context, 'Customer Information',
      //     'Error in Updating Customer Information , please try it again');
      throw Exception('Failed to load album');
    }
  }
}
