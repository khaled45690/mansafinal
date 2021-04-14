
import 'package:shared_preferences/shared_preferences.dart';

class AdvertiseVM {
    int Id;
    String TitleAr;
    String TitleEn;
    String Image;
    double Price;
    int ShowOrder;
    String AdvertiseDate;
    String Description;
    String DescriptionAr;

    AdvertiseVM({this.Id,this.TitleAr, this.TitleEn, this.Image,this.Price,this.ShowOrder,this.AdvertiseDate,this.Description , this.DescriptionAr});

    factory AdvertiseVM.fromJson(Map<String, dynamic> json) {
        return AdvertiseVM(
            Id: int.parse("${json['Id']}"), 
            TitleAr: json['TitleAr'], 
            TitleEn: json['TitleEn'], 
            Image: json['Image'],
            Description:json['Description']==null?"":json['Description'],
            DescriptionAr:json['DescriptionAr']==null?"":json['DescriptionAr'],
            Price: double.parse("${json['Price']}"),
            ShowOrder: int.parse("${json['ShowOrder']}"),
            AdvertiseDate: json['AdvertiseDate']==null?"null":json['AdvertiseDate'],
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['TitleAr'] = this.TitleAr;
        data['TitleEn'] = this.TitleEn;
        data['Image'] = this.Image;
        data['Price'] = this.Price;
        data['ShowOrder'] = this.ShowOrder;
        data['AdvertiseDate'] = this.AdvertiseDate;
        data['Description']=this.Description;
        data['DescriptionAr']=this.DescriptionAr;
        
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

