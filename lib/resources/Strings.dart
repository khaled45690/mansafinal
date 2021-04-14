
// import 'package:mansa/Models/LngPref.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'ArbStrings.dart';
// import 'EngStrings.dart';


// class Strings {
//   static bool english = true;

//   LngPref _LngPref;

//   Preferences(){
//     getLngPref().then((lng){
//         this._LngPref = lng ;
//         english=lng.isEnglish;
     
//     });
//   }
 
//   static String Country() {
//     return english ? EngStrings.Country : ArbStrings.Country;
//   }

//   static String City() {
//     return english
//         ? EngStrings.City
//         : ArbStrings.City;
//   }

//   static String District() {
//     return english ? EngStrings.District : ArbStrings.District;
//   }

//   static String Sector() {
//     return english ? EngStrings.Sector : ArbStrings.Sector;
//   }

//   static String Discount() {
//     return english ? EngStrings.Discount : ArbStrings.Discount;
//   }

//   static String For_Application_Customers() {
//     return english ? EngStrings.For_Application_Customers : ArbStrings.For_Application_Customers;
//   }

//   static String Unit() {
//     return english ? EngStrings.Unit : ArbStrings.Unit;
//   }

//   static String Description() {
//     return english ? EngStrings.Description : ArbStrings.Description;
//   }

//   static String Next() {
//     return english ? EngStrings.Next : ArbStrings.Next;
//   }

//   static String Logos() {
//     return english ? EngStrings.Logos : ArbStrings.Logos;
//   }

//   static String CreatAccount() {
//     return english ? EngStrings.CreatAccount : ArbStrings.CreatAccount;
//   }

//   static String Images() {
//     return english ? EngStrings.Images : ArbStrings.Images;
//   }

//   static String Video_2D_3D() {
//     return english
//         ? EngStrings.Video_2D_3D
//         : ArbStrings.Video_2D_3D;
//   }

//   static String Infographics() {
//     return english
//         ? EngStrings.Infographics
//         : ArbStrings.Infographics;
//   }

//   static String Contact_Information() {
//     return english ? EngStrings.Contact_Information : ArbStrings.Contact_Information;
//   }

//   static String Logo_Information() {
//     return english ? EngStrings.Logo_Information : ArbStrings.Logo_Information;
//   }

//   static String Contact_with() {
//     return english ? EngStrings.Contact_with : ArbStrings.Contact_with;
//   }

//   static String Image_Information() {
//     return english ? EngStrings.Image_Information : ArbStrings.Image_Information;
//   }

//   static String Video_Information() {
//     return english ? EngStrings.Video_Information : ArbStrings.Video_Information;
//   }

//   static String colors() {
//     return english ? EngStrings.Colors : ArbStrings.Colors;
//   }

//   static String Mobile_App() {
//     return english ? EngStrings.Mobile_App : ArbStrings.Mobile_App;
//   }

//   static String Web_Desgin() {
//     return english ? EngStrings.Web_Desgin : ArbStrings.Web_Desgin;
//   }

//   static String getAboutAppDes() {
//     return english ? EngStrings.ABOUT_APP_Des : ArbStrings.ABOUT_APP_Des;
//   }

//   static String getContactUs() {
//     return english ? EngStrings.CONTACT_US : ArbStrings.CONTACT_US;
//   }

//   static String getSendApp() {
//     return english ? EngStrings.SEND_APP : ArbStrings.SEND_APP;
//   }

//   static String email() {
//     return english ? EngStrings.Email : ArbStrings.Email;
//   }
//   static String ViewTxt(){
//     return english ? EngStrings.ViewTxt : ArbStrings.ViewTxt;
//   }
//   static String LogoSrc(){
//     return english ? EngStrings.LogoSrc : ArbStrings.LogoSrc;
//   }
//   static String emailPlaceholder() {
//     return english ? EngStrings.emailPlaceholder : ArbStrings.emailPlaceholder;
//   }
//   static String password() {
//     return english ? EngStrings.password : ArbStrings.password;
//   }
//   static String passwordPlaceholder() {
//     return english ? EngStrings.passwordPlaceholder : ArbStrings.passwordPlaceholder;
//   }
//   static String Remember() {
//     return english ? EngStrings.Remember : ArbStrings.Remember;
//   }
//   static String CreateAccount() {
//     return english ? EngStrings.CreateAccount : ArbStrings.CreateAccount;
//   }
//   static String HaveAccount() {
//     return english ? EngStrings.HaveAccount : ArbStrings.HaveAccount;
//   }
//   static String LoginWithGmail() {
//     return english ? EngStrings.LoginWithGmail : ArbStrings.LoginWithGmail;
//   }
//   static String Login() {
//     return english ? EngStrings.Login : ArbStrings.Login;
//   }
   
