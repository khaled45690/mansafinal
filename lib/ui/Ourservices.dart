import 'dart:async';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'Desgin.dart';
import 'Emarketing.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'PaymentScreen.dart';
import 'Programming.dart';
import 'SigninScreen.dart';
import 'Terms.dart';
import 'AboutApp.dart';



class Ourservices extends StatefulWidget {

  @override
  _OurservicesState createState() => new _OurservicesState();
}


class _OurservicesState extends State<Ourservices> {
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
            title: new Text(AppLocalizations.of(context).lblOur_Services,  style: MansaFont.baseFontStyle() ,) ,
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
                        'images/asset8.png',
                        height: 160,
                        width: 160,
                        fit: BoxFit.contain,


                      ),
                    ),

                    appButton(
                        AppLocalizations.of(context).lblEMarketing_compaigns,
                        () => imageprofile==""?youMustLogin():Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Emarketing()))
              ,
              bgColor: button3),



                    Container(
                      child: Image.asset(
                        'images/asset10.png',
                        height: 140,
                        width: 140,
                        fit: BoxFit.contain,


                      ),
                    ),

                    appButton(
                        AppLocalizations.of(context).lblDesgins,
                            () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Desgin()))
                        ,
                        bgColor: button4),
                    Container(
                      child: Image.asset(
                        'images/asset11.png',
                        height: 160,
                        width: 160,
                        fit: BoxFit.contain,

                      ),
                    ),

                    appButton(
                        AppLocalizations.of(context).lblProgramming,
                            () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Programming()))
                        ,
                        bgColor: button5),
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

