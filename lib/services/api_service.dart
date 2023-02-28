import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  
  Future getCurrentPrice (String url) async{
    try {
     http.Response response =  await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("000000000000000000000000000000000000000000000000000000000 ${response.reasonPhrase}");
      }
    }catch (e){
      print("1111111111111111111111111111111111111111111111111111111111111111 ${e.toString()}");
    }
  }


  Future postCurrentPrice (String url) async{
    try {
      http.Response response =  await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.reasonPhrase);
      }
    }catch (e){
      print(e.toString());
    }
  }
  
}