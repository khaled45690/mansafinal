
import 'package:mansaapp/Models/Advertise.dart';
import 'package:mansaapp/Models/ServiceVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';

import 'ContactUs.dart';
import 'ContentVM.dart';
import 'OfferVM.dart';
import 'UserVM.dart';


class ServiceResponse {
    int code;
    String message;
    List<ServiceVM> data;

    ServiceResponse({this.code, this.message, this.data});

    factory ServiceResponse.fromJson(Map<String, dynamic> json) {
        return ServiceResponse(
            // errors: json['errors'], 
            message: json['message'], 
            code: int.parse("${json['code']}"), 
            data:json['data'] == null ?null: (json['data'] as List).map((i) => ServiceVM.fromJson(i)).toList(),
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