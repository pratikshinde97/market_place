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

  // factory ProductDatabase.fromJson(Map<String, dynamic> json) {
  //   return ProductDatabase(
  //     categoryId: json['categoryId'],
  //     productName: json['productName'],
  //     actualPrice: json['actualPrice'],
  //     mrp: json['mrp'],
  //     salePrice: json['salePrice'],
  //     id: json['id'],
  //     file1: base64Decode(json['file1']),
  //     file2: base64Decode(json['file2']),
  //     file3: base64Decode(json['file3']),
  //     file4: base64Decode(json['file4']),
  //
  //     // imgList: json['list'].cast<Uint8List>().toList(),
  //   );
  // }

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
    // this.file2 = base64Decode(obj['file2']);
    // this.file3 = base64Decode(obj['file3']);
    // this.file4 = base64Decode(obj['file4']);
    // if (obj['list'].cast<Uint8List>().toList() == null) {
    //   this.imgList = null;
    // }
    //this.imgList = obj['list'].cast<Uint8List>().toList();
  }

  static List<ProductDatabase> fromJsonList(jsonList) {
    return jsonList
        .map<ProductDatabase>((obj) => ProductDatabase.fromJson(obj))
        .toList();
  }
}




// class ProductDatabase {
//   String categoryId;
//   String productName;
//   double actualPrice;
//   double mrp;
//   double salePrice;
//   String id;
//   String productDescription;
//   Uint8List file1;
//   Uint8List file2;
//   Uint8List file3;
//   Uint8List file4;
//
//   // List<Uint8List> imgList;
//
//   ProductDatabase(
//       {this.categoryId,
//         this.productName,
//         this.actualPrice,
//         this.mrp,
//         this.salePrice,
//         this.id,
//         this.file1,
//         this.file2,
//         this.file3,
//         this.file4,
//         this.productDescription
//         // this.imgList
//       });
//
//   factory ProductDatabase.fromJson(Map<String, dynamic> json) {
//     return ProductDatabase(
//         categoryId: json['categoryId'] as String,
//         productName: json['productName'] as String,
//         actualPrice: json['actualPrice'] as double,
//         mrp: json['mrp'] as double,
//         salePrice: json['salePrice'] as double,
//         id: json['id'] as String,
//         file1: base64Decode(json['file1']) == null
//             ? null
//             : base64Decode(json['file1']),
//         file2: base64Decode(json['file2']) == null
//             ? null
//             : base64Decode(json['file2']),
//         file3: base64Decode(json['file3']) == null
//             ? null
//             : base64Decode(json['file3']),
//         file4: base64Decode(json['file4']) == null
//             ? null
//             : base64Decode(json['file4']),
//         productDescription: json['productDescription'] as String
//       // imgList: json['list'].cast<Uint8List>().toList(),
//     );
//   }
//
//   // ProductDatabase.fromJson(obj) {
//   //   this.categoryId = obj['categoryId'];
//   //   this.productName = obj['productName'];
//   //   this.actualPrice = obj['actualPrice'];
//   //   this.mrp = obj['mrp'];
//   //   this.salePrice = obj['salePrice'];
//   //   this.id = obj['id'];
//   //   if (obj['file2'] == null) {
//   //     this.file2 = null;
//   //   } else {
//   //     this.file2 = base64Decode(obj['file2']);
//   //   }
//   //   if (obj['file3'] == null) {
//   //     this.file3 = null;
//   //   } else {
//   //     this.file3 = base64Decode(obj['file3']);
//   //   }
//   //   if (obj['file3'] == null) {
//   //     this.file3 = null;
//   //   } else {
//   //     this.file4 = base64Decode(obj['file4']);
//   //   }
//   //   this.file1 = base64Decode(obj['file1']);
//   //   // this.file2 = base64Decode(obj['file2']);
//   //   // this.file3 = base64Decode(obj['file3']);
//   //   // this.file4 = base64Decode(obj['file4']);
//   //   // if (obj['list'].cast<Uint8List>().toList() == null) {
//   //   //   this.imgList = null;
//   //   // }
//   //   //this.imgList = obj['list'].cast<Uint8List>().toList();
//   // }
//
//   static List<ProductDatabase> fromJsonList(jsonList) {
//     return jsonList
//         .map<ProductDatabase>((obj) => ProductDatabase.fromJson(obj))
//         .toList();
//   }
// }
