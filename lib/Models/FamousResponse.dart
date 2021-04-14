
import 'ContactUs.dart';
import 'ContentVM.dart';
import 'FamousVM.dart';
import 'OfferVM.dart';
import 'UserVM.dart';


class FamousResponse {
    int code;
    String message;
    List<FamousVM> data;

    FamousResponse({this.code, this.message, this.data});

    factory FamousResponse.fromJson(Map<String, dynamic> json) {
        return FamousResponse(
            // errors: json['errors'], 
            message: json['message'], 
            code: int.parse("${json['code']}"), 
            data:json['data'] == null ?null: (json['data'] as List).map((i) => FamousVM.fromJson(i)).toList(),
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