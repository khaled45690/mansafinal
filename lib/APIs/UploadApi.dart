import 'dart:async';
import 'dart:convert';
import 'dart:io';
//import 'dart:io';
//import 'package:http/http.dart';
//import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/AdvertiseResponse.dart';
//import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:mansaapp/Models/UploadResponse.dart';
import 'package:mansaapp/ui/SignupScreen.dart';
import 'package:path/path.dart';

import 'dart:async';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadApi{
  static Future<UploadResponse2> upload_Base64(File file)async{
    String url = BASE_URL+"api/UploadFile/SaveFile";
    print(url);
    print(file);
    if (file == null) print("Null => No File");
   String base64Image = base64Encode(file.readAsBytesSync());
   String fileName = file.path.split("/").last;
print("base64 : "+base64Image);
  print("FileName : "+fileName);
  print( {
     "FileBase64": base64Image,
     "FileExtention": fileName,
   });
   Response response = await http.post(Uri.parse(url), body: {
     "FileBase64": base64Image,
     "FileExtention": fileName,
   });
    final jsonResponse = json.decode(response.body);
    
    print('After response :     $jsonResponse');
    //upload(file);
    return UploadResponse2.fromJson(jsonResponse);
  }
  static Future<UploadResponse> upload_Base64AndReturnId(File file)async{
    String url = BASE_URL+"api/UploadFile/SaveFileAndRetrnId";
    print(url);
    
    if (file == null) print("Null => No File");
   String base64Image = base64Encode(file.readAsBytesSync());
   String fileName = file.path.split("/").last;
print("base64 : "+base64Image);
  print("FileName : "+fileName);
  print( {
     "FileBase64": base64Image,
     "FileExtention": fileName,
   });
   Response response = await http.post(Uri.parse(url), body: {
     "FileBase64": base64Image,
     "FileExtention": fileName,
   });
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UploadResponse.fromJson(jsonResponse);
  }

  static Future<UploadResponse> upload_Base64AndReturnId2(String base64Image , String fileName)async{
    String url = BASE_URL+"api/UploadFile/SaveFileAndRetrnId";
    print(url);
    
  //   if (file == null) print("Null => No File");
  //  String base64Image = base64Encode(file.readAsBytesSync());
  //  String fileName = file.path.split("/").last;
print("base64 : "+base64Image);
  print("FileName : "+fileName);
  print( {
     "FileBase64": base64Image,
     "FileExtention": fileName,
   });
   Response response = await http.post(Uri.parse(url), body: {
     "FileBase64": base64Image,
     "FileExtention": fileName,
   });
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UploadResponse.fromJson(jsonResponse);
  }


   static Future<UploadResponse2> upload(File imageFile) async {
    print('Tag' + imageFile.path.toString());
    var stream =
    new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();
    // string to uri
    //var uri = Uri.parse("url");
    var uri = Uri.parse(BASE_URL+"api/UploadFile/FileUpload");
    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    // add file to multipart
    request.files.add(multipartFile);
    // send
    var response = await request.send();
    print("reasonPhrase");
    print(response.contentLength);
    print(response.headers);
    print(response.reasonPhrase);
    print(response.request);
    print(response.stream);
    print(response.statusCode);
    String result = "";
    // listen for response
    bool isFinished = false;
    
    response.stream.transform(utf8.decoder).listen((value) {
          result = value;
          print("value");
          print(value);
          print(result);
          
        } , onDone: () {
              }
        );
    
    print("Osama Osama Osama Osama Osama Osama Osama Osama Osama Osama Osama ");
            final jsonResponse = json.decode(result);
              print(jsonResponse.toString());
              print('After response :     $jsonResponse');
              UploadResponse2 obj = UploadResponse2.fromJson(jsonResponse);
                print("Start Return");
                  return UploadResponse2.fromJson(jsonResponse);
    
  }



}