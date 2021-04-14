// import 'dart:async';

// import 'package:mansa/Models/LngPref.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final int LANG_EN = 1;
// final int LANG_AR = 2;

// class Preferences {
//   static SharedPreferences prefs;
//   static final phoneKey = 'Phone';
//   static final passwordKey = 'Password';
//   static final fcmIDkey = 'fcmIDkey';
//   static final userIdKey = 'userID';
//   static final usernameKey = 'username';
//   static final emailKey = 'email';
//   static final imageKey = 'image';
//   static final servicidKey = 'servicid';
//   static final phoneKey_2 = 'order_details_mobile2';
//   static final facebookKey = 'order_details_facebook';
//   static final langKey = 'langID';
//   static bool english = true;
//   LngPref _LngPref=new LngPref();

//   Preferences(){
//     getLngPref().then((lng){
      
//         this._LngPref = lng ;
//         english=lng.isEnglish;
     
//     });
//   }

//   static setLangId(langId) async {
//     langId == LANG_EN ?  english = true : english = false;

//     prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(langKey, langId);
//   }

//   static Future<int> getLangId() async {
//     prefs = await SharedPreferences.getInstance();
//     try {
//       return prefs.getInt(langKey);
//     } catch (exp) {
//       return LANG_EN;
//     }
//   }


//   static Future<bool> isAuthenticated() async {
//     return prefs.getString(phoneKey).isNotEmpty;
//   }

//   setUserData(phone, password) async {
//     prefs = await SharedPreferences.getInstance();
//     prefs.setString(phoneKey, phone);
//     prefs.setString(passwordKey, password);
//   }

//   setUserId(userId) async {
//     await prefs.setInt(userIdKey, userId);
//   }
//   setusername(username) async {
//     await prefs.setString(usernameKey, username);
//   }
//   setemail(email) async {
//     await prefs.setString(emailKey, email);
//   }

//   setimage(image) async {
//     await prefs.setString(imageKey, image);
//   }
//   setfcmID(image) async {
//     if(fcmIDkey!= null)
//     await prefs.setString(fcmIDkey, image);
//   }
//   setservicid(servicid) async {
//     await prefs.setString(servicidKey, servicid);
//   }

//   setPhone(phone) async {
//     await prefs.setString(phoneKey, phone);
//   }

//   setPassword(password) async {
//     await prefs.setString(passwordKey, password);
//   }

//   setphoneKey_2(phone2) async {
//     await prefs.setString(phoneKey_2, phone2);
//   }

//   setfacebookKey(facebook) async {
//     await prefs.setString(facebookKey, facebook);
//   }


//   Future<int> getId() async {
//     prefs = await SharedPreferences.getInstance();
//     final id = prefs.getInt(userIdKey);
//     if (id == null) {
//       return 0;
//     }
//     return id;
//   }

//   getPhone() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(phoneKey);
//   }

//   getusername() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(usernameKey);
//   }

//   getemail() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(emailKey);
//   }



//   getimage() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(imageKey);
//   }

//   getfcmID() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(fcmIDkey);
//   }

//   getservicid() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(servicidKey);
//   }

//   getphoneKey_2() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(phoneKey_2);
//   }

//   getfacebookKey() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getString(facebookKey);
//   }




//   getPassword() async => prefs.getString(passwordKey);

//   static setToken(String token) async => prefs.setString(fcmIDkey, token);

//   static getToken() async => prefs.getString(fcmIDkey);

//   getUserId() async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(userIdKey);
//   }

//   logout() async{
//     prefs = await SharedPreferences.getInstance();
//     prefs.setInt(userIdKey, 0);
//     prefs.setString(phoneKey, "");
//     prefs.setString(passwordKey, "");
//     prefs.setString(fcmIDkey, "");
//   }
// }
