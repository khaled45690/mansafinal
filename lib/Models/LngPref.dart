
import 'UserVM.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LngPref {
    // bool errors;
    bool isEnglish=true;

    LngPref({this.isEnglish});

    factory LngPref.fromJson(Map<String, dynamic> json) {
        return LngPref(
            // errors: json['errors'], 
            isEnglish: json['isEnglish']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['isEnglish'] = this.isEnglish;
        return data;
    }
}


Future<bool> saveLngPref(LngPref user) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // await prefs.setInt("code", user.code);
        await prefs.setBool("isEnglish", user.isEnglish);
        return true ;
    }catch(Excption){
        print("save to shared faild   :  $Excption");
        return false ;
    }
}

Future< LngPref > getLngPref () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return new LngPref(
        // id: prefs.getInt("userId"),
        isEnglish: prefs.getBool("isEnglish")==null?true:prefs.getBool("isEnglish")

    );

}

