

import 'package:flutter/material.dart';
import 'package:mansaapp/ui/MyCart.dart';
import 'package:mansaapp/ui/Ourservices.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../localizations.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';


const Color PRIMARY_COLOR = Color(0xff0D3F67);
const String GOOGLE_MAPS_API_KEY = "AIzaSyAxlg0RZ-r3e_uSmp6A-dArxeodyMV2hwQ";
const String app_name = "Mansa";
const String splash_intro = "For E-Marketing & Ads";
const String Phone_number = "Phone Number";
const String password = "Passwordّ";
const String Remember = "Rememberّ";
const String forget="Forget Password?";
const String login_gmail = "Login With Gmail";
const String havent_account = "Don't have Account?";
const String create_account="Create Account";
const String login_enter="Login";
const String service_services="Our Services";
const String service_ads="Last Ads";
const String service_offers="Offers";
const String BASE_URL = "http://mansa-app.com/";


const int imageQuality = 40;
const int imageQualityForMultipleImages = 20;



void showInSnackBar(
    String value, BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
    {Color color}) {
  FocusScope.of(context).requestFocus(new FocusNode());
  _scaffoldKey.currentState?.removeCurrentSnackBar();
  _scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: new Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16.0, fontFamily: "WorkSansSemiBold"),
    ),
    backgroundColor: color == null ? Colors.red : color,
    duration: Duration(seconds: 3),
  ));
}

Future<String> getAddress(LatLng latLng)async{
  var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLng.latitude, latLng.longitude)) ;
  return address.first.addressLine ;
}

void showInSnackBarAfterAddService(
    String value, BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
    {Color color}) {
  FocusScope.of(context).requestFocus(new FocusNode());
  _scaffoldKey.currentState?.removeCurrentSnackBar();
  _scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: new Container(
      child: Row(
        children: <Widget>[
          FlatButton(
                  child: Text(AppLocalizations.of(context).lblContinus),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Ourservices()));
                  }),
              FlatButton(
                  child: Text(AppLocalizations.of(context).lblGoCart),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCart()));
                  }),
        ],
      ),
    ),
    backgroundColor: color == null ? Colors.green : color,
    duration: Duration(seconds: 3),
  ));
}
