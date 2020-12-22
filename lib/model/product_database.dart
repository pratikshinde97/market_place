import 'dart:convert';
import 'dart:typed_data';

class ProductDatabase {
  String categoryId;
  String productName;
  double actualPrice;
  double mrp;
  double salePrice;
  String id;
  Uint8List file1;
  Uint8List file2;
  Uint8List file3;
  Uint8List file4;
  String productDescription;

  List<Uint8List> imgList;

  ProductDatabase({
    this.categoryId,
    this.productName,
    this.actualPrice,
    this.mrp,
    this.salePrice,
    this.id,
    this.file1,
    this.file2,
    this.file3,
    this.file4,
    this.productDescription
    // this.imgList
  });

  ProductDatabase.fromJson(obj) {
    this.categoryId = obj['categoryId'];
    this.productName = obj['productName'];
    this.actualPrice = obj['actualPrice'];
    this.mrp = obj['mrp'];
    this.salePrice = obj['salePrice'];
    this.id = obj['id'];
    this.productDescription = obj['productDescription'];
    if (obj['file2'] == null) {
      this.file2 = null;
    }
    if (obj['file3'] == null) {
      this.file3 = null;
    }
    if (obj['file3'] == null) {
      this.file3 = null;
    }
    this.file1 = base64Decode(obj['file1']);

  }

  static List<ProductDatabase> fromJsonList(jsonList) {
    return jsonList
        .map<ProductDatabase>((obj) => ProductDatabase.fromJson(obj))
        .toList();
  }
}




