import 'dart:async';
import 'dart:convert';
//import 'dart:io';
//import 'package:http/http.dart';
//import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/AdvertiseResponse.dart';
//import 'package:async/async.dart';
import 'package:http/http.dart';


class AdvertiseApi{
  static Future<AdvertiseResponse> getAdvertisements()async{
    String url = BASE_URL+"api/Advertisements/List";
    print(url);
    Response response = await http.post(Uri.parse(url));
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return AdvertiseResponse.fromJson(jsonResponse);
  }
}