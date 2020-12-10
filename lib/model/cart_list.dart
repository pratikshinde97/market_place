// class CartList {
//   int id;
//   String productName;
//   String productImageName;
//   String mrp;
//   String ourPrice;
//   String unitQuantity;
//   String quantity;
//   String productId;
//
//
//   CartList(
//       {this.mrp, this.ourPrice, this.productImageName, this.productName, this.unitQuantity, this.quantity, this.productId});
//
//   CartList.withId(
//       {this.id, this.mrp, this.ourPrice, this.productImageName, this.productName, this.unitQuantity, this.quantity, this.productId});
//
//
//   Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = id;
//     }
//     map['productName'] = productName;
//     map['productImageName'] = productImageName;
//     map['mrp'] = mrp;
//     map['ourPrice'] = ourPrice;
//     map['unitQuantity'] = unitQuantity;
//     map['quantity'] = quantity;
//     map['productId'] = productId;
//     return map;
//   }
//
//   // Extract a Note object from a Map object
//   CartList.fromMapObject(Map<String, dynamic> map) {
//     this.id = map['id'];
//     this.productName = map['productName'];
//     this.productImageName = map['productImageName'];
//     this.mrp = map['mrp'];
//     this.ourPrice = map['ourPrice'];
//     this.unitQuantity = map['unitQuantity'];
//     this.quantity = map['quantity'];
//     this.productId = map['productId'];
//   }
// //required//
//   CartList.fromJson(obj) {
//     this.productId = obj['productId'];
//
//   }
//   static List<CartList> fromJsonList(jsonList) {
//     return jsonList
//         .map<CartList>((obj) => CartList.fromJson(obj))
//         .toList();
//   }
// //required//
// }

class CartList {
 String categoryName;
 String id;
 String customerId;
 String productId;
  int quantity;

 CartList.fromJson(obj) {
   this.categoryName = obj['categoryName'];
   this.id = obj['id'];
   this.customerId = obj['customerId'];
   this.productId = obj['productId'];
   this.quantity = obj['quantity'];
 }

 static List<CartList> fromJsonList(jsonList) {
   return jsonList
       .map<CartList>((obj) => CartList.fromJson(obj))
       .toList();
 }
}