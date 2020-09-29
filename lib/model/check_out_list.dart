class CheckOutList {

  final String productName;
  final double rate;
  final double quantity;
  final double amount;

  CheckOutList({this.rate,this.productName,this.quantity,this.amount});

  List<CheckOutList> getCheckOutList(){
    List<CheckOutList> checkOutList = [];
    return checkOutList;
  }

}