import 'package:flutter/material.dart';
class CategoryProducts{
  final String categoryName;
  final String productName;
  final String productImageName;
  final String productDescription;
  final String mrp;
  final String ourPrice;
  final String unitQuantity;

  CategoryProducts({this.categoryName,this.mrp,this.ourPrice,this.productDescription,this.productImageName,this.productName,this.unitQuantity});

}