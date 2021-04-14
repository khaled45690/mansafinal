import 'dart:async';
import 'dart:convert';
//import 'dart:io';
//import 'package:http/http.dart';
//import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/ContactUsResponse.dart';
import 'package:mansaapp/Models/ContentResponse.dart';
//import 'package:async/async.dart';



class ContentApi{
  
  static Future<ContentResponse> getAboutApp()async{
    String url = BASE_URL+"api/Content/AboutApp";
    print(url);
    Map<String,String>header={
      'Content-type': 'application/json',
      'Accept' : 'application/json'
    };
    var response = await http.post(
        Uri.parse(url),
      headers: header
    );

    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ContentResponse.fromJson(jsonResponse);
  }
  static Future<ContentResponse> getTerms()async{
    String url = BASE_URL+"api/Content/TermsAndConditions";
    print(url);
    Map<String,String>header={
      'Content-type': 'application/json',
      'Accept' : 'application/json'
    };
    var response = await http.post(
        Uri.parse(url),
      headers: header
    );

    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ContentResponse.fromJson(jsonResponse);
  }

  static Future<ContentResponse> getAppLink()async{
    String url = BASE_URL+"api/Content/AppLink";
    print(url);
    Map<String,String>header={
      'Content-type': 'application/json',
      'Accept' : 'application/json'
    };
    var response = await http.post(
        Uri.parse(url),
      headers: header
    );

    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ContentResponse.fromJson(jsonResponse);
  }
  static Future<ContactUsResponse> getContactUs()async{
    String url = BASE_URL+"api/Content/ContactUs";
    print(url);
    Map<String,String>header={
      'Content-type': 'application/json',
      'Accept' : 'application/json'
    };
    var response = await http.post(
        Uri.parse(url),
      headers: header
    );

    print(response.statusCode);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ContactUsResponse.fromJson(jsonResponse);
  }
  }