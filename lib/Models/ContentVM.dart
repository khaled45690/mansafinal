
import 'package:shared_preferences/shared_preferences.dart';

class ContentVM {
    int Id;
    String key;
    String ValueAr="";
    String ValueEn="";
    // int status;
    // String token;
    // String updated_at;
    // int view ;
    // bool follow = false ;
    // int numProduct ;

    ContentVM({this.Id,this.key, this.ValueAr, this.ValueEn});

    factory ContentVM.fromJson(Map<String, dynamic> json) {
      print("start fromjson 2222222222 ");
        return ContentVM(
            Id: int.parse("${json['Id']}"), 
            key: json['key'], 
            ValueAr: json['ValueAr'], 
            ValueEn: json['ValueEn'],
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Id'] = this.Id;
        data['key'] = this.key;
        data['ValueAr'] = this.ValueAr;
        data['ValueEn'] = this.ValueEn;
        return data;
    }
}
Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

Future<bool> saveContent(ContentVM content) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // await prefs.setInt("code", user.code);
        await prefs.setInt("Id", content.Id);
        await prefs.setString("key", content.key);
        await prefs.setString("ValueAr", content.ValueAr);
        await prefs.setString("ValueEn", content.ValueEn);
        return true ;
    }catch(Excption){
        print("save to shared faild   :  $Excption");
        return false ;
    }
}

Future< ContentVM > getContent () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return new ContentVM(
        // id: prefs.getInt("userId"),
        Id: prefs.getInt("Id"),
        key: prefs.getString("key"),
        ValueAr: prefs.getString("ValueAr"),
        ValueEn: prefs.getString("ValueEn"),
    );

}