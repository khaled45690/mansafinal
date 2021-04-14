
import 'package:mansaapp/Models/OrderDataVM.dart';

import 'ContactUs.dart';
import 'ContentVM.dart';
import 'OfferVM.dart';
import 'UserVM.dart';


class OrderDataResponse {
    int code;
    String message;
    List<OrderDataVM> data;

    OrderDataResponse({this.code, this.message, this.data});

    factory OrderDataResponse.fromJson(Map<String, dynamic> json) {
        return OrderDataResponse(
            // errors: json['errors'], 
            message: json['message'], 
            code: int.parse("${json['code']}"), 
            data:json['data'] == null ?null: (json['data'] as List).map((i) => OrderDataVM.fromJson(i)).toList(),
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