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