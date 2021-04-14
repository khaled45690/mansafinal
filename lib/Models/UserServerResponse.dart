
import 'UserVM.dart';

class UserServerResponse {
    // bool errors;
    int code;
    String message;
    UserVM data;

    UserServerResponse({this.message, this.code, this.data});

    factory UserServerResponse.fromJson(Map<String, dynamic> json) {
        return UserServerResponse(
            // errors: json['errors'], 
            message: json['message'], 
            code: json['code'], 
            data: json['data'] != null ? UserVM.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['code'] = this.code;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}