import 'dart:async';
import 'dart:convert';
//import 'dart:io';
//import 'package:http/http.dart';
//import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/ContactUsResponse.dart';
import 'package:mansaapp/Models/ContentResponse.dart';
import 'package:mansaapp/Models/OfferResponse.dart';
//import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class OfferApi{
  static Future<OfferResponse> getOffers()async{
    String url = BASE_URL+"api/offers/List";
    print(url);
    Response response = await http.post(Uri.parse(url));
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return OfferResponse.fromJson(jsonResponse);
  }
}