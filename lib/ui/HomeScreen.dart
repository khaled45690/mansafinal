import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mansa/ui/CartScreen.dart';
// import 'package:mansa/ui/Latesta_ds.dart';
// import 'package:mansa/ui/Ourservices.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../LocaleHelper.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'TabBarScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  BuildContext _context;


 
  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    _context = context;
    return Scaffold(
          backgroundColor: bgColor,
          body: SingleChildScrollView(
            child: Form(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      CupertinoSwitch(
                        activeColor: button3,
                        value: AppLocalizations.of(context).locale=="en"?true:false,
                        onChanged: (bool value) {
                          if (AppLocalizations.of(context).locale == "en") {
                                this.setState((){
                                  print("ar");
                                  helper.onLocaleChanged(new Locale("ar"));
                                });
                              } else {
                                this.setState((){
                                  print("En");
                                  helper.onLocaleChanged(new Locale("en"));
                                });
                              }
                        },
                      ),
                      Text(
                          " ${AppLocalizations.of(context).locale=="en" ? "EN" : "عربي"}",
                          style: MansaFont.baseRegularcolorFont(),
                        ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'images/asset25.png',
                    height: 280,
                    width: 280,
                  ),
                ),
                Container(
                  height: 5,
                ),
                appButtonbgimage_main(
                    AppLocalizations.of(context).lblOur_Services,
                    () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Ourservices())),
                    bgColor: button1,
                    bgColor2: button1),
                Container(
                  height: 10,
                ),
                appButtonbgimage_main(
                   AppLocalizations.of(context).lblLast_Ads,
                    () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Ads())),
                    // () => Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => Latest_ads())),
                    bgColor: button2,
                    bgColor2: button2),
                Container(
                  height: 10,
                ),
                appButtonbgimage_main(
                    AppLocalizations.of(context).lblOffers,
                    () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Offers())),
                    // () => Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => CartScreen())),
                    bgColor: button3,
                    bgColor2: button3),
                Container(
                  height: 5,
                ),
              ]),
            ),
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Future dispose() {
    super.dispose();
  }


}
