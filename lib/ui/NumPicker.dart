import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/PlatformVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/ui/Emarketing.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import '../localizations.dart';
import 'Famous.dart';
import 'FamousV2.dart';
import 'SocialMedia.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Select extends StatefulWidget {
  Select({Key key, this.shoppingCart}) : super(key: key);
  ShoppingCartVM shoppingCart;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectState();
  }
}

class SelectState extends State<Select> {
  int facebookViewNumber = 0;
  int tiktokViewNumber = 0;
  int instagramViewNumber = 0;
  int twitterViewNumber = 0;
  int snapshatViewNumber = 0;
  int youtubeViewNumber = 0;

  double facebookViewPrice = 0;
  double tiktokViewPrice = 0;
  double instagramViewPrice = 0;
  double twitterViewPrice = 0;
  double snapshatViewPrice = 0;
  double youtubeViewPrice = 0;

  double facebookResult = 0;
  double tiktokResult = 0;
  double instagramResult = 0;
  double twitterResult = 0;
  double snapshatResult = 0;
  double youtubeResult = 0;
  String totalPrice = "";
  List viewersList = [];
  String viewerNumber = '0';
  List durationList = [];
  List ageList = [];
  double _ageAnimatedHeight = 0;

  makeNumberOfViewerCalculation(value){
    setState(() {
      this.vNumbers = value.toInt();
      facebookResult = facebookViewNumber == 0
          ? 0
          : (value.toInt() * facebookViewPrice) /
          facebookViewNumber;
      tiktokResult = tiktokViewNumber == 0
          ? 0
          : (value.toInt() * tiktokViewPrice) /
          tiktokViewNumber;
      twitterResult = twitterViewNumber == 0
          ? 0
          : (value.toInt() * twitterViewPrice) /
          twitterViewNumber;
      instagramResult = instagramViewNumber == 0
          ? 0
          : (value.toInt() * instagramViewPrice) /
          instagramViewNumber;
      snapshatResult = snapshatViewNumber == 0
          ? 0
          : (value.toInt() * snapshatViewPrice) /
          snapshatViewNumber;
      youtubeResult = youtubeViewNumber == 0
          ? 0
          : (value.toInt() * youtubeViewPrice) /
          youtubeViewNumber;
      totalPrice = (facebookResult +
          tiktokResult +
          instagramResult +
          twitterResult +
          snapshatResult +
          youtubeResult)
          .toStringAsFixed(3);
    });
  }


