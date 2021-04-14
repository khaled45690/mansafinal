
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'Images.dart';
import 'Infographics.dart';
import 'adsVideoMakingScreen.dart';
import 'Logs.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';
import 'Video2d3d.dart';




class Desgin extends StatefulWidget {

  @override
  _DesginState createState() => new _DesginState();
}


class _DesginState extends State<Desgin> with WidgetsBindingObserver{
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name="";
  String email="";
  String imageprofile="";


  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    _context = context;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: bgColor,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [lightBgColor, transColor],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          title: new Text(AppLocalizations.of(context).lblDesgins,  style: MansaFont.baseFontStyle() ,) ,
          centerTitle: true,
            automaticallyImplyLeading: true,
            elevation: 0.0,
            leading: new IconButton(
                  icon: new IconButton(icon:
                   new Image.asset("images/asset17.png")),iconSize: 40.0,
                  onPressed: () => _scaffoldKey.currentState.openDrawer()
              ),
            actions: <Widget>[
              IconButton(icon: AppLocalizations.of(context).locale=="en" ? Image.asset("images/1-01.png") : Image.asset("images/asset32.png"),iconSize: 30.0,
                onPressed: () => Navigator.of(context).pop()),
            ],

        ),
        body: Container(
          child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'images/asset10.png',
                      height: 200,
                      width: 270,
                      fit: BoxFit.contain,


                    ),
                  ),
                  appButtonbgimage_main(
                      AppLocalizations.of(context).lblLogos,
                          () =>imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Logs()))
                      ,
                      bgColor: desgin_button1_start,
                      bgColor2: desgin_button1_end),
                  Container(
                    height: 10,
                  ),
                  appButtonbgimage_main(
                      AppLocalizations.of(context).lblImages,
                          () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Images()))
                      ,
                      bgColor: desgin_button2_start,
                      bgColor2: desgin_button2_start),
                  Container(
                    height: 10,
                  ),
                  appButtonbgimage_main(
                      AppLocalizations.of(context).lblVideo_2D_3D,
                          () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Video2d3d()))
                      ,
                      bgColor: desgin_button3_start,
                      bgColor2: desgin_button3_end),
                  Container(
                    height: 10,
                  ),
                  appButtonbgimage_main(
                      AppLocalizations.of(context).lblInfographics,
                          () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Infographics()))
                      ,
                      bgColor: desgin_button4_start,
                      bgColor2: desgin_button4_end),
                  Container(
                    height: 10,
                  ),
                  appButtonbgimage_main(
                      " ${AppLocalizations.of(context).locale=="en" ? AppLocalizations.of(context).lblAdsVideo : "تصوير فديو اعلانى"}",
                          () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => adsVideoMakingScreen()))
                      ,
                      bgColor: desgin_button3_end,
                      bgColor2: desgin_button4_end),
                  Container(
                    height: 10,
                  ),

                ]
            ),
          ),
        ),


        drawer: buildDrawer()

      );
  }


  @override
  void initState() {
    restore();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  restore() async {
    final SharedPreferences Prefs= await SharedPreferences.getInstance();
    setState(() {
      name=Prefs.getString('username') ?? "";
      email= Prefs.getString('email') ?? "";
      imageprofile= Prefs.getString('image') ?? "";



    });
  }
youMustLogin(){
    showInSnackBar("من فضلك قم بتسجيل الدخول اولا ", context, _scaffoldKey);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
