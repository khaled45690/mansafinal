
import 'package:shared_preferences/shared_preferences.dart';

class ServiceVM {
    int Id;
    String NameAr;
    String NameEn;
    double Price;
    int ShowOrder;

    ServiceVM({this.Id,this.NameAr, this.NameEn,this.Price,this.ShowOrder});

    factory ServiceVM.fromJson(Map<String, dynamic> json) {
        return ServiceVM(
            Id: int.parse("${json['Id']}"), 
            NameAr: json['NameAr'], 
            NameEn: json['NameEn'], 
            Price: double.parse("${json['Price']}"),
            ShowOrder: int.parse("${json['ShowOrder']}"),
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['NameAr'] = this.NameAr;
        data['NameEn'] = this.NameEn;
        data['Price'] = this.Price;
        data['ShowOrder'] = this.ShowOrder;
        
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