  @override
  void initState() {
super.initState();
    for(int i  = 0 ; i <= 40 ; i++){
      viewersList.add(50000 * (i));
    }
for(int i  = 0 ; i <= 15 ; i++){
  durationList.add(i);
}

for(int i = 0 ; i <= 100 ; i++){
  ageList.add(i);
}
makeNumberOfViewerCalculation(double.parse('0'));


    widget.shoppingCart.platforms.forEach((plats) {
      if (widget.shoppingCart.Sector == "حكومي") {
        if (widget.shoppingCart.socials.contains(1)) {
          if (plats.Id == 1) {
            setState(() {
              print("Hekomy Facebook");
              print(plats.viewsNumber);
              facebookViewNumber = plats.viewsNumber;
              facebookViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(2)) {
          if (plats.Id == 19) {
            setState(() {
              tiktokViewNumber = plats.viewsNumber;
              tiktokViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(3)) {
          if (plats.Id == 3) {
            setState(() {
              instagramViewNumber = plats.viewsNumber;
              instagramViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(4)) {
          if (plats.Id == 4) {
            setState(() {
              twitterViewNumber = plats.viewsNumber;
              twitterViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(5)) {
          if (plats.Id == 5) {
            setState(() {
              snapshatViewNumber = plats.viewsNumber;
              snapshatViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(6)) {
          if (plats.Id == 16) {
            setState(() {
              youtubeViewNumber = plats.viewsNumber;
              youtubeViewPrice = plats.viewsPrice;
            });
          }
        }
      } else if (widget.shoppingCart.Sector == "أفراد") {
        if (widget.shoppingCart.socials.contains(1)) {
          if (plats.Id == 6) {
            setState(() {
              facebookViewNumber = plats.viewsNumber;
              facebookViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(2)) {
          if (plats.Id == 21) {
            setState(() {
              tiktokViewNumber = plats.viewsNumber;
              tiktokViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(3)) {
          if (plats.Id == 8) {
            setState(() {
              instagramViewNumber = plats.viewsNumber;
              instagramViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(4)) {
          if (plats.Id == 9) {
            setState(() {
              twitterViewNumber = plats.viewsNumber;
              twitterViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(5)) {
          if (plats.Id == 10) {
            setState(() {
              snapshatViewNumber = plats.viewsNumber;
              snapshatViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(6)) {
          if (plats.Id == 17) {
            setState(() {
              youtubeViewNumber = plats.viewsNumber;
              youtubeViewPrice = plats.viewsPrice;
            });
          }
        }
      } else if (widget.shoppingCart.Sector == "جمعيات خيريه") {
        if (widget.shoppingCart.socials.contains(1)) {
          if (plats.Id == 11) {
            setState(() {
              facebookViewNumber = plats.viewsNumber;
              facebookViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(2)) {
          if (plats.Id == 20) {
            setState(() {
              tiktokViewNumber = plats.viewsNumber;
              tiktokViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(3)) {
          if (plats.Id == 13) {
            setState(() {
              instagramViewNumber = plats.viewsNumber;
              instagramViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(4)) {
          if (plats.Id == 14) {
            setState(() {
              twitterViewNumber = plats.viewsNumber;
              twitterViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(5)) {
          if (plats.Id == 15) {
            setState(() {
              snapshatViewNumber = plats.viewsNumber;
              snapshatViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(6)) {
          if (plats.Id == 18) {
            setState(() {
              youtubeViewNumber = plats.viewsNumber;
              youtubeViewPrice = plats.viewsPrice;
            });
          }
        }
      }else if (widget.shoppingCart.Sector == "خاص") {
        if (widget.shoppingCart.socials.contains(1)) {
          if (plats.Id == 26) {
            setState(() {
              facebookViewNumber = plats.viewsNumber;
              facebookViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(2)) {
          if (plats.Id == 23) {
            setState(() {
              tiktokViewNumber = plats.viewsNumber;
              tiktokViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(3)) {
          if (plats.Id == 22) {
            setState(() {
              instagramViewNumber = plats.viewsNumber;
              instagramViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(4)) {
          if (plats.Id == 28) {
            setState(() {
              twitterViewNumber = plats.viewsNumber;
              twitterViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(5)) {
          if (plats.Id == 25) {
            setState(() {
              snapshatViewNumber = plats.viewsNumber;
              snapshatViewPrice = plats.viewsPrice;
            });
          }
        }
        if (widget.shoppingCart.socials.contains(6)) {
          if (plats.Id == 18) {
            setState(() {
              youtubeViewNumber = plats.viewsNumber;
              youtubeViewPrice = plats.viewsPrice;
            });
          }
        }
      }
      print(plats.platformName);
    });
    print("After Initiat");
  }

  int vNumbers = 0, duration = 0, age = 50 , startAge = 10;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text(AppLocalizations.of(context).lblSocialMediaList),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            child: Column(
              children: <Widget>[
                Container(
                  //height: 200,
                  margin:
                      EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 10),
                  width: MediaQuery.of(context).size.width,
                  color: grey_ligth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).lblViewNumbers,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Stack(children: [
                        Column(
                          children: [
                            Container(
                              width: size.width - 10,
                              child: Slider(
                                value: vNumbers.toDouble(),
                                onChanged: (double value) {
                                  setState(() {
                                    this.vNumbers = value.toInt();
                                    facebookResult = facebookViewNumber == 0
                                        ? 0
                                        : (value.toInt() * facebookViewPrice) /
                                            facebookViewNumber;
                                    tiktokResult = tiktokViewNumber == 0
                                        ? 0
                                        : (value.toInt() * tiktokViewPrice) /
                                            tiktokViewNumber;
                                    twitterResult = twitterViewNumber == 0
                                        ? 0
                                        : (value.toInt() * twitterViewPrice) /
                                            twitterViewNumber;
                                    instagramResult = instagramViewNumber == 0
                                        ? 0
                                        : (value.toInt() * instagramViewPrice) /
                                            instagramViewNumber;
                                    snapshatResult = snapshatViewNumber == 0
                                        ? 0
                                        : (value.toInt() * snapshatViewPrice) /
                                            snapshatViewNumber;
                                    youtubeResult = youtubeViewNumber == 0
                                        ? 0
                                        : (value.toInt() * youtubeViewPrice) /
                                            youtubeViewNumber;
                                    totalPrice = (facebookResult +
                                            tiktokResult +
                                            instagramResult +
                                            twitterResult +
                                            snapshatResult +
                                            youtubeResult)
                                        .toStringAsFixed(3);
                                    print("total is :" + totalPrice.toString());
                                    print((5 + 5).toString());
                                    print((2.2 + 3.3).toString());
                                    print(vNumbers);
                                  });
                                },
                                min: 0,
                                max: 2000000,
                                divisions: 40,

                              ),
                              //padding: EdgeInsets.only(left: 30,right: 30),
                            ),
                            Container(
                              width: 100,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                iconSize: 18,
                                iconEnabledColor: Colors.black,
                                style: TextStyle(fontSize: 15 , ),

                                value: vNumbers.toString(),
                                hint:  Text("Select item"),
                                onChanged: (value) {
                                  print(value);
                                  makeNumberOfViewerCalculation(double.parse(value));

                                },
                                items: viewersList.map(( user) {
                                  return  DropdownMenuItem<String>(
                                    value: user.toString(),
                                    child: Container(
                                      child: Text(
                                        user.toString(),
                                        textAlign: TextAlign.center,
                                        style:  TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                      ]),
                      Text(
                        vNumbers.toString() +
                            " " +
                            AppLocalizations.of(context).lblSceen,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: 200,
                  margin: EdgeInsets.only(
                      right: 0, left: 0, bottom: 0, top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  color: grey_ligth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).lblDuration,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        child: Slider(
                          value: duration.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              this.duration = value.toInt();
                              print(duration);
                            });
                          },
                          min: 0,
                          max: 15,
                          divisions: null,
                        ),
                        //padding: EdgeInsets.only(left: 30,right: 30),
                      ),
                      Container(
                        width: 50,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconSize: 18,
                          iconEnabledColor: Colors.black,
                          style: TextStyle(fontSize: 15 , ),

                          value: duration.toString(),
                          hint:  Text("Select item"),
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              duration = int.parse(value);
                            });
                          },
                          items: durationList.map(( user) {
                            return  DropdownMenuItem<String>(
                              value: user.toString(),
                              child: Container(
                                child: Text(
                                  user.toString(),
                                  textAlign: TextAlign.center,
                                  style:  TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Text(
                        duration.toString() +
                            " " +
                            AppLocalizations.of(context).lblTimes,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: 200,
                  margin:
                      EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  color: grey_ligth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).lblAge,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(

                        child: FlutterSlider(
                          values: [startAge.toDouble(), age.toDouble()],
                          rangeSlider:  AppLocalizations.of(context).locale == "en" ? false : true ,
                          max: 100,
                          min: 0,
                          rtl: true,
                          onDragging: (handlerIndex, lowerValue, upperValue) {
                            print(upperValue);
                            setState(() {
                              startAge = lowerValue.toInt();
                              age = upperValue.toInt();
                            });
                          },
                        ),
                      ),
                      Row(
                        textDirection: AppLocalizations.of(context).locale == "en" ? TextDirection.ltr : TextDirection.rtl ,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context).locale == "en" ? "From" : "من"),
                          Column(
                            children: [
                              Container(
                                width: 50,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  iconSize: 18,
                                  iconEnabledColor: Colors.black,
                                  style: TextStyle(fontSize: 15 , ),

                                  value: startAge.toString(),
                                  hint:  Text("Select item"),
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      if(int.parse(value) < age){
                                        startAge = int.parse(value);
                                      }
                                    });
                                  },
                                  items: ageList.map(( user) {
                                    return  DropdownMenuItem<String>(
                                      value: user.toString(),
                                      child: Container(
                                        child: Text(
                                          user.toString(),
                                          textAlign: TextAlign.center,
                                          style:  TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Text(
                                startAge.toString() +
                                    " " +
                                    AppLocalizations.of(context).lblYear,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                          Text(AppLocalizations.of(context).locale == "en" ? "To" : "الى"),
                          Column(
                            children: [
                              Container(
                                width: 50,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  iconSize: 18,
                                  iconEnabledColor: Colors.black,
                                  style: TextStyle(fontSize: 15 , ),

                                  value: age.toString(),
                                  hint:  Text("Select item"),
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      if(int.parse(value) > startAge){
                                        age = int.parse(value);
                                      }
                                    });
                                  },
                                  items: ageList.map(( user) {
                                    return  DropdownMenuItem<String>(
                                      value: user.toString(),
                                      child: Container(
                                        child: Text(
                                          user.toString(),
                                          textAlign: TextAlign.center,
                                          style:  TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Text(
                                age.toString() +
                                    " " +
                                    AppLocalizations.of(context).lblYear,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                ),
                widget.shoppingCart.socials.contains(1)
                    ? Container(
                        //Facebook
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: widget.shoppingCart.Sector == "حكومي"
                                  ? Text(
                                      AppLocalizations.of(context)
                                              .lblGovFacebook +
                                          facebookResult.toString() +
                                          " " +
                                          AppLocalizations.of(context).lblRyal,
                                      textAlign: TextAlign.center,
                                      style: MansaFont
                                          .baseFontStyleWithBackground(),
                                    )
                                  : widget.shoppingCart.Sector == "أفراد"
                                      ? Text(
                                          AppLocalizations.of(context)
                                                  .lblSpecialFacebook +
                                              facebookResult.toString() +
                                              " " +
                                              AppLocalizations.of(context)
                                                  .lblRyal,
                                          textAlign: TextAlign.center,
                                          style: MansaFont
                                              .baseFontStyleWithBackground(),
                                        )
                                      : widget.shoppingCart.Sector ==
                                              "جمعيات خيريه"
                                          ? Text(
                                              AppLocalizations.of(context)
                                                      .lblCharitiesFacebook +
                                                  facebookResult.toString() +
                                                  " " +
                                                  AppLocalizations.of(context)
                                                      .lblRyal,
                                              textAlign: TextAlign.center,
                                              style: MansaFont
                                                  .baseFontStyleWithBackground(),
                                            )
                                          : widget.shoppingCart.Sector ==
                                  "خاص"
                                  ? Text(
                                AppLocalizations.of(context).locale == "en"? "private facebook price" : "سعر خاص فيسبوك " +
                                    facebookResult.toString() +
                                    " " +
                                    AppLocalizations.of(context)
                                        .lblRyal,
                                textAlign: TextAlign.center,
                                style: MansaFont
                                    .baseFontStyleWithBackground(),
                              ) : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                widget.shoppingCart.socials.contains(2)
                    ? Container(
                        //Google
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: widget.shoppingCart.Sector == "حكومي"
                                  ? Text(
                                      AppLocalizations.of(context).locale == "en"? "government google price" : "سعر حكومى تيكتوك "
                                          +
                                          tiktokResult.toString() +
                                          " " +
                                          AppLocalizations.of(context).lblRyal,
                                      textAlign: TextAlign.center,
                                      style: MansaFont
                                          .baseFontStyleWithBackground(),
                                    )
                                  : widget.shoppingCart.Sector == "أفراد"
                                      ? Text(
                                          AppLocalizations.of(context)
                                                  .lblSpecialGoogle +
                                              tiktokResult.toString() +
                                              " " +
                                              AppLocalizations.of(context)
                                                  .lblRyal,
                                          textAlign: TextAlign.center,
                                          style: MansaFont
                                              .baseFontStyleWithBackground(),
                                        )
                                      : widget.shoppingCart.Sector ==
                                              "جمعيات خيريه"
                                          ? Text(
                                AppLocalizations.of(context).locale == "en"? "government google price" : "سعر حكومى تيكتوك "
                                    +
                                                  tiktokResult.toString() +
                                                  " " +
                                                  AppLocalizations.of(context)
                                                      .lblRyal,
                                              textAlign: TextAlign.center,
                                              style: MansaFont
                                                  .baseFontStyleWithBackground(),
                                            )
                                          : widget.shoppingCart.Sector ==
                                  "خاص"
                                  ? Text(
                                AppLocalizations.of(context).locale == "en"? "private tiktok price" : "سعر خاص تيكتوك "
                                    +
                                    tiktokResult.toString() +
                                    " " +
                                    AppLocalizations.of(context)
                                        .lblRyal,
                                textAlign: TextAlign.center,
                                style: MansaFont
                                    .baseFontStyleWithBackground(),
                              )
                                  : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                widget.shoppingCart.socials.contains(3)
                    ? Container(
                        //Instagram
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: widget.shoppingCart.Sector == "حكومي"
                                  ? Text(
                                      AppLocalizations.of(context)
                                              .lblGovInstagram +
                                          instagramResult.toString() +
                                          " " +
                                          AppLocalizations.of(context).lblRyal,
                                      textAlign: TextAlign.center,
                                      style: MansaFont
                                          .baseFontStyleWithBackground(),
                                    )
                                  : widget.shoppingCart.Sector == "أفراد"
                                      ? Text(
                                          AppLocalizations.of(context)
                                                  .lblSpecialInstagram +
                                              instagramResult.toString() +
                                              " " +
                                              AppLocalizations.of(context)
                                                  .lblRyal,
                                          textAlign: TextAlign.center,
                                          style: MansaFont
                                              .baseFontStyleWithBackground(),
                                        )
                                      : widget.shoppingCart.Sector ==
                                              "جمعيات خيريه"
                                          ? Text(
                                              AppLocalizations.of(context)
                                                      .lblCharitiesInstagram +
                                                  instagramResult.toString() +
                                                  " " +
                                                  AppLocalizations.of(context)
                                                      .lblRyal,
                                              textAlign: TextAlign.center,
                                              style: MansaFont
                                                  .baseFontStyleWithBackground(),
                                            )
                                          : widget.shoppingCart.Sector ==
                                  "خاص"
                                  ? Text(
                                AppLocalizations.of(context).locale == "en"? "private instagram price" : "سعر خاص انستجرام "
                                 +
                                    instagramResult.toString() +
                                    " " +
                                    AppLocalizations.of(context)
                                        .lblRyal,
                                textAlign: TextAlign.center,
                                style: MansaFont
                                    .baseFontStyleWithBackground(),
                              )
                                  : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                widget.shoppingCart.socials.contains(4)
                    ? Container(
                        //Twitter
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: widget.shoppingCart.Sector == "حكومي"
                                  ? Text(
                                      AppLocalizations.of(context)
                                              .lblGovTwitter +
                                          twitterResult.toString() +
                                          " " +
                                          AppLocalizations.of(context).lblRyal,
                                      textAlign: TextAlign.center,
                                      style: MansaFont
                                          .baseFontStyleWithBackground(),
                                    )
                                  : widget.shoppingCart.Sector == "أفراد"
                                      ? Text(
                                          AppLocalizations.of(context)
                                                  .lblSpecialTwitter +
                                              twitterResult.toString() +
                                              " " +
                                              AppLocalizations.of(context)
                                                  .lblRyal,
                                          textAlign: TextAlign.center,
                                          style: MansaFont
                                              .baseFontStyleWithBackground(),
                                        )
                                      : widget.shoppingCart.Sector ==
                                              "جمعيات خيريه"
                                          ? Text(
                                              AppLocalizations.of(context)
                                                      .lblCharitiesTwitter +
                                                  twitterResult.toString() +
                                                  " " +
                                                  AppLocalizations.of(context)
                                                      .lblRyal,
                                              textAlign: TextAlign.center,
                                              style: MansaFont
                                                  .baseFontStyleWithBackground(),
                                            )
                                          : widget.shoppingCart.Sector ==
                                  "خاص"
                                  ? Text(
                                AppLocalizations.of(context).locale == "en"? "private twitter price" : "سعر خاص تويتر " +
                                    twitterResult.toString() +
                                    " " +
                                    AppLocalizations.of(context)
                                        .lblRyal,
                                textAlign: TextAlign.center,
                                style: MansaFont
                                    .baseFontStyleWithBackground(),
                              )
                                  : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                widget.shoppingCart.socials.contains(5)
                    ? Container(
                        //Snapshat
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: widget.shoppingCart.Sector == "حكومي"
                                  ? Text(
                                      AppLocalizations.of(context)
                                              .lblGovSnapshat +
                                          snapshatResult.toString() +
                                          " " +
                                          AppLocalizations.of(context).lblRyal,
                                      textAlign: TextAlign.center,
                                      style: MansaFont
                                          .baseFontStyleWithBackground(),
                                    )
                                  : widget.shoppingCart.Sector == "أفراد"
                                      ? Text(
                                          AppLocalizations.of(context)
                                                  .lblSpecialSnapshat +
                                              snapshatResult.toString() +
                                              " " +
                                              AppLocalizations.of(context)
                                                  .lblRyal,
                                          textAlign: TextAlign.center,
                                          style: MansaFont
                                              .baseFontStyleWithBackground(),
                                        )
                                      : widget.shoppingCart.Sector ==
                                              "جمعيات خيريه"
                                          ? Text(
                                              AppLocalizations.of(context)
                                                      .lblCharitiesSnapshat +
                                                  snapshatResult.toString() +
                                                  " " +
                                                  AppLocalizations.of(context)
                                                      .lblRyal,
                                              textAlign: TextAlign.center,
                                              style: MansaFont
                                                  .baseFontStyleWithBackground(),
                                            )
                                          : widget.shoppingCart.Sector ==
                                  "خاص"
                                  ? Text(
                                AppLocalizations.of(context).locale == "en"? "private snapchat price" : "سعر خاص سناب شات " +
                                    snapshatResult.toString() +
                                    " " +
                                    AppLocalizations.of(context)
                                        .lblRyal,
                                textAlign: TextAlign.center,
                                style: MansaFont
                                    .baseFontStyleWithBackground(),
                              )
                                  : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                widget.shoppingCart.socials.contains(6)
                    ? Container(
                        //Snapshat
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: widget.shoppingCart.Sector == "حكومي"
                                  ? Text(
                                      AppLocalizations.of(context)
                                              .lblGovYoutube +
                                          youtubeResult.toString() +
                                          " " +
                                          AppLocalizations.of(context).lblRyal,
                                      textAlign: TextAlign.center,
                                      style: MansaFont
                                          .baseFontStyleWithBackground(),
                                    )
                                  : widget.shoppingCart.Sector == "أفراد"
                                      ? Text(
                                          AppLocalizations.of(context)
                                                  .lblSpecialYoutube +
                                              youtubeResult.toString() +
                                              " " +
                                              AppLocalizations.of(context)
                                                  .lblRyal,
                                          textAlign: TextAlign.center,
                                          style: MansaFont
                                              .baseFontStyleWithBackground(),
                                        )
                                      : widget.shoppingCart.Sector ==
                                              "جمعيات خيريه"
                                          ? Text(
                                              AppLocalizations.of(context)
                                                      .lblCharitiesYoutube +
                                                  youtubeResult.toString() +
                                                  " " +
                                                  AppLocalizations.of(context)
                                                      .lblRyal,
                                              textAlign: TextAlign.center,
                                              style: MansaFont
                                                  .baseFontStyleWithBackground(),
                                            )
                                          : widget.shoppingCart.Sector ==
                                  "خاص"
                                  ? Text(
                                AppLocalizations.of(context).locale == "en"? "private youtube price" : "سعر خاص يوتيوب " +
                                    youtubeResult.toString() +
                                    " " +
                                    AppLocalizations.of(context)
                                        .lblRyal,
                                textAlign: TextAlign.center,
                                style: MansaFont
                                    .baseFontStyleWithBackground(),
                              )
                                  : Container(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        // wrap your Column in Expanded
                        child: Text(
                          AppLocalizations.of(context).lblTotal +
                              totalPrice.toString() +
                              " " +
                              AppLocalizations.of(context).lblRyal,
                          textAlign: TextAlign.center,
                          style: MansaFont.baseFontStyleWithBackground(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.red, Colors.yellow],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.5, 2.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 40,
                              )
                            ],
                          ),
                          child: FlatButton(
                              child: Text("المشاهير",
                                  style: MansaFont.getBoldnext()),
                              onPressed: () {
                                Go_ToFamous();
                              }

                              //  onPressed: (){
                              //    Navigator.of(context).push(MaterialPageRoute(
                              //                builder: (context) => Famous(),));

                              //  }
                              // onPressed: onPress,
                              )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                                colors: [lightBgColor, transColor],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.5, 2.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 40,
                              )
                            ],
                          ),
                          child: FlatButton(
                              child: Text(AppLocalizations.of(context).lblNext,
                                  style: MansaFont.getBoldnext()),
                              onPressed: () {
                                send_data();
                              }
                              // onPressed: onPress,
                              )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Go_ToFamous() {
    widget.shoppingCart.Age = age;
    widget.shoppingCart.Duration = duration;
    widget.shoppingCart.ViewNumbers = vNumbers;
    widget.shoppingCart.Price = double.parse(totalPrice);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FamousV2(
        shoppingCart: widget.shoppingCart,
      ),
    ));
  }

  send_data() {
    try {
      showAppLoading(context);
      widget.shoppingCart.Age = age;
      widget.shoppingCart.StartAge = startAge;
      widget.shoppingCart.Duration = duration;
      widget.shoppingCart.ViewNumbers = vNumbers;
      widget.shoppingCart.Price = double.parse(totalPrice);
      ShoppingCartApi.addToShoppingCar(widget.shoppingCart).then((response) {
        if (response.code == 200) {
          hideAppDialog(context);
          // showInSnackBar("تم اضافه الخدمه الي سله الطلبات", context, _scaffoldKey);
          showInSnackBarAfterAddService(
              AppLocalizations.of(context).lblServiceAdded,
              context,
              _scaffoldKey);

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
    } catch (error) {
      print("object");
      print(error.toString());
      hideAppDialog(context);
    }
    ;
  }
}

class Display extends StatefulWidget {
  int i, f;

  Display({this.i, this.f}) {}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DisplayState(i: i, f: f);
  }
}

class DisplayState extends State<Display> {
  int i, f;
  int value;

  DisplayState({this.i, this.f}) {
    var rand = new Random();
    if (i.toInt() == f.toInt()) {
      value = i.toInt();
      return;
    }
    value = i.toInt() + rand.nextInt(f.toInt() - i.toInt());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Container(
          width: 300,
          height: 300,
          color: Colors.amber,
          child: Center(
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 100.0,
                color: Colors.black,
              ),
            ),
          ),
        )),
        floatingActionButton: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "1",
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FloatingActionButton(
              heroTag: "2",
              child: Icon(Icons.replay),
              onPressed: () {
                generateRandomNumber();
              },
            ),
          ],
        ));
  }

  void generateRandomNumber() {
    var rand = new Random();

    setState(() {
      if (i.toInt() == f.toInt()) {
        value = i.toInt();
        return;
      }
      value = i.toInt() + rand.nextInt(f.toInt() - i.toInt() + 1);
    });
  }




}
