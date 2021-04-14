
import 'package:mansaapp/Models/Advertise.dart';
import 'package:mansaapp/Models/PlatformVM.dart';
import 'package:mansaapp/Models/ServiceVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';

import 'ContactUs.dart';
import 'ContentVM.dart';
import 'OfferVM.dart';
import 'UserVM.dart';


class PlatformResponse {
    int code;
    String message;
    List<PlatformVM> data;

    PlatformResponse({this.code, this.message, this.data});

    factory PlatformResponse.fromJson(Map<String, dynamic> json) {
        return PlatformResponse(
            // errors: json['errors'], 
            message: json['message'], 
            code: int.parse("${json['code']}"), 
            data:json['data'] == null ?null: (json['data'] as List).map((i) => PlatformVM.fromJson(i)).toList(),
        );
    }

    // Map<String, dynamic> toJson() {
    //     final Map<String, dynamic> data = new Map<String, dynamic>();
    //     //data['message'] = this.message;
    //     data['code'] = this.code;
    //     if (this.data != null) {
    //         data['data'] = this.data.toJson();
    //     }
    //     return data;
    // }
}