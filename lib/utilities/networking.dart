import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkData {

  Future getNetworkData(String url) async{
    http.Response response= await http.get(url);
    print('///////////////////////$response');
    if(response.statusCode==200){
      String data= response.body;
      print('///////////////////////$data>>>>>>>>>>>>>>>>>>>');
      print('${jsonDecode(data)}{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{');
      //return jsonDecode(data);
      return data;


    }else{
      print(response.statusCode);
    }
  }
}