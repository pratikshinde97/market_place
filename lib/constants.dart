import 'package:flutter/material.dart';

const kBottomTextSize = TextStyle(fontSize: 14, color: Colors.black);
const kTextSize16 = TextStyle(fontSize: 16, color: Colors.black);
const kTextSize14 = TextStyle(fontSize: 14, color: Colors.black);
const kAppBarTextSize18 = TextStyle(fontSize: 18, color: Colors.white);
const kTextField = InputDecoration(
  hintText: 'Customer Name',
  fillColor: Color(0xFFEDF0EE),
  filled: true,
  border: InputBorder.none,
);
const kDecoration = InputDecoration(
  prefixIcon:
  Icon(Icons.email, color: Colors.white),
  hintText: 'Email Id',
  hintStyle: TextStyle(color: Colors.white),
  border: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(
        color: Colors.white, width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(4)),
    borderSide:
    BorderSide(width: 1, color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
    borderSide:
    BorderSide(color: Colors.white, width: 2),
  ),
);
const kDecorationPassword = InputDecoration(
  prefixIcon:
  Icon(Icons.vpn_key, color: Colors.white),
  hintText: 'Password',
  hintStyle: TextStyle(color: Colors.white),
  disabledBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
    borderSide:
    BorderSide(width: 1, color: Colors.white),
  ),
  border: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(
        color: Colors.white, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
    borderSide:
    BorderSide(color: Colors.white, width: 2),
  ),
  //suffixIcon:
);
