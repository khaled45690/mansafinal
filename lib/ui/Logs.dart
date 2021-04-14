import 'dart:async';
import 'package:mansaapp/APIs/ServiceApi.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/ServiceVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'TabBarScreen.dart';
import 'Terms.dart';



class Logs extends StatefulWidget {
  @override
  _LogsState createState() => new _LogsState();
}

class _LogsState extends State<Logs> with WidgetsBindingObserver{
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String name="";
  String email="";
  String imageprofile="";


  final GlobalKey<ScaffoldState> _scaffoldKey_logo= new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _form_logo = GlobalKey<FormState>();
  var nameenglishKey_log = GlobalKey<FormFieldState>();
  var namearabicKey_log = GlobalKey<FormFieldState>();
  var desKey_log = GlobalKey<FormFieldState>();
  var phone1Key_log = GlobalKey<FormFieldState>();
  var phone2Key_log = GlobalKey<FormFieldState>();
  var emailKey_log = GlobalKey<FormFieldState>();
  var facebookKey_log = GlobalKey<FormFieldState>();
  var twitterKey_log = GlobalKey<FormFieldState>();
  var instagramKey_log = GlobalKey<FormFieldState>();
  var snapShatKey_log = GlobalKey<FormFieldState>();
  var youtubeKey_log = GlobalKey<FormFieldState>();


  Color currentColor_1 = Color(0xffFF4C57);
  Color currentColor_2 = Color(0xff2ABA00);
  Color currentColor_3 = Color(0xffF7931E);