//   static String getThemeSettings() {
//     return english ? EngStrings.THEME_SETTINGS : ArbStrings.THEME_SETTINGS;
//   }

//   static String getAppSettings() {
//     return english ? EngStrings.APP_SETTINGS : ArbStrings.APP_SETTINGS;
//   }

//   static String getChangeTheme() {
//     return english ? EngStrings.CHANGE_THEME : ArbStrings.CHANGE_THEME;
//   }

//   static String getCalenderSettings() {
//     return english
//         ? EngStrings.CALENDER_SETTINGS
//         : ArbStrings.CALENDER_SETTINGS;
//   }

//   static String getNotifications() {
//     return english ? EngStrings.NOTIFICATIONS : ArbStrings.NOTIFICATIONS;
//   }

//   static String getUseHejryDate() {
//     return english ? EngStrings.USE_HEJRY_DATE : ArbStrings.USE_HEJRY_DATE;
//   }

//   static String getShowEvents() {
//     return english ? EngStrings.SHOW_EVENTS : ArbStrings.SHOW_EVENTS;
//   }

//   static String getupload() {
//     return english ? EngStrings.upload : ArbStrings.upload;
//   }

//   static String getupload_text() {
//     return english ? EngStrings.upload_text : ArbStrings.upload_text;
//   }



//   static String getMyLocation() {
//     return english ? EngStrings.MY_LOCATION : ArbStrings.MY_LOCATION;
//   }

//   static String getTheme() {
//     return english ? EngStrings.SELECT_THEME : ArbStrings.SELECT_THEME;
//   }


//   static String Our_Services() {
//     return english ? EngStrings.Our_Services : ArbStrings.Our_Services;
//   }

//   static String Last_Ads() {
//     return english ? EngStrings.Last_Ads : ArbStrings.Last_Ads;
//   }

//   static String Offers() {
//     return english ? EngStrings.Offers : ArbStrings.Offers;
//   }

//   static String Home() {
//     return english ? EngStrings.Home : ArbStrings.Home;
//   }




//   static String EMarketing_compaigns() {
//     return english ? EngStrings.EMarketing_compaigns : ArbStrings.EMarketing_compaigns;
//   }

//   static String Desgins() {
//     return english ? EngStrings.Desgins : ArbStrings.Desgins;
//   }

//   static String Programming() {
//     return english ? EngStrings.Programming : ArbStrings.Programming;
//   }

// //  static String Our_Services() {
// //    return english
// //        ? EngStrings.Our_Services
// //        : ArbStrings.Our_Services;
// //  }


//   static String App_Information() {
//     return english
//         ? EngStrings.App_Information
//         : ArbStrings.App_Information;
//   }

//   static String Web_Information() {
//     return english ? EngStrings.Web_Information : ArbStrings.Web_Information;
//   }

//   static String Contact_Us() {
//     return english ? EngStrings.Contact_Us : ArbStrings.Contact_Us;
//   }

//   static String logout() {
//     return english ? EngStrings.logout : ArbStrings.logout;
//   }

//   static String Terms_and_Conditions() {
//     return english ? EngStrings.Terms_and_Conditions : ArbStrings.Terms_and_Conditions;
//   }
//   static String AboutAppTrans() {
//     return english ? EngStrings.ABOUT_APP : ArbStrings.ABOUT_APP;
//   }

//   static String Payment() {
//     return english ? EngStrings.Payment : ArbStrings.Payment;
//   }

//   static String My_Orders() {
//     return english ? EngStrings.My_Orders : ArbStrings.My_Orders;
//   }

//   static String getYourLocation() {
//     return english ? EngStrings.YOUR_LOCATION : ArbStrings.YOUR_LOCATION;
//   }

//   static String acceptToGetLocation() {
//     return english ? EngStrings.ACEPT_OCATION : ArbStrings.ACEPT_OCATION;
//   }



//   static String prayerTimesAndAdhan() {
//     return english
//         ? EngStrings.PRAYER_TIMES_AND_ADHAN
//         : ArbStrings.PRAYER_TIMES_AND_ADHAN;
//   }

//   static String adhanPreTimeNotification() {
//     return english
//         ? EngStrings.ADHAN_PRE_TIME_NOTIFICATION
//         : ArbStrings.ADHAN_PRE_TIME_NOTIFICATION;
//   }

//   static String adhanTimeNotification() {
//     return english
//         ? EngStrings.ADHAN_TIME_NOTIFICATION
//         : ArbStrings.ADHAN_TIME_NOTIFICATION;
//   }

//   static String location() {
//     return english ? EngStrings.LOCATION : ArbStrings.LOCATION;
//   }

