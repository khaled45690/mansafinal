
import 'package:shared_preferences/shared_preferences.dart';

class OfferVM {
    int Id;
    String TitleAr;
    String TitleEn;
    String Image;
    double Price;
    double Discount;
    int ShowOrder;
    String OfferDate;
    String Description;
    String DescriptionAr;

    OfferVM({this.Id,this.TitleAr, this.TitleEn, this.Image,this.Price,this.Discount,this.ShowOrder,this.OfferDate,this.Description,this.DescriptionAr});

    factory OfferVM.fromJson(Map<String, dynamic> json) {
        return OfferVM(
            Id: int.parse("${json['Id']}"), 
            TitleAr: json['TitleAr'], 
            TitleEn: json['TitleEn'], 
            Image: json['Image'],
            Description:json['Description']==null?"":json['Description'],
            DescriptionAr:json['DescriptionAr']==null?"":json['DescriptionAr'],
            Price: double.parse("${json['Price']}"),
            Discount: double.parse("${json['Discount']}"),
            ShowOrder: int.parse("${json['ShowOrder']}"),
            OfferDate: json['OfferDate']==null?"null":json['OfferDate'],
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['TitleAr'] = this.TitleAr;
        data['TitleEn'] = this.TitleEn;
        data['Image'] = this.Image;
        data['Price'] = this.Price;
        data['Discount'] = this.Discount;
        data['ShowOrder'] = this.ShowOrder;
        data['OfferDate'] = this.OfferDate;
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