  void changeColor_1(Color color) => setState(() => currentColor_1 = color);
  void changeColor_2(Color color) => setState(() => currentColor_2 = color);
  void changeColor_3(Color color) => setState(() => currentColor_3 = color);


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
                  tileMode: TileMode.clamp),
            ),
          ),
          title: new Text(
            AppLocalizations.of(context).lblLogos,
            style: MansaFont.baseFontStyle(),
          ),
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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                  key: _form_logo,
                  child: Column(children: <Widget>[
                Container(
                  height: 10,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          AppLocalizations.of(context).lblLogo_Information,
                          textAlign: TextAlign.center,
                          style: MansaFont.getBoldFontinside(),
                        ),
                      ),
                    ]),
                Container(
                  height: 20,
                ),
                Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(
                                  AppLocalizations.of(context).lblLogo+" *" , 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),
                                  ),
                                ),
                                Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                  key: nameenglishKey_log,
                                  maxLines: 1,
                                  textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                  style: MansaFont.getLightFont(),
                                  
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context).lblEName,
                                    //border: OutlineInputBorder(),
                                    
                                    // labelStyle:
                                    //     MansaFont.getLightFont_TextFormField(),
                                    // fillColor: Colors.blueGrey,
                                    // hintText: AppLocalizations.of(context).lblEName,
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 10.0),
                                    // border: OutlineInputBorder(
                                    //   borderSide:
                                    //       const BorderSide(color: Colors.grey, width: 0.0),
                                    //   borderRadius: BorderRadius.circular(25.0),
                                    // ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide:
                                    //       const BorderSide(color: Colors.grey, width: 1.0),
                                    //   borderRadius: BorderRadius.circular(25.0),
                                    // ),
                                  ),
                                ),
                                ),
                                Expanded(
                                flex: 1,
                                child: Text(
                                  " *", 
                                    textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                  key: namearabicKey_log,
                                  maxLines: 1,
                                  textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                  style: MansaFont.getLightFont(),
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context).lblAName,
                                    // labelStyle:
                                    // MansaFont.getLightFont_TextFormField(),
                                    // fillColor: Colors.blueGrey,
                                    // hintText: AppLocalizations.of(context).lblAName,
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 10.0),
                                    // border: OutlineInputBorder(
                                    //   borderSide:
                                    //   const BorderSide(color: Colors.grey, width: 0.0),
                                    //   borderRadius: BorderRadius.circular(25.0),
                                    // ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide:
                                    //   const BorderSide(color: Colors.grey, width: 1.0),
                                    //   borderRadius: BorderRadius.circular(25.0),
                                    // ),
                                  ),
                                ),
                                ),
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Text(AppLocalizations.of(context).lblcolorTxt, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                  width: 70, // works
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                      elevation: 3.0,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              titlePadding: const EdgeInsets.all(0.0),
                                              contentPadding: const EdgeInsets.all(0.0),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: currentColor_1,
                                                  onColorChanged: changeColor_1,
                                                  colorPickerWidth: 300.0,
                                                  pickerAreaHeightPercent: 0.7,
                                                  enableAlpha: true,
                                                  displayThumbColor: true,
                                                  paletteType: PaletteType.hsv,
                                                  // pickerAreaBorderRadius: const BorderRadius.only(
                                                  //   topLeft: const Radius.circular(2.0),
                                                  //   topRight: const Radius.circular(2.0),
                                                  // ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: const Text('Got it'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      color: currentColor_1,
                                      textColor: useWhiteForeground(currentColor_1)
                                          ? const Color(0xffffffff)
                                          : const Color(0xff000000),

                                    ),
                                  ),
                                ),
                                Expanded(
                                flex: 1,
                                child: Text(
                                  "" , 
                                    textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                  width: 70, // works
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                      elevation: 3.0,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              titlePadding: const EdgeInsets.all(0.0),
                                              contentPadding: const EdgeInsets.all(0.0),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: currentColor_2,
                                                  onColorChanged: changeColor_2,
                                                  colorPickerWidth: 300.0,
                                                  pickerAreaHeightPercent: 0.7,
                                                  enableAlpha: true,
                                                  displayThumbColor: true,

                                                  paletteType: PaletteType.hsv,
                                                  // pickerAreaBorderRadius: const BorderRadius.only(
                                                  //   topLeft: const Radius.circular(2.0),
                                                  //   topRight: const Radius.circular(2.0),
                                                  // ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: const Text('Got it'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      color: currentColor_2,
                                      textColor: useWhiteForeground(currentColor_2)
                                          ? const Color(0xffffffff)
                                          : const Color(0xff000000),

                                    ),
                                      ),
                                ),
                               Expanded(
                                flex: 1,
                                child: Text(
                                  "" , 
                                    textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 70, // works
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                      elevation: 2.0,
                                      color: currentColor_3,
                                      textColor: useWhiteForeground(currentColor_3)
                                          ? const Color(0xffffffff)
                                          : const Color(0xff000000),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              titlePadding: const EdgeInsets.all(0.0),
                                              contentPadding: const EdgeInsets.all(0.0),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: currentColor_3,
                                                  onColorChanged: changeColor_3,
                                                  colorPickerWidth: 300.0,
                                                  pickerAreaHeightPercent: 0.7,
                                                  enableAlpha: true,
                                                  displayThumbColor: true,

                                                  paletteType: PaletteType.hsv,
                                                  // pickerAreaBorderRadius: const BorderRadius.only(
                                                  //   topLeft: const Radius.circular(2.0),
                                                  //   topRight: const Radius.circular(2.0),
                                                  // ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: const Text('Got it'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },

                                    ),
                                      ),
                                ),
                                Expanded(
                                flex: 1,
                                child: Text(
                                  "" , 
                                    textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),
                                  ),
                                ),
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded( // wrap your Column in Expanded
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      key: desKey_log,
                                      maxLines: 3,
                                      textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                      style: MansaFont.getLightFont(),
                                      decoration: InputDecoration(
                                        labelText: AppLocalizations.of(context).lblDescriptionPlaceholder,
                                        labelStyle:
                                        MansaFont.getLightFont_TextFormField(),
                                        // fillColor: Colors.blueGrey,
                                        // hintText: AppLocalizations.of(context).lblDescriptionPlaceholder,
                                        contentPadding: new EdgeInsets.symmetric(
                                            vertical: 14.0, horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.grey, width: 0.0),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          Container(
                            height: 2,
                            color: grey_ligth,
                          ),
                          Container(
                            height: 20,
                          ),
                          // Divider(
                          //   indent: 40.0,
                          //   endIndent: 40.0,
                          //   height: 2.0,
                          //   color: gray,
                          // ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    AppLocalizations.of(context).lblContact_Information,
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.getBoldFontinside(),
                                  ),
                                ),
                              ]
                          ),
                           
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblFirstNum +" *", 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: phone1Key_log,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblFirstNumPlaceholder,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          // hintText: AppLocalizations.of(context).lblFirstNumPlaceholder,
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblSecondNum, 
                                    textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: phone2Key_log,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText:AppLocalizations.of(context).lblSecondNumPlaceholder,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          // hintText: AppLocalizations.of(context).lblSecondNumPlaceholder,
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblemail, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: emailKey_log,
                                        maxLines: 1,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblemail,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          // hintText: AppLocalizations.of(context).lblEmailSample,
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblFacebook, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: facebookKey_log,
                                        maxLines: 1,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblFacebook,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "facebook.com/....",
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblTwitter, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: twitterKey_log,
                                        maxLines: 1,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblTwitter,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "twitter.com/....",
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblInstagram, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: instagramKey_log,
                                        maxLines: 1,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblInstagram,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "Instagram.com/....",
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblSnapShat, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: snapShatKey_log,
                                        maxLines: 1,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblSnapShat,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "Snapshat.com/....",
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblYoutube, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: youtubeKey_log,
                                        maxLines: 1,
                                        textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblYoutube,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "Youtube.com/....",
                                          contentPadding: new EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 10.0),
                                          // border: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 0.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //   borderSide:
                                          //   const BorderSide(color: grey_ligth, width: 1.0),
                                          //   borderRadius: BorderRadius.circular(25.0),
                                          // ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Container(
                              child: Text(service==null?"":AppLocalizations.of(context).lblServicePrice+service.Price.toString()+AppLocalizations.of(context).lblRyal),
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded( // wrap your Column in Expanded
                                  child: Column(
                                    children: <Widget>[
                                      appButtonbgimage(
                                          AppLocalizations.of(context).lblNext,
                                              () => send_data(),
                                          bgColor: lightBgColor,
                                          bgColor2: transColor),
                                    ],
                                  ),
                                ),
                              ],

                            ),

                        ],
                      ),
                   
                    
