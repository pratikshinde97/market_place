import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:market_place/model/cart_model.dart';
import 'package:market_place/model/user_info.dart';
import 'package:market_place/screens/place_order.dart';
import 'package:market_place/utilities/connectivity_container.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
class UpdateCustomerNameAddress extends StatefulWidget {
  final double totalAmount;
  UpdateCustomerNameAddress({@required this.totalAmount});
  @override
  _UpdateCustomerNameAddressState createState() => _UpdateCustomerNameAddressState();
}

class _UpdateCustomerNameAddressState extends State<UpdateCustomerNameAddress> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    getUserById();
  }
  String firstName;
  String lastName;
  String city;
  String pincode;
  String state;
  String mobileNumber;
  String address1;
  String address2;
  String landmark;
  String area;
  bool _loading = false;
  bool _loadData = true;
  bool connected = true;
  Sign userData;
  void checkUserData(){
    if(userData==null){
     setState(() {
       _loadData = true;
     });
    }
    else{
      setState(() {
        _loadData = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    checkUserData();
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
                child: _loadData
                    ? Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      backgroundColor: Color(0xFF344955),
                      valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                  ),
                ) :
                Column(
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
                        decoration: kTextField.copyWith(
                          hintText: userData.firstName !=null ? userData.firstName : '',
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          firstName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(
                          hintText: userData.lastName !=null ? userData.lastName : '',
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          lastName = value;
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
                          hintText: userData.mobileNumber !=null ? userData.mobileNumber : '',
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
                        kTextField.copyWith(hintText: userData.addressLine1 !=null ? userData.addressLine1 : '',),
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
                        kTextField.copyWith(hintText: userData.addressLine2 !=null ? userData.addressLine2 : '',),
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
                        decoration: kTextField.copyWith(hintText: userData.landmark !=null ? userData.landmark : '',),
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
                        decoration: kTextField.copyWith(hintText: userData.area !=null ? userData.area : '',),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          area = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(hintText: userData.city !=null ? userData.city : '',),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          city = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(hintText: userData.pincode !=null ? userData.pincode : '',),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          pincode = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: kTextField.copyWith(hintText: userData.state !=null ? userData.state : '',),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          state = value;
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Row(
                        children: [
                          Expanded(
                            flex:2,
                            child: RaisedButton(
                              color: Colors.amber[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {

                                  setState(() {
                                    _loading = !_loading;
                                  });
                                  updateCustomerInCart( firstName:firstName ,  lastName: lastName,  addressLine1: address1,  addressLine2:address2,
                                      city: city, mobileNumber: mobileNumber,  landmark: landmark,  pincode:pincode,area: area,state: state);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlaceOrder(
                                            // customerName: '$firstName $lastName',
                                            // mobileNumber: mobileNumber,
                                            // address:
                                            // '$address1, $address2 $landmark $area',
                                            totalAmount: widget.totalAmount,
                                          )));
                                  },
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex:3,
                            child: RaisedButton(
                              color: Colors.amber[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Confirm Order',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlaceOrder(
                                          // customerName: '$firstName $lastName',
                                          // mobileNumber: mobileNumber,
                                          // address:
                                          // '$address1, $address2 $landmark $area',
                                          totalAmount: widget.totalAmount,
                                        )));

                              },
                            ),
                          ),
                        ],
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
    String city, String mobileNumber, String landmark, String pincode, String area, String state}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String customerId = prefs.getString('email');
    print('////////////////////$customerId');
    print('////////////////////$mobileNumber');

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
        'area' : area,
        'state' : state,

      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _loading = !_loading;
      });
      final snackBar = SnackBar(content: Text( 'Customer Information Updated successfully'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return Sign.fromJson(jsonDecode(response.body));
    } else {
      setState(() async{
        _loading = !_loading;
      });
      final snackBar = SnackBar(content: Text('Error in Updating Customer Information , please try it again'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      throw Exception('Failed to load album');
    }
  }
  Future<Sign> getUserById() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String customerId = prefs.getString('email');
    print('////////////////////$customerId');

    final res = await http.get("http://$ipAddress:8081/api/user/$customerId");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(data);
      setState(() {
        userData = Sign.fromJson(data);
      });

      return userData;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
