
class Sign {
  final String email;
  final String password;
  final String customerId;
  final String firstName;
  final String lastName;
  final String addressLine1;
  final String addressLine2;
  final  String city;
  final  String area;
  final  String mobileNumber;
  final  String landmark;
  final  String pincode;

  Sign({this.email, this.password,this.customerId,this.mobileNumber,this.area,this.landmark,this.firstName,this.lastName,this.city,this.addressLine1,this.addressLine2,this.pincode});

  factory Sign.fromJson(Map<String, dynamic> json) {
    return Sign(
      email: json['email'],
      password: json['password'],
      customerId: json['customerId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      city: json['city'],
      area: json['area'],
      mobileNumber: json['mobileNumber'],
      landmark: json['landmark'],
      pincode: json['pincode'],
    );
  }
}