import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/ui/PaymentByVisaScreen.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:mansaapp/utilis/json_table.dart';
import 'package:mansaapp/utilis/json_table_column.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'ContactUs.dart';
import 'CreatePayment.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => new _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String name = "";
  String email = "";
  String imageprofile = "";
  bool monVal = false;
  String jsonSample = '[{"name":"1","Orders":"Facebook","Price":"200"},'
      '{"name":"2","Orders":"Facebook","Price":"200"},'
      '{"name":"5","Orders":"Facebook","Price":"200"}'
      ']';
  String s = '';
  bool toggle = true;
  List<JsonTableColumn> columns;
  double subTotal = 0;
  double tax = 0;
  var json = null;

  @override
  void initState() {
    super.initState();
    print("SSSSSSSSSSSSSSSS");
    // columns = [
    //   JsonTableColumn("name", label: "No."),
    //   JsonTableColumn("Orders", label: "Orders"),
    //   JsonTableColumn("Price", label: "Price"),
    // ];
    int loopCount = 0;
    var sPrice = "";
    var serviceName = "";

    getUser().then((user) {
      setState(() {
        this.user = user;
        if (user != null) {
          ShoppingCartApi.getShoppingCarForUser(user.user_Id).then((response) {
            if (response.code == 200) {
              shoppingCarts = response.data;
              print(shoppingCarts.length);
              shoppingCarts.forEach((cart) {
                if (cart.ServiceId == 1) {
                  serviceName = AppLocalizations.of(context).lblWeb_Desgin;
                } else if (cart.ServiceId == 2) {
                  serviceName = AppLocalizations.of(context).lblMobile_App;
                } else if (cart.ServiceId == 3) {
                  serviceName = AppLocalizations.of(context).lblLogo;
                } else if (cart.ServiceId == 4) {
                  serviceName = AppLocalizations.of(context).lblImages;
                } else if (cart.ServiceId == 5) {
                  serviceName = AppLocalizations.of(context).lblVideo_2D_3D;
                } else if (cart.ServiceId == 6) {
                  serviceName = AppLocalizations.of(context).lblInfographics;
                } else if (cart.ServiceId == 7) {
                  serviceName =
                      AppLocalizations.of(context).lblEMarketing_compaigns;
                } else if (cart.ServiceId == 8) {
                  serviceName =
                      "${AppLocalizations.of(context).locale == "en" ? AppLocalizations.of(context).lblAdsVideo : "تصوير فديو اعلانى"}";
                } else {
                  serviceName = "Service Not Exist";
                }
                loopCount = loopCount + 1;
                subTotal = subTotal + cart.Price;
                if (loopCount == 1) {
                  s = s + '[';
                }
                sPrice = cart.Price.toString();
                print("-------------------s-------------------");
                print(s);
                print("-------------------jsonSample-------------------");
                print(jsonSample);

                if (loopCount == shoppingCarts.length) {
                  s = s +
                      '{"name":"$loopCount","Orders":"$serviceName","Price":"$sPrice"}';
                  s = s + ']';
                } else {
                  s = s +
                      '{"name":"$loopCount","Orders":"$serviceName","Price":"$sPrice"},';
                }
              });
              json = jsonDecode(s);
              // tax = (int.parse(response.message)/100)*subTotal;
              tax = 0;
              // jsonSample=s;
            } else {
              print("${response.message}");
            }
            setState(() {});
          });
        }
      });
    });
    if (user != null) {
      print("user.emaillllllllllllllllllll");
      print(user.email);
    }
  }

  UserVM user;
  List<ShoppingCartVM> shoppingCarts;

  @override
  Widget build(BuildContext context) {
    print(json);
    columns = [
      JsonTableColumn("name", label: AppLocalizations.of(context).lblNo),
      JsonTableColumn("Orders", label: AppLocalizations.of(context).lblOrder),
      JsonTableColumn("Price", label: AppLocalizations.of(context).lblPrice),
    ];
    // TODO: implement getBody
    _context = context;
    //var json = jsonDecode(jsonSample);
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                height: 20,
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 5, left: 5, bottom: 0, top: 20),
              //   child: Text("Order No.22231",
              //       textAlign: TextAlign.center,
              //       style: MansaFont.gettitleFont()),
              // ),
              Container(
                height: 20,
              ),
              json == null
                  ? Container()
                  : JsonTable(json, button3,
                      columns: columns, showColumnToggle: false),
              Container(
                height: 10,
              ),
              new Text(
                AppLocalizations.of(context).lblAddNotify,
                textAlign: TextAlign.center,
                style: MansaFont.getBoldFontinside_orange2(),
              ),
              Container(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context).lblSubTotal +
                          " " +
                          subTotal.round().toString() +
                          " " +
                          AppLocalizations.of(context).lblRyal,
                      //  textAlign: TextAlign.left,
                      style: MansaFont.baseFontStyleWithBackground(),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text("",
                  //   //  textAlign: TextAlign.center,
                  //     style: MansaFont.baseFontStyleWithBackground(),),
                  // ),
                ],
              ),
              Row(
                children: <Widget>[
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(AppLocalizations.of(context).lblTax+" " +tax.round().toString()+" "+AppLocalizations.of(context).lblRyal,
                  //    // textAlign: TextAlign.left,
                  //     style: MansaFont.baseFontStyleWithBackground(),),
                  // ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text("",
                  //     //textAlign: TextAlign.center,
                  //     style: MansaFont.baseFontStyleWithBackground(),),
                  // ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context).lblTotal +
                          " " +
                          (subTotal + tax.round()).toString() +
                          " " +
                          AppLocalizations.of(context).lblRyal,
                      //  textAlign: TextAlign.left,
                      style: MansaFont.baseFontStyleWithBackground(),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text("",
                  //     //textAlign: TextAlign.center,
                  //     style: MansaFont.baseFontStyleWithBackground(),),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: monVal,
                    onChanged: (bool value) {
                      setState(() {
                        monVal = value;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Terms()));
                    },
                    child: Text(
                      AppLocalizations.of(context).lblAgreeTerms,
                      textAlign: TextAlign.justify,
                      style: MansaFont.getLightFont_TextFormField(),
                    ),
                  ),
                  Container(
                    width: 30,
                  ),
                  Container(
                      // child: Text(
                      //   'Forget Password',
                      //   textAlign: TextAlign.justify,
                      //   style: MansaFont.getMediumFont_medium_blue(),
                      // ),
                      ),
                ],
              ),
              Container(
                height: 30,
              ),
              appButtonbgimage(AppLocalizations.of(context).lblPayNow,
                  () async {
                if (await canLaunch('https://mansa-app.com/Checkout.html')) {
                  await launch('https://mansa-app.com/Checkout.html');
                }
              }, bgColor: lightBgColor, bgColor2: transColor),
            ]),
          ),
        ),
        drawer: buildDrawer());
    // http://mansa-app.com/Checkout.html
  }

  @override
  Future dispose() {
    super.dispose();
  }
}
