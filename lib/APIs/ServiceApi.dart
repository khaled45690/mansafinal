import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:http/http.dart';
import 'package:mansaapp/Models/PlatformResponse.dart';
import 'package:mansaapp/Models/ServiceResponse.dart';
import 'package:mansaapp/Models/ShoppingCartResponse.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';


class ServiceApi{
  static Future<ServiceResponse> getServices()async{
    String url = BASE_URL+"api/Service/List";
    print(url);
    var myData = {
    };
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header
    );
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ServiceResponse.fromJson(jsonResponse);
  }


  static Future<PlatformResponse> getEMarketingPrices()async{
    String url = BASE_URL+"api/Platform/List";
    print(url);
    var myData = {
    };
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header
    );
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return PlatformResponse.fromJson(jsonResponse);
  }

}