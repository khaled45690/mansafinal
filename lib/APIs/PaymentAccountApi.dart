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
import 'package:mansaapp/Models/OrderDataResponse.dart';
import 'package:mansaapp/Models/PaymentAcccountResponse.dart';
import 'package:mansaapp/Models/PaymentAccountResponseV2.dart';
import 'package:mansaapp/Models/PaymentAccountVM.dart';


class PaymentAccountApi{
  static Future<PaymentAccountResponse> getPaymentAccounts()async{
    String url = BASE_URL+"api/PaymentAccont/List";
    print(url);
    Response response = await http.post(Uri.parse(url));
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return PaymentAccountResponse.fromJson(jsonResponse);
  }
  static Future<PaymentAccountResponseV2>createPayment(CreatePaymentVM obj)async{
    String url = BASE_URL+"api/PaymentAccont/Create";
    print(url);
    print(obj.userId);
    var myData = {
  "userId": obj.userId,
  "phone1":obj.phone1,
  "phone2":obj.phone2,
  "email":obj.email,
  "customerName":obj.customerName,
  "accountTransfer":obj.accountTransfer,
  "accountTransferTo":obj.accountTransferTo,
  "nameWhoTransfer":obj.nameWhoTransfer,
  "bankName":obj.bankName,
  "Orderfile":obj.Orderfile
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
    return PaymentAccountResponseV2.fromJson(jsonResponse);
  }

  static Future<OrderDataResponse> getMyOrders(String userId , String lang)async{
    String url = BASE_URL+"api/PaymentAccont/MyOrders?userId=$userId&lang=$lang";
    print(url);
    Response response = await http.post(Uri.parse(url));
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return OrderDataResponse.fromJson(jsonResponse);
  }
}