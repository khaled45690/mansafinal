import 'package:credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../localizations.dart';

class PaymentByVisaScreen extends StatefulWidget {
  final totalPayment;
  final List cartData;

  const PaymentByVisaScreen({this.totalPayment, this.cartData});
  @override
  _PaymentByVisaScreenState createState() => _PaymentByVisaScreenState();
}

class _PaymentByVisaScreenState extends State<PaymentByVisaScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Map data = {
    "cardNumber": "",
    "expiredDate": "",
    "cardHolderName": "",
    "cvCode": "",
  };
  bool isCvFocused = false;
  onChange(value, valueName) {
    setState(() {
      data[valueName] = value;
      if (valueName == "cvCode") {
        isCvFocused = true;
      } else {
        isCvFocused = false;
      }
    });
  }

  showAppLoading(BuildContext context, {String msg}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.grey.shade400.withOpacity(0.4),
      child: Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            msg != null
                ? Text(msg, style: MansaFont.gettitleFontinside_blue() ,)
                : Container(),
            RefreshProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(mainColor),
            ),
          ],
        ),
      ),
    );
    isDialogShowing = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [lightBgColor, transColor],
                begin: const FractionalOffset(0.1, 0.8),
                end: const FractionalOffset(1.0, 0.5),
                tileMode: TileMode.clamp),
          ),
        ),
        title: new Text(
          AppLocalizations.of(context).locale == "en"
              ? "credit card payment"
              : "الدفع عن طريق الفيزا",
          style: MansaFont.baseFontStyle(),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0.0,
        leading: new IconButton(
            icon: new IconButton(icon: new Image.asset("images/asset17.png")),
            iconSize: 40.0,
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        actions: <Widget>[
          IconButton(
              icon: AppLocalizations.of(context).locale == "en"
                  ? Image.asset("images/1-01.png")
                  : Image.asset("images/asset32.png"),
              iconSize: 30.0,
              onPressed: () => Navigator.of(context).pop()),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              color: Colors.white,
              child: Column(
                children: [
                  CreditCardWidget(
                    cardNumber: data["cardNumber"],
                    expiryDate: data["expiredDate"],
                    cardHolderName: data["cardHolderName"],
                    cvvCode: data["cvCode"],
                    showBackView: isCvFocused,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    animationDuration: Duration(milliseconds: 1000),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(hintText: "رقم البطاقة"),
                      onChanged: (value) {
                        onChange(value, "cardNumber");
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(hintText: "تاريخ الانتهاء"),
                      onChanged: (value) {
                        onChange(value, "expiredDate");
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(hintText: "اسم حامل البطاقة"),
                      onChanged: (value) {
                        onChange(value, "cardHolderName");
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "رمز السى فى"),
                      onChanged: (value) {
                        onChange(value, "cvCode");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  appButtonbgimage(
                      // Strings.Next(),
                      // () => Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => Emarkiting_campaigns())),
                      AppLocalizations.of(context).lblPayNow,
                      () {},
                      bgColor: lightBgColor,
                      bgColor2: transColor),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          // showAppLoading(context, msg: "please wait"),
        ],
      ),
    );
  }
}
