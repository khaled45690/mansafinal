import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/ui/HomeScreen.dart';

import '../LocaleHelper.dart';
import '../localizations.dart';
import 'SigninScreen.dart';
import 'TabBarScreen.dart';
// import 'package:mansa/constants/customcolors.dart';
// import 'package:mansa/constants/strings.dart';
// import 'package:mansa/helper/Preferences.dart';
// import 'package:mansa/resources/Strings.dart';
// import 'package:mansa/resources/fonts.dart';
// import 'package:mansa/ui/TabBarScreen.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'SigninScreen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  int t;

  @override
  void initState() {
    
    super.initState();
     //getlanguage();
    _timer = Timer(Duration(seconds: 5), () {
      // getUser().then((user) {
      //   if (user==null||user.user_Id == null) {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => TabBarScreen()));
      //   }else {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (context) => HomeScreen()));
      //     }
        
      // });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
     //  checkUserLang();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [splash_end, splash_start],
                  begin: const FractionalOffset(0.1, 0.8),
                  end: const FractionalOffset(1.0, 0.5),
                  tileMode: TileMode.clamp
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child: Image.asset(
                    'images/Intro.gif',
                     height: height,
                    // width: 550,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                ),
                  ),
                  // Container(
                  //   child: Text(
                  //     app_name,
                  //     textAlign: TextAlign.center,
                  //     style: MansaFont.getBoldFont(),
                  //   ),
                  // ),
                  // Container(
                  //   child: Text(
                  //     splash_intro,
                  //     textAlign: TextAlign.justify,
                  //     style: MansaFont.getsmallFont(),
                  //   ),
                  // ),
                  // Container(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
          ),
          ],
          ),
    );
  }


  // Future checkUserLang() async {
  //   if (t == null) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => SigninScreen(),
  //       ),
  //     );
  //   } else {
  //     if ((await Preferences().getPhone()) == null) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => SigninScreen(),
  //         ),
  //       );
  //     } else {

  //           // Navigator.of(context).pushReplacement(
  //           //   MaterialPageRoute(
  //           //     builder: (context) => TabBarScreen(),
  //           //   ),
  //           // );
  //     }
  //   }
  // }


  // Future getlanguage() async {
  //   t = ((await Preferences.getLangId()));
  //   if (t != null) {
  //     if (t == 2) {
  //       Preferences.setLangId(2);
  //       Preferences.english = false;
  //       Strings.english = false;
  //       initializeDateFormatting("ar_EG", null);
  //     } else {
  //       t=1;
  //       Preferences.setLangId(1);
  //       Preferences.english = true;
  //       Strings.english = true;
  //       initializeDateFormatting("en_ISO", null);
  //     }
  //   } else {
  //     t=1;
  //     Preferences.setLangId(1);
  //     Preferences.english = true;
  //     Strings.english = true;
  //     initializeDateFormatting("en_ISO", null);
  //   }
  // }


}