//   static String automaticSettings() {
//     return english
//         ? EngStrings.AUTOMATIC_SETTINGS
//         : ArbStrings.AUTOMATIC_SETTINGS;
//   }

//   static String adhanTimePreference() {
//     return english
//         ? EngStrings.ADHAN_TIME_PREFERENCE
//         : ArbStrings.ADHAN_TIME_PREFERENCE;
//   }

//   static String manualAdjustments() {
//     return english
//         ? EngStrings.MANUAL_ADJUSTMENTS
//         : ArbStrings.MANUAL_ADJUSTMENTS;
//   }

//   static String asrTimeCalculation() {
//     return english
//         ? EngStrings.ASR_TIME_CALCULATION
//         : ArbStrings.ASR_TIME_CALCULATION;
//   }

//   static String daylightSaving() {
//     return english ? EngStrings.DAYLIGHT_SAVING : ArbStrings.DAYLIGHT_SAVING;
//   }

//   static String compassInstru() {
//     return english ? EngStrings.COMPASS_INSTR : ArbStrings.COMPASS_INSTR;
//   }

//   static String fromNorth() {
//     return english ? EngStrings.FROM_NORTH : ArbStrings.FROM_NORTH;
//   }




//   static String minute() {
//     return english ? EngStrings.MINUTE : ArbStrings.MINUTE;
//   }

//   static String notifBody(int numOfMin, String prayerName) {
//     if (english) {
//       return EngStrings.REMAINING +
//           " " +
//           "$numOfMin" +
//           " " +
//           EngStrings.MINUTE +
//           " " +
//           EngStrings.AT_WORD +
//           " " +
//           prayerName;
//     } else {
//       return ArbStrings.REMAINING +
//           " " +
//           "$numOfMin" +
//           " " +
//           ((numOfMin <= 10 || numOfMin >= 3)
//               ? ArbStrings.MINUTES
//               : ArbStrings.MINUTE) +
//           " " +
//           ArbStrings.AT_WORD +
//           " " +
//           prayerName;
//     }
//   }

//   static String silent() {
//     return english ? EngStrings.SILENT : ArbStrings.SILENT;
//   }

//   static String defaultSound() {
//     return english ? EngStrings.DEFAULT_SOUND : ArbStrings.DEFAULT_SOUND;
//   }

//   static String notificationSound() {
//     return english
//         ? EngStrings.NOTIFICATION_SOUND
//         : ArbStrings.NOTIFICATION_SOUND;
//   }

//   static String doaaAndZekrTitle() {
//     return english
//         ? EngStrings.DOAA_AND_ZEKR_TITLE
//         : ArbStrings.DOAA_AND_ZEKR_TITLE;
//   }

//   static String doaaAndZekrSubTitle() {
//     return english
//         ? EngStrings.DOAA_AND_ZEKR_SUB_TITLE
//         : ArbStrings.DOAA_AND_ZEKR_SUB_TITLE;
//   }

//   static String subCategoryTitle() {
//     return english
//         ? EngStrings.Sub_CATRGORY_TITLE
//         : ArbStrings.Sub_CATRGORY_TITLE;
//   }

//   static String hadeethTitle() {
//     return english ? EngStrings.HADEETH_TITLE : ArbStrings.HADEETH_TITLE;
//   }

//   static const String FAGR = "الفجر";
//   static const String DUHR = "الظهر";
//   static const String ASR = "العصر";
//   static const String MAGHREB = "المغرب";
//   static const String ESHAA = "العشاء";
//   static const String ZOHR = "الظهر";
//   static const String Shourouk = "الشروق";

//   static const orangeTheme = "ORANGE";
//   static const skyBlueTheme = "SKY_BLUE";
//   static const blueTheme = "BLUE";
//   static const purpleTheme = "PURPLE";
//   static const redTheme = "RED";
//   static const pinkTheme = "PINK";
//   static const greenBlueTheme = "GREEN_BLUE";
//   static const darkGreenTheme = "DARK_GREEN";
//   static const yellowTheme = "YELLOW";
//   static const fadedBlueTheme = "FADED_BLUE";
//   static const brownGreyTheme = "BROWN_GREY";
//   static const INITIAL_THEME = "initial";

//   static String applay() {
//     return english ? EngStrings.APPLAY : ArbStrings.APPLAY;
//   }

//   static String cancel() {
//     return english ? EngStrings.CANCEL : ArbStrings.CANCEL;
//   }

//   static String calculate_Adhan_Asr() {
//     return english
//         ? EngStrings.CALCULATE_ADHAN_AZR
//         : ArbStrings.CALCULATE_ADHAN_AZR;
//   }

//   static String algomhor() {
//     return english ? EngStrings.ALGOMHOR : ArbStrings.ALGOMHOR;
//   }

