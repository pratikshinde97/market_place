// cart
//
//  List<Widget> categoryProductsContainer() {
//    List<Container> newContainer =[];
//    for(int i=0;i<cartList.length;i++){
//      newContainer.add(Container(
//        color: Colors.white,
//        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
//        child: Card(
//          elevation: 2,
//          child: Column(
//            children: <Widget>[
//              Row (
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  //Icon(categoryList[i].iconCategory,size: 40,),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                    child: Image.network(cartList[i].productImageName, width: 100),
//                  ),
//                  Expanded(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        SizedBox(height: 8,),
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Text(cartList[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
//                              ),
//                            ),
//                            GestureDetector(
//                              onTap: (){
//                                setState(() {
//                                  cartList.removeAt(i);
//                                  print(cartList.length);
//                                });
//                              },
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Icon(Icons.delete_outline,color: Colors.red,),
//                              ),
//                            )
//                          ],
//                        ),
//
//                        SizedBox(height: 8,),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Text(cartList[i].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
//                        ),
//                        SizedBox(height: 4,),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Row(
//                            children: <Widget>[
//                              Text('Our Price - ',style: kTextSize14,),
//                              Text('${cartList[i].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
//                              Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Text('${cartList[i].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
//                              ),
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 12,),
//
//                      ],
//                    ),
//                  )
//
//                ],
//              ),
//              //QuantityRow(price: cartList[i].ourPrice,),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Container(
//                    child: Row(
//                      children: <Widget>[
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          onTap:   (){
//                            setState(() {
//                              if(count>=1){
//                                count--;
//                                finalPrice = cartList[i].ourPrice * count;
//                                print(finalPrice);
//                              }
//                            });
//                          },
//                        ),
//                        Container(
//                          width: 50,
//                          height: 30,
//                          decoration: BoxDecoration(
//                            border: Border.all(width: 1,color: Colors.indigoAccent),
//
//                          ),
//                          child: Center(child: Text('$count',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
//                        ),
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          onTap: (){
//                            setState(() {
//                              if(count<100){
//                                count++;
//                                finalPrice = cartList[i].ourPrice * count;
//                                print(finalPrice);
//                              }
//                            });
//                          },
//                        ),
//                        SizedBox(width: 20,)
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//              SizedBox(height: 10,),
//            ],
//          ),
//        ),
//      ));
//    }
//    return newContainer;
//  }
//
//
//                        print(note);
//                        print(await databaseHelperCart.getCount());
//                        print(await databaseHelperCart.getNoteList());
// cartList.add(CartList(categoryName:productName,productImageName: productImage,unitQuantity:productQuantity,ourPrice: ourPrice,mrp: mrp));
// print(cartList.length);
// CartItems().addItem(productName, productImage, mrp, ourPrice, productQuantity,pdtid);
//
//
//
// confirm_order
//
//  List<CategoryProducts> categoryProducts = [
//    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
//    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
//    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
//    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
//    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Basmati Rice', ourPrice: '76',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Cheese', ourPrice: '90',unitQuantity: '0.5 kg',),
//    CategoryProducts(productName: 'Panner', ourPrice: '140',unitQuantity: '1 kg',),
//    CategoryProducts(productName: 'Potato', ourPrice: '26',unitQuantity: '1 kg',),
//  ];
//  List<Widget> finalProductList() {
//    List<Container> newContainer =[];
//    for(int i=0;i<categoryProducts.length;i++){
//      newContainer.add(Container(
//        color: Colors.white,
//        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
//        child: Row (
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            //Icon(categoryList[i].iconCategory,size: 40,),
//            Expanded(
//              flex: 2,
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text(categoryProducts[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
//              ),
//            ),
//
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text(categoryProducts[i].unitQuantity,style: TextStyle(color: Colors.black,fontSize: 14),),
//              ),
//            ),
//
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text('${categoryProducts[i].ourPrice}',style: kTextSize14,),
//              ),
//            ),
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text('${categoryProducts[i].ourPrice}',style: TextStyle(color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),),
//              ),
//            )
//
//          ],
//        ),
//      ));
//    }
//    return newContainer;
//  }
//
// cart_list
//
//
//
// class CartList {
//  final String categoryName;
//  final String productName;
//  final String productImageName;
//  final String productDescription;
//  final double mrp;
//  final double ourPrice;
//  final String unitQuantity;
//  final String productStatus;
//  final String pdtId;
//
//
//  CartList({this.categoryName,this.mrp,this.ourPrice,this.productDescription,this.productImageName,this.productName,this.unitQuantity,this.productStatus,this.pdtId});
//
// //  Map<String, dynamic> toMap() {
// //    return {
// //      'id': id,
// //      'name': name,
// //      'age': age,
// //    };
// //  }
//  List<CartList> getCartList(){
//    List<CartList> cartList = [
//      CartList(productName: 'Basmati Rice',productDescription: 'best rice in world',mrp: 55, ourPrice: 46,unitQuantity: '1 kg',
//      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
//      CartList(productName: 'Tur Dal',productDescription: 'Direct come from fresh farm abgjjkff vhjk',mrp: 95, ourPrice: 86,unitQuantity: '1 kg',
//      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
//      CartList(productName: 'tomato',productDescription: 'fresh farm product',mrp:85, ourPrice: 76,unitQuantity: '1 kg',
//      productImageName: 'http://pngall.com/eggplant-png',),
//      CartList(productName: 'Kanda Lasun Masala',productDescription: 'best of its class',mrp: 55, ourPrice: 46,unitQuantity: '200 gm',
//      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
//
//    ];
//    return cartList;
//  }
// }
//
//
// cart//
//  int itemsLength;
//  double finalPrice;
//  CartList cartList;
//
//  Future<List<CartList>> fetchProductFromDatabase() async {
//    var dbHelper = DatabaseHelperCart();
//    Future<List<CartList>> cartList = dbHelper.getNoteList();
//    return cartList;
//  }
//   Future<int> fetchLengthFromDatabase() async{
//     var dbHelper = DatabaseHelperCart();
//     int cart =await dbHelper.getCount();
//     setState(() {
//       itemsLength = cart;
//     });
//    return itemsLength;
//  }
//  Future<int> updateFromDatabase(cartList) async{
//    var dbHelper = DatabaseHelperCart();
//    int cart =await dbHelper.updateNote(cartList);
// //    setState(() {
// //      itemsLength = cart;
// //    });
//    return cart;
//  }
//  @override
//  void initState() {
//    super.initState();
//    //fetchLengthFromDatabase();
//  }
//
//  Widget quantityValue(){
//    int count=1;
//    return  Row(
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Container(
//          child: Row(
//            children: <Widget>[
//              GestureDetector(
//                child: Container(
//                  width: 40,
//                  height: 30,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
//                      color: Colors.indigoAccent
//                  ),
//                  child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                ),
//                onTap:   (){
//                  setState(() {
//
//                    if(count>=1){
//                      count--;
// //                      double price =double.parse(snapshot.data[index].ourPrice);
// //                      price = price * count;
// //                      snapshot.data[index].ourPrice = price.toString();
// //                      updateFromDatabase(snapshot.data[index].ourPrice);
// //                      print(snapshot.data[index].ourPrice);
// //                      //Cart(quantity: count,);
//
//                    }
//                  });
//                },
//              ),
//              Container(
//                width: 50,
//                height: 30,
//                decoration: BoxDecoration(
//                  border: Border.all(width: 1,color: Colors.indigoAccent),
//
//                ),
//                child: Center(child: Text('$count',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
//              ),
//              GestureDetector(
//                child: Container(
//                  width: 40,
//                  height: 30,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
//                      color: Colors.indigoAccent
//                  ),
//                  child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                ),
//                onTap: (){
//                  setState(() {
//                    if(count<100){
//                      count++;
// //                       finalPrice = price * count;
// //                       Cart(price: finalPrice,);
// //                       print(finalPrice);
//                      //Cart(quantity: count,);
//                    }
//                  });
//                },
//              ),
//              SizedBox(width: 20,)
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Container(
//                    child: Row(
//                      children: <Widget>[
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          onTap:   (){
//                            setState(() {
//                              if(count>=1){
//                                count--;
//                                finalPrice = cartList[i].ourPrice * count;
//                                print(finalPrice);
//                              }
//                            });
//                          },
//                        ),
//                        Container(
//                          width: 50,
//                          height: 30,
//                          decoration: BoxDecoration(
//                            border: Border.all(width: 1,color: Colors.indigoAccent),
//
//                          ),
//                          child: Center(child: Text('$count',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
//                        ),
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          onTap: (){
//                            setState(() {
//                              if(count<100){
//                                count++;
//                                finalPrice = cartList[i].ourPrice * count;
//                                print(finalPrice);
//                              }
//                            });
//                          },
//                        ),
//                        SizedBox(width: 20,)
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//
// print(widget.quantity);
//    fetchProductFromDatabase();
//    fetchLengthFromDatabase();
//
//          children: <Widget>[
//
// //            Expanded(
// //              child: FutureBuilder<List<CartList>>(
// //                future: fetchProductFromDatabase(),
// //                builder: (context, snapshot) {
// //                  if (snapshot.hasData) {
// //                     int count=2;
// //                    return Container(
// //                      child: new ListView.builder(
// //
// //                          scrollDirection: Axis.vertical,
// //                          shrinkWrap: true,
// //                          itemCount: snapshot.data.length,
// //
// //                          itemBuilder: (context, index) {
// //                            return Container(
// //                              color: Colors.white,
// //                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
// //                              child: Card(
// //                                elevation: 2,
// //                                child: Column(
// //                                  children: <Widget>[
// //                                    Row (
// //                                      mainAxisAlignment: MainAxisAlignment.start,
// //                                      children: <Widget>[
// //                                        //Icon(categoryList[i].iconCategory,size: 40,),
// //                                        Padding(
// //                                          padding: const EdgeInsets.symmetric(horizontal: 10),
// //                                          child: Image.network(snapshot.data[index].productImageName, width: 100),
// //                                        ),
// //                                        Expanded(
// //                                          child: Column(
// //                                            crossAxisAlignment: CrossAxisAlignment.start,
// //                                            children: <Widget>[
// //                                              SizedBox(height: 8,),
// //                                              Row(
// //                                                children: <Widget>[
// //                                                  Expanded(
// //                                                    child: Padding(
// //                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
// //                                                      child: Text(snapshot.data[index].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
// //                                                    ),
// //                                                  ),
// //                                                  GestureDetector(
// //                                                    onTap: (){
// ////                                                          setState(() {
// ////                                                            snapshot.data[index].removeAt(i);
// ////                                                            print(cartList.length);
// ////                                                          });
// //                                                    },
// //                                                    child: Padding(
// //                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
// //                                                      child: Icon(Icons.delete_outline,color: Colors.red,),
// //                                                    ),
// //                                                  )
// //                                                ],
// //                                              ),
// //
// //                                              SizedBox(height: 8,),
// //                                              Padding(
// //                                                padding: const EdgeInsets.symmetric(horizontal: 10),
// //                                                child: Text(snapshot.data[index].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
// //                                              ),
// //                                              SizedBox(height: 4,),
// //                                              Padding(
// //                                                padding: const EdgeInsets.symmetric(horizontal: 10),
// //                                                child: Row(
// //                                                  children: <Widget>[
// //                                                    Text('Our Price - ',style: kTextSize14,),
// //                                                    Text('${snapshot.data[index].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
// //                                                    Padding(
// //                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
// //                                                      child: Text('${snapshot.data[index].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
// //                                                    ),
// //                                                  ],
// //                                                ),
// //                                              ),
// //                                              SizedBox(height: 12,),
// //
// //                                            ],
// //                                          ),
// //                                        )
// //
// //                                      ],
// //                                    ),
// //
// //                                    Row(
// //                                      mainAxisAlignment: MainAxisAlignment.end,
// //                                      children: <Widget>[
// //                                        //QuantityRow(price: double.parse(snapshot.data[index].ourPrice),),
// //                                        //quantityValue(),
// //                                    Row(
// //                                    mainAxisAlignment: MainAxisAlignment.end,
// //                                      children: <Widget>[
// //                                        Container(
// //                                          child: Row(
// //                                            children: <Widget>[
// //                                              GestureDetector(
// //                                                child: Container(
// //                                                  width: 40,
// //                                                  height: 30,
// //                                                  decoration: BoxDecoration(
// //                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
// //                                                      color: Colors.indigoAccent
// //                                                  ),
// //                                                  child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
// //                                                ),
// //                                                onTap:   (){
// //                                                  setState(() {
// //                                                    if(count>=1){
// //                                                      count--;
// ////                      double price =double.parse(snapshot.data[index].ourPrice);
// ////                      price = price * count;
// ////                      snapshot.data[index].ourPrice = price.toString();
// ////                      updateFromDatabase(snapshot.data[index].ourPrice);
// ////                      print(snapshot.data[index].ourPrice);
// ////                      //Cart(quantity: count,);
// //
// //                                                    }
// //                                                  });
// //                                                },
// //                                              ),
// //                                              Container(
// //                                                width: 50,
// //                                                height: 30,
// //                                                decoration: BoxDecoration(
// //                                                  border: Border.all(width: 1,color: Colors.indigoAccent),
// //
// //                                                ),
// //                                                child: Center(child: Text('$count',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
// //                                              ),
// //                                              GestureDetector(
// //                                                child: Container(
// //                                                  width: 40,
// //                                                  height: 30,
// //                                                  decoration: BoxDecoration(
// //                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
// //                                                      color: Colors.indigoAccent
// //                                                  ),
// //                                                  child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
// //                                                ),
// //                                                onTap: (){
// //                                                  setState(() {
// //                                                    if(count<100){
// //                                                      count++;
// ////                       finalPrice = price * count;
// ////                       Cart(price: finalPrice,);
// ////                       print(finalPrice);
// //                                                      //Cart(quantity: count,);
// //                                                    }
// //                                                  });
// //                                                },
// //                                              ),
// //                                              SizedBox(width: 20,)
// //                                            ],
// //                                          ),
// //                                        ),
// //                                      ],
// //                                    ),
// //                                      ],
// //                                    ),
// //
// //                                    SizedBox(height: 10,),
// //                                  ],
// //                                ),
// //                              ),
// //                            );
// //                          }),
// //                    );
// //                  } else if (snapshot.hasError) {
// //                    return new Text("${snapshot.error}");
// //                  }
// //                  return new Container(
// //                    alignment: AlignmentDirectional.center,
// //                    child: new CircularProgressIndicator(),
// //                  );
// //                },
// //              ),
// //            ),
//
//          ],
//
// confirm_order
//  Future<List<CartList>> fetchProductFromDatabase() async {
//    var dbHelper = DatabaseHelperCart();
//    Future<List<CartList>> cartList = dbHelper.getNoteList();
//    return cartList;
//  }
//
//          Expanded(
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: ListView(
//                  shrinkWrap: true,
//                  children: finalProductList()
//                ),
//              ),
//            ),
//          ),
//          Expanded(
//            child: FutureBuilder<List<CartList>>(
//              future: fetchProductFromDatabase(),
//              builder: (context, snapshot) {
//                if (snapshot.hasData) {
//                  return Container(
//                    child: new ListView.builder(
//
//                        scrollDirection: Axis.vertical,
//                        shrinkWrap: true,
//                        itemCount: snapshot.data.length,
//                        itemBuilder: (context, index) {
//                          return Container(
//                            color: Colors.white,
//                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
//                            child: Row (
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                //Icon(categoryList[i].iconCategory,size: 40,),
//                                Expanded(
//                                  flex: 2,
//                                  child: Padding(
//                                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                                    child: Text(snapshot.data[index].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
//                                  ),
//                                ),
//
//                                Expanded(
//                                  child: Padding(
//                                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                                    child: Text(snapshot.data[index].unitQuantity,style: TextStyle(color: Colors.black,fontSize: 14),),
//                                  ),
//                                ),
//
//                                Expanded(
//                                  child: Padding(
//                                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                                    child: Text('${snapshot.data[index].ourPrice}',style: kTextSize14,),
//                                  ),
//                                ),
//                                Expanded(
//                                  child: Padding(
//                                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                                    child: Text('${snapshot.data[index].ourPrice}',style: TextStyle(color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),),
//                                  ),
//                                )
//
//                              ],
//                            ),
//                          );
//                        }),
//                  );
//                } else if (snapshot.hasError) {
//                  return new Text("${snapshot.error}");
//                }
//                return new Container(
//                  alignment: AlignmentDirectional.center,
//                  child: new CircularProgressIndicator(),
//                );
//              },
//            ),
//          ),
//
//
//    List<Widget> categoryProductsContainer() {
//    List<Container> newContainer =[];
//    for(int i=0;i<Provider.of<CartModel>(context).itemCount;i++){
//      final int finalCount=1;
//      newContainer.add(Container(
//        color: Colors.white,
//        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
//        child: Card(
//          elevation: 2,
//          child: Column(
//            children: <Widget>[
//              Row (
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  //Icon(categoryList[i].iconCategory,size: 40,),
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 10),
//                    child: Image.network(Provider.of<CartModel>(context).items[i].productImageName, width: 100),
//                  ),
//                  Expanded(
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        SizedBox(height: 8,),
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Text(Provider.of<CartModel>(context).items[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
//                              ),
//                            ),
//                            GestureDetector(
//                              onTap: (){
//                                Provider.of<CartModel>(context).delete(Provider.of<CartModel>(context).items[i]);
//                              },
//                              child: Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Icon(Icons.delete_outline,color: Colors.red,),
//                              ),
//                            )
//                          ],
//                        ),
//
//                        SizedBox(height: 8,),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Text(Provider.of<CartModel>(context).items[i].unitQuantity,style: TextStyle(fontSize: 14,color: Colors.grey),),
//                        ),
//                        SizedBox(height: 4,),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 10),
//                          child: Row(
//                            children: <Widget>[
//                              Text('Our Price - ',style: kTextSize14,),
//                              Text('${Provider.of<CartModel>(context).items[i].mrp}',style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold),),
//                              Padding(
//                                padding: const EdgeInsets.symmetric(horizontal: 10),
//                                child: Text('${Provider.of<CartModel>(context).items[i].ourPrice} ₹',style: TextStyle(fontSize: 14,color:Colors.green[900],fontWeight: FontWeight.bold),),
//                              ),
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 12,),
//
//                      ],
//                    ),
//                  )
//
//                ],
//              ),
//              //QuantityRow(),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  Container(
//                    child: Row(
//                      children: <Widget>[
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('-',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          onTap:   (){
//                            int count =1;
//
//                              if(count>=1){
//                                count--;
// //                                Provider.of<CartModel>(context).addCount(count);
// //                                print(Provider.of<CartModel>(context).countItem);
//                                Provider.of<CartModel>(context).items[i].countItems.add(count);
// //                                Provider.of<CartModel>(context).addCartCount(CartCount(count));
// //                                print(Provider.of<CartModel>(context).itemCartCount);
//
//                                //Provider.of<CartModel>(context).addCount(count);
// //                      finalPrice = widget.price * count;
// //                      print(finalPrice);
// //                      Cart(price: finalPrice,);
//                                //Navigator.pop(context,finalPrice);
//                                //Cart(quantity: count,);
//
//                              }
//
//                          },
//                        ),
//                        Container(
//                          width: 50,
//                          height: 30,
//                          decoration: BoxDecoration(
//                            border: Border.all(width: 1,color: Colors.indigoAccent),
//
//                          ),
//                          child: Center(child: Text('${Provider.of<CartModel>(context).countItem}',style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),)),
//                        ),
//                        GestureDetector(
//                          child: Container(
//                            width: 40,
//                            height: 30,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
//                                color: Colors.indigoAccent
//                            ),
//                            child: Center(child: Text('+',style: TextStyle(fontSize: 14,color: Colors.white),)),
//                          ),
//                          //onTap: onTap;
//
//                          onTap: (){
//
//                              int count =1;
//                              if(count<100){
//                                count++;
// //                                Provider.of<CartModel>(context).addCartCount(CartCount(count));
// //                                print(Provider.of<CartModel>(context).itemCartCount);
// //                                Provider.of<CartModel>(context).addCount(count);
// //                                print(Provider.of<CartModel>(context).countItem);
//                                Provider.of<CartModel>(context).items[i].countItems.add(count);
//                                print(Provider.of<CartModel>(context).items[i].countItems);
//
//                              }
//
//                          },
//                        ),
//                        SizedBox(width: 20,)
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//
//              SizedBox(height: 10,),
//            ],
//          ),
//        ),
//      ));
//    }
//    return newContainer;
//  }
//
//            Expanded(
// //              child: ListView(
// //                children: categoryProductsContainer(),
// //              ),
//            ),
//
//
// List<Widget> finalProductList() {
//    List<Container> newContainer =[];
//    for(int i=0;i<Provider.of<CartModel>(context).itemCount;i++){
//      newContainer.add(Container(
//        color: Colors.white,
//        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
//        child: Row (
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            //Icon(categoryList[i].iconCategory,size: 40,),
//            Expanded(
//              flex: 2,
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text(Provider.of<CartModel>(context).items[i].productName,style: TextStyle(fontSize: 14,color: Colors.indigo,fontWeight: FontWeight.bold),),
//              ),
//            ),
//
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text(Provider.of<CartModel>(context).items[i].unitQuantity,style: TextStyle(color: Colors.black,fontSize: 14),),
//              ),
//            ),
//
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text('${Provider.of<CartModel>(context).items[i].ourPrice}',style: kTextSize14,),
//              ),
//            ),
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 10),
//                child: Text('${double.parse(Provider.of<CartModel>(context).items[i].ourPrice)*double.parse(Provider.of<CartModel>(context).items[i].ourPrice)}',style: TextStyle(color: Colors.green[900],fontSize: 14,fontWeight: FontWeight.bold),),
//              ),
//            )
//
//          ],
//        ),
//      ));
//    }
//    return newContainer;
//  }


//caueosol class
// final List<Widget> imageSliders = imgList.map((item) => Container(
//
//   child: Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         child: Stack(
//           children: <Widget>[
//             Image.network(item, fit: BoxFit.cover, width: 1000.0),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   'No. ${imgList.indexOf(item)} image',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//     ),
//   ),
// )).toList();

// int itemsLength;
//
// Future<int> fetchLengthFromDatabase() async {
//   var dbHelper = DatabaseHelperCart();
//   int cart = await dbHelper.getCount();
//   setState(() {
//     itemsLength = cart;
//   });
//   return cart;
// }

// @override
// void initState() {
//   super.initState();
//   fetchLengthFromDatabase();
// }

// Future<List<CartList>> fetchProductFromDatabase() async {
//   var dbHelper = DatabaseHelperCart();
//   List<CartList> cartList = await dbHelper.getNoteList();
//   for (int i = 1; i < cartList.length; i++) {
//     String pName = cartList[i].productName;
//     double rate = double.parse(cartList[i].mrp);
//     double quantity = double.parse(cartList[i].quantity);
//     double amount =
//         double.parse(cartList[i].quantity) * double.parse(cartList[i].mrp);
//
//     Provider.of<CartModel>(context).add(CheckOutList(
//         productName: pName, rate: rate, quantity: quantity, amount: amount));
//     print(Provider.of<CartModel>(context).itemCount);
//     print(cartList);
//   }
//   return cartList;
// }





//
// Future<List<CategoryList>> getCategories(index) async {
//   print('/////////////////////////////?????????');
//   final res =
//       await http.get("http://192.168.43.143:8081/api/categories/$index/20");
//   print("<<<<<<<<<<<<<<<<<<<<<<<<<");
//   if (res.statusCode == 200) {
//     print('>>>>>>>>>>>>>>>>$res');
//     var data = json.decode(res.body);
//     var d = res.body;
//     int r = d.length;
//     print('$r????????<<<<<');
//     List catData = [];
//     for (int i = 0; i <= r; i++) {
//       var rest = data[i]['categoryName'];
//       catData.add(rest);
//
//       // rest = data['categoryName'] as List;
//       print('$rest//////////');
//     }
//     print('/??///???$catData');
//     //data1 = data['categoryName'];
//     //var data2 = data['data'];
//     //Uint8List imageFile = data2;
//     //print('$data2//////////');
//     // print('$imageFile//////////');
//     // var rest = data['categoryName'] as List;
//     usersdata = catData
//         .map<CategoryList>((json) => CategoryList.fromJson(json))
//         .toList();
//     print('$usersdata>>>><<<<<<>>>>><<<<<');
//     return usersdata;
//   } else {
//     print('?????????????????????????????????');
//     throw Exception('Failed to fetch data');
//   }
// }


// static final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];


// final List<Widget> imageSliders = imgList.map((item) => Container(
//
//   child: Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         child: Image.network(item, fit: BoxFit.cover, width: 1000.0)
//     ),
//   ),
// )).toList();



// Toast.show(
// "${categoryProducts[i].productName} added to Cart",
// context,
// duration: Toast.LENGTH_SHORT,
// gravity: Toast.CENTER);