class CartList {
   int id;
   int price;
   String productName;
   String productImageName;
   String mrp;
   String ourPrice;
   String unitQuantity;


  CartList({this.price,this.mrp,this.ourPrice,this.productImageName,this.productName,this.unitQuantity});

  CartList.withId({this.id,this.mrp,this.ourPrice,this.productImageName,this.productName,this.unitQuantity});


  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['productName'] = productName;
    map['productImageName'] = productImageName;
    map['mrp'] = mrp;
    map['ourPrice'] = ourPrice;
    map['unitQuantity'] = unitQuantity;
    return map;
  }

  // Extract a Note object from a Map object
   CartList.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.productName = map['productName'];
    this.productImageName = map['productImageName'];
    this.mrp = map['mrp'];
    this.ourPrice = map['ourPrice'];
    this.unitQuantity = map['unitQuantity'];
  }
}