import 'dart:async';
import 'dart:convert';
//import 'dart:io';
//import 'package:http/http.dart';
//import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/FamousResponse.dart';
//import 'package:async/async.dart';
import 'package:http/http.dart';


class FamousApi{
  static Future<FamousResponse> selectAll()async{
    String url = BASE_URL+"api/Famous/List";
    print(url);
    Response response = await http.post(Uri.parse(url));
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return FamousResponse.fromJson(jsonResponse);
  }
}