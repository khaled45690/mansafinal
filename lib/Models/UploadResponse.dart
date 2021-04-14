
import 'package:mansaapp/Models/Advertise.dart';
import 'package:mansaapp/Models/ServiceVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';

import 'ContactUs.dart';
import 'ContentVM.dart';
import 'OfferVM.dart';
import 'UserVM.dart';


class UploadResponse {
    int code;
    String message;
    String data;

    UploadResponse({this.code, this.message, this.data});

    factory UploadResponse.fromJson(Map<String, dynamic> json) {
        return UploadResponse(
            // errors: json['errors'], 
            message: json['message'], 
            code: int.parse("${json['code']}"), 
            data:json['data'],
            // data:json['data'] == null ?null: (json['data'] as List).map((i) => ServiceVM.fromJson(i)).toList(),
        );
    }
}


class UploadResponse2 {
    int code;
    String message;
    String data;

    UploadResponse2({this.code, this.message, this.data});

    factory UploadResponse2.fromJson(Map<String, dynamic> json) {
        return UploadResponse2(
            // errors: json['errors'], 
            message: json['message'], 
            code: int.parse("${json['code']}"), 
            data:json['data'],
            // data:json['data'] == null ?null: (json['data'] as List).map((i) => ServiceVM.fromJson(i)).toList(),
        );
    }
}