import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkData {
  final String url;
  NetworkData({this.url});

  Future getNetworkData() async{
    http.Response response= await http.get('http://192.168.43.23:8081/api/user/a2c03811-8081-4ef2-b622-adbccb4893f6');
    if(response.statusCode==200){
      String data= response.body;
      print(jsonDecode(data));
      return jsonDecode(data);


    }else{
      print(response.statusCode);
    }
  }
}