import 'dart:async';

import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'AboutApp.dart';
import '../AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'Mobile_app.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';
import 'Web_desgin.dart';




class Programming extends StatefulWidget {

  @override
  _ProgrammingState createState() => new _ProgrammingState();
}


class _ProgrammingState extends State<Programming> {
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
          title: new Text(AppLocalizations.of(context).lblProgramming,  style: MansaFont.baseFontStyle() ,) ,
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
        body: SingleChildScrollView(
          child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'images/asset11.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.contain,


                    ),
                  ),
                  appButtonbgimage_main(
                      AppLocalizations.of(context).lblMobile_App,
                          () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Mobile_app()))
                      ,
                      bgColor: desgin_button3_start,
                      bgColor2: desgin_button3_end),
                  Container(
                    height: 10,
                  ),
                  appButtonbgimage_main(
                      AppLocalizations.of(context).lblWeb_Desgin,
                          () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Web_desgin()))
                      ,
                      bgColor: desgin_button2_start,
                      bgColor2: desgin_button2_end),
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
    super.dispose();
  }
}