//
              ])),
            ),
          ),
        ),


        drawer: buildDrawer()
      );
  }





  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  void initState() {
    restore();
    super.initState();
    getUser().then((user){
      setState(() {
              this.user = user ;
      });
    });
    if(user!=null){
          print("user.emaillllllllllllllllllll");
      print(user.email);
    }
    ServiceApi.getServices().then((response) {
          if (response.code ==200 ) {
            response.data.forEach((s){
              if(s.Id==3){
                this.service = s;
              }
            });
          } else {
            print("${response.message}");
          }
          setState(() {
          });
        });
    
    
    
    // _bloc.addserviceSubject.listen((data) {

    //   showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Center(child: Text("يرجي الانتظار")),
    //         content: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children : <Widget>[
    //             Expanded(
    //               child: Text(
    //                 "سيتم التاكيد بايميل ...يرجي اتباع التعليمات المرفقه في الايميل",
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   color: lightBgColor,

    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //               child: Text('Ok'),
    //               onPressed: () {
    //                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarScreen()));
    //               })
    //         ],
    //       );
    //     },
    //   );
    // }, onError: (error) {
    //   hideAppDialog(this.context);
    //   showSnack(error.toString());
    // });
  }
    UserVM user ;
    ServiceVM service ;


  restore() async {
    final SharedPreferences Prefs= await SharedPreferences.getInstance();
    setState(() {
      name=Prefs.getString('username') ?? "";
      email= Prefs.getString('email') ?? "";
      imageprofile= Prefs.getString('image') ?? "";



    });
  }




  send_data() {

    
    try {
      if (_form_logo.currentState.validate()) {
        if(
          // desKey_log.currentState.value==null||desKey_log.currentState.value==""||
        phone1Key_log.currentState.value==null||phone1Key_log.currentState.value==""||
        // phone2Key_log.currentState.value==null||phone2Key_log.currentState.value==""||
        //emailKey_log.currentState.value==null||emailKey_log.currentState.value==""||
        // facebookKey_log.currentState.value==null||facebookKey_log.currentState.value==""||
        currentColor_1.toString()==null||currentColor_1.toString()==""||
        currentColor_2.toString()==null||currentColor_2.toString()==""||
        currentColor_3.toString()==null||currentColor_3.toString()==""||
        nameenglishKey_log.currentState.value==null||nameenglishKey_log.currentState.value==""||
        namearabicKey_log.currentState.value==null||namearabicKey_log.currentState.value==""
        // twitterKey_log.currentState.value==null||twitterKey_log.currentState.value==""||
        // instagramKey_log.currentState.value==null||instagramKey_log.currentState.value==""||
        // snapShatKey_log.currentState.value==null||snapShatKey_log.currentState.value==""||
        // youtubeKey_log.currentState.value==null||youtubeKey_log.currentState.value==""
        ){
          print("objectobjectobjectobjectobjectobjectobject");
          showInSnackBar(AppLocalizations.of(_context).lblEnterYourData, _context, _scaffoldKey);
        }else{
          showAppLoading(context);
          ShoppingCartVM obj = new ShoppingCartVM();
          obj.NameAr=namearabicKey_log.currentState.value;
          obj.NameEn=nameenglishKey_log.currentState.value;
          obj.Phone1=phone1Key_log.currentState.value;
          obj.Phone2=phone2Key_log.currentState.value;
          obj.Color1=currentColor_1.toString();
          obj.Color2=currentColor_2.toString();
          obj.Color3=currentColor_3.toString();
          obj.Description=desKey_log.currentState.value;
          obj.Facebook=facebookKey_log.currentState.value;
          obj.Email=emailKey_log.currentState.value;
          obj.Twitter=twitterKey_log.currentState.value;
          obj.Instagram=instagramKey_log.currentState.value;
          obj.Snapshat=snapShatKey_log.currentState.value;
          obj.ServiceId=3;
          obj.UserId=user.user_Id;
          obj.Price=service.Price;
          ShoppingCartApi.addToShoppingCar(obj).then((response) {
          if (response.code ==200 ) {
            hideAppDialog(context);
       showInSnackBarAfterAddService(AppLocalizations.of(_context).lblServiceAdded, _context, _scaffoldKey);
   
          //  showInSnackBar("تم اضافه الخدمه الي سله الطلبات", _context, _scaffoldKey);
           // showSnack("تم اضافه الخدمه الي سله المهملات");
          } else {
            print("${response.message}");
            //showInSnackBar("${response.message}", context, _scaffoldKey);
          }
          setState(() {
          //this.loginApi = false;
          });
        }, onError: (error) {
          print("login Error : : :$error");
          setState(() {
          // this.loginApi = false;
          });
        });
        }
        
      } else {
        hideAppDialog(context);
      }
    }catch(error) {
      print("object");
      print(error.toString());
      hideAppDialog(_context);
      //showSnack(error.toString());
    };

  }

  void showSnack(String msg, {Duration duration}) async {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: MansaFont.getRegularFont(),
      ),
      duration: duration == null ? Duration(seconds: 5) : duration,
    ));
  }

}


