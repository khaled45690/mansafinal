import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mansaapp/Constants/strings.dart';
import 'package:http/http.dart';
import 'package:mansaapp/Models/ShoppingCartResponse.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';

class ShoppingCartApi {
  static Future<ShoppingCartResponse> getShoppingCarForUser(
      String userId) async {
    String url = BASE_URL + "api/ShoppingCart/ListById?UserId=$userId";
    print(url);
    var myData = {"UserId": userId};
    var bb = json.encode(myData);

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http.post(Uri.parse(url), headers: header, body: bb);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ShoppingCartResponse.fromJson(jsonResponse);
  }

  static Future<ShoppingCartResponse> addToShoppingCar(
      ShoppingCartVM obj) async {
    String url = BASE_URL + "api/ShoppingCart/Create";
    print(url);
    print(obj.UserId);
    print(obj.Youtube);
    print(obj.Facebook);
    print(obj.NameEn);
    print(obj.Phone1);
    print(obj.Snapshat);
    print(obj.ServiceId);
    print(obj.Twitter);
    print(obj.Instagram);
    print(obj.Color1);
    print(obj.Color2);
    print("Others------");
    print(obj.ViewNumbers);
    print(obj.Age);
    //print(obj.Duration);
    var from = null;
    var to = null;
    if (obj.ServiceId != 7) {
    } else {
      from = obj.FromDay + "-" + obj.FromMonth + "-" + obj.FromYear;
      to = obj.ToDay + "-" + obj.ToMonth + "-" + obj.ToYear;
      print(from);
      print(to);
      print(obj.socials);
    }

    // print(obj.Discount);
    // print(obj.District);
    // print(obj.Sector);
    // print(obj.Country);
    // print(obj.City);
    // print(obj.socials);
    var myData = {
      "UserId": obj.UserId,
      "ServiceId": obj.ServiceId,
      "numberOfCameras": obj.numberOfCameras,
      "droneUsages": obj.droneUsages,
      "locationVideo": obj.locationVideo,
      "videoDuration": obj.videoDuration,
      "NameAr": obj.NameAr,
      "NameEn": obj.NameEn,
      "Color1": obj.Color1,
      "Color2": obj.Color2,
      "Color3": obj.Color3,
      "Description": obj.Description,
      "Phone1": obj.Phone1,
      "Phone2": obj.Phone2,
      "Email": obj.Email,
      "Facebook": obj.Facebook,
      "Twitter": obj.Twitter,
      "Instagram": obj.Instagram,
      "Snapshat": obj.Snapshat,
      "Youtube": obj.Youtube,
      "ViewNumbers": obj.ViewNumbers == null ? 0 : obj.ViewNumbers,
      "Age": obj.Age,
      "Duration": obj.Duration,
      "FromDateTxt": from,
      "ToDateTxt": to,
      "Discount": obj.Discount,
      "District": obj.District,
      "Sector": obj.Sector,
      "Country": obj.Country,
      "City": obj.City,
      "socials": obj.socials,
      "famous": obj.famous,
      "Price": obj.Price,
      "filesIds": obj.filesIds,
      "filesIds2": obj.filesIds2,
      "longitude": obj.longitude,
      "latitude": obj.latitude,
      "AddressForAdvertise": obj.AddressForAdvertise
    };
    print("myData");
    print(myData);
    var bb = json.encode(myData);

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http.post(Uri.parse(url), headers: header, body: bb);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return ShoppingCartResponse.fromJson(jsonResponse);
  }
}
