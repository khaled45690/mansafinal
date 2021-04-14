
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsVM {
    String facebook;
    String website;
    String email="";
    String phone="";
    ContactUsVM({this.facebook,this.website, this.email, this.phone});

    factory ContactUsVM.fromJson(Map<String, dynamic> json) {
        return ContactUsVM(
            facebook: json['facebook'], 
            website: json['website'], 
            email: json['email'], 
            phone: json['phone'],
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['facebook'] = this.facebook;
        data['website'] = this.website;
        data['email'] = this.email;
        data['phone'] = this.phone;
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}
