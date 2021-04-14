
import 'package:shared_preferences/shared_preferences.dart';

class FamousVM {
    int Id;
    String NameAr;
    String NameEn;
    String Image;
    int ShowOrder;
    double Followers;
    int Rate;
    int SocialMediaId;
    double Price;
    bool isCheck;

    FamousVM({this.Id,this.NameAr, this.NameEn, this.Image,this.Price,this.ShowOrder,this.Followers,this.Rate , this.SocialMediaId , this.isCheck});

    factory FamousVM.fromJson(Map<String, dynamic> json) {
        return FamousVM(
            Id: int.parse("${json['Id']}"), 
            NameAr: json['NameAr'], 
            NameEn: json['NameEn'], 
            Image: json['image'],
            isCheck: json['isCheck']==null?false:json['isCheck'],
            Followers:double.parse("${json['Followers']}"),
            Rate:int.parse("${json['Rate']}"),
            Price: double.parse("${json['Price']}"),
            ShowOrder: int.parse("${json['ShowOrder']}"),
            SocialMediaId: int.parse("${json['SocialMediaId']}"),
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['NameAr'] = this.NameAr;
        data['NameEn'] = this.NameEn;
        data['image'] = this.Image;
        data['Price'] = this.Price;
        data['ShowOrder'] = this.ShowOrder;
        data['Rate'] = this.Rate;
        data['SocialMediaId']=this.SocialMediaId;
        
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