//   static String alhanafy() {
//     return english ? EngStrings.ALHANAFY : ArbStrings.ALHANAFY;
//   }

//   static String searchByCity() {
//     return english ? EngStrings.SEARCH_BY_CITY : ArbStrings.ALHANAFY;
//   }

//   static String chooseAssurance() {
//     return english ? EngStrings.CHOOSE_ASSURANCE : ArbStrings.CHOOSE_ASSURANCE;
//   }

//   static String chooseLocationTitle() {
//     return english
//         ? EngStrings.CHOOSE_LOCATION_TITLE
//         : ArbStrings.CHOOSE_LOCATION_TITLE;
//   }

//   static String remaining() {
//     return english ? EngStrings.REMAINING : ArbStrings.REMAINING;
//   }

//   static List<String> methods() {
//     return english ? EngStrings.METHODS : ArbStrings.METHODS;
//   }

//   static String getFavorite() {
//     return english ? EngStrings.FAVORITE : ArbStrings.FAVORITE;
//   }

//   static String prayer() {
//     return english ? EngStrings.PRAYER : ArbStrings.PRAYER;
//   }

//   static String prayerNotification() {
//     return english
//         ? EngStrings.PRAYER_NOTIFICATION
//         : ArbStrings.PRAYER_NOTIFICATION;
//   }

//   static String almadina() {
//     return english ? EngStrings.ALMADINA : ArbStrings.ALMADINA;
//   }

//   static String alqods() {
//     return english ? EngStrings.ALQODS : ArbStrings.ALQODS;
//   }

//   static String algeria() {
//     return english ? EngStrings.ALGERIA : ArbStrings.ALGERIA;
//   }

//   static String sudan() {
//     return english ? EngStrings.SUDAN : ArbStrings.SUDAN;
//   }

//   static String yemen() {
//     return english ? EngStrings.YMEN : ArbStrings.YMEN;
//   }

//   static String jordan() {
//     return english ? EngStrings.JORDAN : ArbStrings.JORDAN;
//   }

//   static String cairo() {
//     return english ? EngStrings.CAIRO : ArbStrings.CAIRO;
//   }

//   static String meccaMulla() {
//     return english ? EngStrings.MECCA_MULLA : ArbStrings.MECCA_MULLA;
//   }

//   static String turkey() {
//     return english ? EngStrings.TURKEY : ArbStrings.TURKEY;
//   }

//   static String locationPermission() {
//     return english
//         ? EngStrings.LOCATION_PERMISSION
//         : ArbStrings.LOCATION_PERMISSION;
//   }

//   static String locationManual() {
//     return english ? EngStrings.GET_MANUAL : ArbStrings.GET_MANUAL;
//   }

//   static String locationAutomatic() {
//     return english ? EngStrings.GET_AUTOMATIC : ArbStrings.GET_AUTOMATIC;
//   }

//   static String locationNotAllowed() {
//     return english
//         ? EngStrings.locationNotAllowed
//         : ArbStrings.locationNotAllowed;
//   }

//   static String prayerTime() {
//     return english
//         ? EngStrings.LOCATION_FOE_PRAYER_TIME
//         : ArbStrings.LOCATION_FOE_PRAYER_TIME;
//   }

//   static String later() {
//     return english ? EngStrings.LATER : ArbStrings.LATER;
//   }

//   static String activeSettings() {
//     return english ? EngStrings.ACCTIVE_SETTING : ArbStrings.ACCTIVE_SETTING;
//   }

//   static String activeDaylightManual() {
//     return english
//         ? EngStrings.ACCTIVE_DAYIGHT_MANUAL
//         : ArbStrings.ACCTIVE_DAYIGHT_MANUAL;
//   }

//   static String addingOneHoure() {
//     return english ? EngStrings.ADDING_ONE_HOURE : ArbStrings.ADDING_ONE_HOURE;
//   }



//   static String locationInfo() {
//     return english ? EngStrings.LOCATION_INFO : ArbStrings.LOCATION_INFO;
//   }

//   static String manual() {
//     return english ? EngStrings.MANUAL : ArbStrings.MANUAL;
//   }

//   static String automatic() {
//     return english ? EngStrings.AUTOMATIC : ArbStrings.AUTOMATIC;
//   }

//   static String appName() {
//     return english ? EngStrings.APP_NAME : ArbStrings.APP_NAME;
//   }

//   static String appShareDescription() {
//     return english
//         ? EngStrings.APP_SHARE_DESCRIPTION
//         : ArbStrings.APP_SHARE_DESCRIPTION;
//   }



//   ///////////////Login 
//   static String LoginWelcome() {
//     return english ? EngStrings.Login_Welcome : ArbStrings.Login_Welcome;
//   }
// }
