import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class LoginApi{

  static Future loginapi({required String email,required String pass})async{
    Uri url= Uri.parse("https://cit-ecommerce-codecanyon.bandhantrade.com/api/login");
    log(";;;;;;;;;;;;;;;");
    var body ={
      "email_phone":email,
      "password":pass
    };
    var response = await http.post(url,body: body);
    log(">>>>>>>>>>>>>>>>>");
    log("${response.statusCode}");
    if(response.statusCode==200){
      var data =jsonDecode(response.body);
      String token =data['token'] ?? "null";
      log("token:$token");
      return data;
    }
  }
}