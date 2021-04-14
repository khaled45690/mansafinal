
import 'package:shared_preferences/shared_preferences.dart';

class UserVM {
    String user_Id;
   // String code;
    String userName;
    String email;
    String image;
    String phone;
    // int status;
    // String token;
    // String updated_at;
    // int view ;
    // bool follow = false ;
    // int numProduct ;

    UserVM({this.user_Id, this.userName, this.email, this.image,this.phone});

    factory UserVM.fromJson(Map<dynamic, dynamic> json) {
        return UserVM(
           // code: json['code'], 
            user_Id: json['user_Id'], 
            email: json['email'], 
            userName: json['userName'], 
            phone: json['phone'], 
            image: json['image'], 
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
       // data['code'] = this.code;
        data['user_Id'] = this.user_Id;
        data['email'] = this.email;
        data['userName'] = this.userName;
        data['phone'] = this.phone;
        data['image'] = this.image;
        return data;
    }
}

//local storage functions

Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

Future<bool> saveUser(UserVM user) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // await prefs.setInt("code", user.code);
   //     await prefs.setString("code", user.code);
        await prefs.setString("user_Id", user.user_Id);
        await prefs.setString("email", user.email);
        await prefs.setString("userName", user.userName);
        await prefs.setString("phone", user.phone);
        await prefs.setString("image", user.image);
        return true ;
    }catch(Excption){
        print("save to shared faild   :  $Excption");
        return false ;
    }
}

Future< UserVM > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return new UserVM(
        // id: prefs.getInt("userId"),
  //      code: prefs.getString("code"),
        user_Id: prefs.getString("user_Id"),
        email: prefs.getString("email"),
        userName: prefs.getString("userName"),
        phone: prefs.getString("phone"),
        image: prefs.getString("image"),

    );

}