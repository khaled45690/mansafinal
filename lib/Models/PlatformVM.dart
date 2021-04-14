
import 'package:shared_preferences/shared_preferences.dart';

class PlatformVM {
    int Id;
    String platformName;
    int viewsNumber;
    double viewsPrice;
    int durationNumber;
    double durationPrice;

    PlatformVM({this.Id,this.platformName, this.viewsNumber, this.viewsPrice,this.durationNumber,this.durationPrice});

    factory PlatformVM.fromJson(Map<String, dynamic> json) {
        return PlatformVM(
            Id: int.parse("${json['Id']}"), 
            platformName: json['platformName'], 
            viewsNumber: json['viewsNumber'], 
            viewsPrice: json['viewsPrice'],
            durationNumber:json['durationNumber'],
            durationPrice: double.parse("${json['durationPrice']}"),
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['platformName'] = this.platformName;
        data['viewsNumber'] = this.viewsNumber;
        data['viewsPrice'] = this.viewsPrice;
        data['durationNumber'] = this.durationNumber;
        data['durationPrice'] = this.durationPrice;
        
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

