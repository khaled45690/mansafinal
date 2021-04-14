
import 'package:mansaapp/Models/PlatformVM.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartVM {
    int Id ;
    int ServiceId ;
    String numberOfCameras;
    String droneUsages;
    String locationVideo;
    String videoDuration;
    String UserId ;
    String NameAr ;
    String NameEn ;
    String Color1 ;
    String Color2 ;
    String Color3 ;
    String Description ;
    String Phone1 ;
    String Phone2 ;
    String Email ;
    String Facebook ;
    String Twitter ;
    String Instagram ;
    String Snapshat ;
    String Youtube ;
    String Country;
    String City;
    String Sector;
    String District;
    String Discount;
    String FromDay=null;
    String FromMonth;
    String FromYear;
    String ToDay=null;
    String ToMonth;
    String ToYear;
    List<int>socials=null;
    List<int>famous=null;
    int ViewNumbers=0;
    int Duration=0;
    int Age=0;
    int StartAge = 0;
    double Price=0;
    String filesIds;
    String filesIds2;
    String latitude;
    String longitude;
    String AddressForAdvertise;
    List<PlatformVM>platforms;
    ShoppingCartVM({this.Id,this.ServiceId, this.UserId, this.NameAr,this.NameEn,this.Color1,this.Color2,
    this.Color3 , this.Description , this.Phone1, this.Phone2 , this.Email , this.Facebook , this.Twitter , this.Instagram,
    this.Snapshat , this.Youtube , this.Country , this.City , this.Sector , this.District , this.Discount,
    this.FromDay , this.FromMonth,this.FromYear,this.ToDay,this.ToMonth,this.ToYear , this.socials,this.famous,
    this.ViewNumbers , this.Duration , this.Age , this.StartAge , this.Price,this.filesIds,this.filesIds2,this.platforms ,
     this.latitude ,this.longitude,this.AddressForAdvertise });


    factory ShoppingCartVM.fromJson(Map<String, dynamic> json) {
        return ShoppingCartVM(
            Id: int.parse("${json['Id']}"), 
            ServiceId: int.parse("${json['ServiceId']}"), 
            UserId: json['UserId'], 
            NameAr: json['NameAr'],
            NameEn: json['NameEn'],
            Color1: json['Color1'],
            Color2: json['Color2'],
            Color3: json['Color3'],
            Description: json['Description'],
            Phone1: json['Phone1'],
            Phone2: json['Phone2'],
            Email: json['Email'],
            Facebook: json['Facebook'],
            Twitter: json['Twitter'],
            Instagram: json['Instagram'],
            Snapshat: json['Snapshat'],
            Youtube: json['Youtube'],
            Price: json['Price'],
            latitude: json['latitude'],
            longitude: json['longitude'],
            AddressForAdvertise:json['AddressForAdvertise']
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['ServiceId'] = this.ServiceId;
        data['UserId'] = this.UserId;
        data['NameAr'] = this.NameAr;
        data['NameEn'] = this.NameEn;
        data['Color1'] = this.Color1;
        data['Color2'] = this.Color2;
        data['Color3'] = this.Color3;
        data['Description'] = this.Description;
        data['Phone1'] = this.Phone1;
        data['Phone2'] = this.Phone2;
        data['Email'] = this.Email;
        data['Facebook'] = this.Facebook;
        data['Twitter'] = this.Twitter;
        data['Instagram'] = this.Instagram;
        data['Snapshat'] = this.Snapshat;
        data['Youtube'] = this.Youtube;
        data['Price'] = this.Price;
        data['longitude']=this.longitude;
        data['latitude']=this.latitude;
        data['AddressForAdvertise']=this.AddressForAdvertise;
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

