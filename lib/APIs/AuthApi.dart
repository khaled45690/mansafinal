import 'dart:async';
import 'dart:convert';
//import 'dart:io';
//import 'package:http/http.dart';
//import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/UserResponse.dart';
import 'package:mansaapp/Models/UserVM.dart';
//import 'package:async/async.dart';



class AuthApi{
  
  static Future<UserResponse> login(String email , String password)async{
    String url = BASE_URL+"api/Users/Login";
    print(url);
    print(email);
    print(password);
var myData = {
  "email": email,
  "password": password
};
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
  }



  static Future<UserResponse> socialMediaLogin(String email , String userName , String photoUrl)async{
    String url = BASE_URL+"api/Users/socialMediaLogin";
    print(url);
    print(email);
    print(password);
var myData = {
  "email": email,
  "userName": userName,
  "image":photoUrl
};
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
  }


  static Future<UserResponse> register(String userName,String email , String password , String phone , String imageBaseName)async{
    String url = BASE_URL+"api/Users/Registeration";
    print(url);
    print(email);
    print(password);
    print(imageBaseName);
var myData = {
  "email": email,
  "password": password,
  "phone":phone,
  "userName":userName,
  "image":imageBaseName
};
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
  }

static Future<UserResponse> rememberPass(String email)async{
  String url = BASE_URL+"api/Users/RememberPassword?Email=email";
  print(email);
  var myData = {
  "email":email
};
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
}

static Future<UserResponse> changePassWord(String userId ,String pass )async{
  String url = BASE_URL+"api/Users/changePassWord";
  print(userId);
  var myData = {
  "userId":userId,
  "NewPassword":pass
};
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
}

  static Future<UserResponse> verifyCode(String userId,String email , String first , String second , String third , String fourth)async{
    String url = BASE_URL+"api/Users/VerifyCode";
    print(url);
    print(email);
    print(userId);
    print("$first$second$third$fourth");
var myData = {
  "user_Id": userId,
  "code": "$first$second$third$fourth",
  "email":email
};
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
  }
  
  
  static Future<UserResponse>updateProfile(UserVM model)async{
    String url = BASE_URL+"api/Users/UpdateProfile";
    print(url);
var myData = {
  "UserId":model.user_Id,
  "Name":model.userName,
  "Email":model.email,
  "Phone":model.phone,
  "Image":model.image
  // "Id":model.Id,
  // "Email": model.Email,
  // "PasswordHash": model.PasswordHash,
  // "Phone":model.Phone,
  // "UserName":model.Email,
  // "FullName":model.FullName,
  // "UserImage":model.UserImage,
  // "Address":model.Address,
  // "City":model.City,
  // "Commercial_Register":model.Commercial_Register,
  // "UserType":model.UserType,
  // "Allowbuy":model.Allowbuy,
  // "AllowContractDocument":model.AllowContractDocument,
  // "AllowMarketting":model.AllowMarketting,
  // "AllowPricing":model.AllowPricing,
  // "AllowSell":model.AllowSell,
  // "AllowSellOnMap":model.AllowSellOnMap,
  // "License_Number":model.License_Number
};
print(myData);
var bb = json.encode(myData);

 Map<String,String>header={
  'Content-type': 'application/json',
  'Accept' : 'application/json'
};
 var response = await http.post(
     Uri.parse(url),
      headers: header,
      body: bb
    );

print(response.statusCode);
print(response);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return UserResponse.fromJson(jsonResponse);
  }

  
  
  // static Future<UserServerResponse> registerFirstStep(String phone , String password ,String confirmPassword)async{
  //   String url = BASE_URL+"api/user/register?phone=$phone&password=$password&password_confirmation=$confirmPassword";
  //   print(url);
  //   Response response = await http.post(url);
  //   final jsonResponse = json.decode(response.body);
  //   print(jsonResponse);
  //   return UserServerResponse.fromJson(jsonResponse);
  // }
  // // static Future<UserServerResponse> registerSaveLocation(int userId , LatLng position)async{
  // //   String url = BASE_URL+"api/profile/latLang/$userId?latLang=${position.latitude},${position.longitude}";
  // //   print(url);
  // //   Response response = await http.post(url);
  // //   final jsonResponse = json.decode(response.body);
  // //   print(jsonResponse);
  // //   return UserServerResponse.fromJson(jsonResponse);
  // // }

  // static Future<UserServerResponse> registerGetCode(int userId)async{
  //   String url = BASE_URL+"api/sendCode/$userId";
  //   print(url);
  //   Response response = await http.post(url);
  //   final jsonResponse = json.decode(response.body);
  //   print(jsonResponse);
  //   return UserServerResponse.fromJson(jsonResponse);
  // }

  // static Future<UserServerResponse> registerCheckCode(int userId ,String code )async{
  //   String url = BASE_URL+"api/checkCode/$userId?code=$code";
  //   print(url);
  //   Response response = await http.post(url);
  //   final jsonResponse = json.decode(response.body);
  //   print(jsonResponse);
  //   return UserServerResponse.fromJson(jsonResponse);
  // }

  // static Future<UserServerResponse> getUserData(int userId )async{
  //   String url = BASE_URL+"api/profile/mainInfo/$userId";
  //   print(url);
  //   Response response = await http.get(url);
  //   final jsonResponse = json.decode(response.body);
  //   print(jsonResponse);
  //   return UserServerResponse.fromJson(jsonResponse);
  // }


  // static Future<UserServerResponse> registerAddInfo( int userId,String name , String email , File image )async{
  //   String url = BASE_URL+"api/profile/editInfo/$userId?name=$name&email=$email";
  //   print(url);
  //   Map<String, dynamic> responseJson =  new Map();
  //   if(image ==null){
  //     http.Response response = await http.post(url) ;
  //     responseJson = json.decode(response.body);
  //   }else{
  //     var request = new http.MultipartRequest('POST', Uri.parse(url));
  //     if(image != null ){
  //       var length = await image.length();
  //       final stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
  //       var MultiPartFile = new http.MultipartFile(
  //           'file', stream, length, filename: basename(image.path));
  //       request.files.add(MultiPartFile);
  //     }
  //     final response = await request.send();

  //     await response.stream.transform(utf8.decoder).listen((response) {
  //       print(response);
  //       responseJson = json.decode(response);
  //     }, onError: (error) {
  //       print(error);
  //     });
  //   }
  //   return new UserServerResponse.fromJson(responseJson) ;
  // }
  // static Future<UserServerResponse> editUserInfo( int userId,String name , String email , String phone ,File image )async{
  //   String url = BASE_URL+"api/profile/editInfo/$userId?email=$email&phone=$phone&name=$name";
  //   print(url);
  //   Map<String, dynamic> responseJson =  new Map();
  //   if(image ==null){
  //     http.Response response = await http.post(url) ;
  //     responseJson = json.decode(response.body);
  //   }else{
  //     var request = new http.MultipartRequest('POST', Uri.parse(url));
  //     if(image != null ){
  //       var length = await image.length();
  //       final stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
  //       var MultiPartFile = new http.MultipartFile(
  //           'image', stream, length, filename: basename(image.path));
  //       request.files.add(MultiPartFile);
  //     }
  //     final response = await request.send();

  //     await response.stream.transform(utf8.decoder).listen((response) {
  //       print(response);
  //       responseJson = json.decode(response);
  //     }, onError: (error) {
  //       print(error);
  //     });
  //   }
  //   return new UserServerResponse.fromJson(responseJson) ;
  // }
}