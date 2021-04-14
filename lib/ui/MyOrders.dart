
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/PaymentAccountApi.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Models/OrderDataVM.dart';
import 'package:mansaapp/Models/ServiceVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/ui/CreatePayment.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:mansaapp/utilis/json_table.dart';
import 'package:mansaapp/utilis/json_table_column.dart';
import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'ContactUs.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';


class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => new _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

    BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String name="";
  String email="";
  String imageprofile="";
  bool monVal = false;
   String jsonSample =
      '[{"name":"1","Orders":"Facebook","Price":"200"},'
      '{"name":"2","Orders":"Facebook","Price":"200"},'
      '{"name":"5","Orders":"Facebook","Price":"200"}'
      ']'
      ;
      String s='';
  bool toggle = true;
  List<JsonTableColumn> columns;
  double subTotal=0;
     double tax=0;
var json=null;
  @override
  void initState() {
    super.initState();
    print("SSSSSSSSSSSSSSSS");
    // columns = [
    //   JsonTableColumn("name", label: "No."),
    //   JsonTableColumn("Orders", label: "Orders"),
    //   JsonTableColumn("Price", label: "Price"),
    // ];
     int loopCount=0;
     var sPrice="";
     var serviceName="";
     var ordNum=0;
    getUser().then((user){
      setState(() {
              this.user = user ;
              if(user!=null){
      PaymentAccountApi.getMyOrders(user.user_Id , AppLocalizations.of(context).locale).then((response) {
          if (response.code ==200 ) {
            ordersData = response.data;
            print(ordersData.length);
            ordersData.forEach((cart){
              loopCount=loopCount+1;
              subTotal=subTotal+cart.Price;
              if(loopCount==1){
                s=s+'[';
              }
              sPrice=cart.Price.toString();
              serviceName=cart.OrderServices;
              ordNum=cart.Id;
              print("-------------------s-------------------");
              print(s);
              print("-------------------jsonSample-------------------");
              print(jsonSample);
              
              if(loopCount==ordersData.length){
                s=s+'{"name":"$ordNum","Orders":"$serviceName","Price":"$sPrice"}';
                s=s+']';
              }else{
                s=s+'{"name":"$ordNum","Orders":"$serviceName","Price":"$sPrice"},';
              }
            });
             json= jsonDecode(s);
             tax = (5/100)*subTotal;
          // jsonSample=s;
          } else {
            print("${response.message}");
          }
          setState(() {
          });
        });
    }
      });
    });
    if(user!=null){
          print("user.emaillllllllllllllllllll");
      print(user.email);
    }
    
    
  }
UserVM user ;
List<OrderDataVM> ordersData ;

  @override
  Widget build(BuildContext context) {
    columns = [
      JsonTableColumn("name", label: AppLocalizations.of(context).lblNo),
      JsonTableColumn("Orders", label: AppLocalizations.of(context).lblOrder),
      JsonTableColumn("Price", label: AppLocalizations.of(context).lblPrice),
    ];
    // TODO: implement getBody
    _context = context;
    //var json =s==""?null: jsonDecode(s);
    
    return Scaffold(
          backgroundColor: bgColor,
          key: _scaffoldKey,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [lightBgColor, transColor],
                  begin: const FractionalOffset(0.1, 0.8),
                  end: const FractionalOffset(1.0, 0.5),
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          title: new Text(AppLocalizations.of(context).lblMyBills, style: MansaFont.baseFontStyle(),),
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

            padding: EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                json==null?Container():JsonTable(json, button3 ,columns: columns, showColumnToggle: false),
                    Container(
                      height: 10,
                    ),
                    // new Text(
                    //   AppLocalizations.of(context).lblAddNotify,
                    //   textAlign: TextAlign.center,
                    //   style: MansaFont.getBoldFontinside_orange2(),
                    // ),
                    Container(
                      height: 20,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text("", 
                    //         //textAlign: TextAlign.center,
                    //         style: MansaFont.baseFontStyleWithBackground(),),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(AppLocalizations.of(context).lblSubTotal+" "+subTotal.toString(), 
                    //         textAlign: TextAlign.left,
                    //         style: MansaFont.baseFontStyleWithBackground(),),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text("", 
                    //         //textAlign: TextAlign.center,
                    //         style: MansaFont.baseFontStyleWithBackground(),),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(AppLocalizations.of(context).lblTax+" " +tax.toString(), 
                    //         textAlign: TextAlign.left,
                    //         style: MansaFont.baseFontStyleWithBackground(),),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text("", 
                    //         //textAlign: TextAlign.center,
                    //         style: MansaFont.baseFontStyleWithBackground(),),
                    //     ),
                    //      Expanded(
                    //       flex: 1,
                    //       child: Text(AppLocalizations.of(context).lblTotal+" " +(subTotal+tax).toString(), 
                    //         textAlign: TextAlign.left,
                    //         style: MansaFont.baseFontStyleWithBackground(),),
                    //     ), 
                    //   ],
                    // ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Checkbox(
                        //   value: monVal,
                        //   onChanged: (bool value) {
                        //     setState(() {
                        //       monVal = value;
                        //     });
                        //   },
                        // ),
                        // InkWell(
                        //   onTap: (){
                        //     Navigator.of(context).push(
                        //  MaterialPageRoute(builder: (context) => Terms()));
                        //   },
                        //   child: Text(
                        //     AppLocalizations.of(context).lblAgreeTerms,
                            
                        //     textAlign: TextAlign.justify,
                        //     style: MansaFont.getLightFont_TextFormField(),
                        //   ),
                        // ),
                        // Container(
                        //   width: 30,
                        // ),
                        Container(
                          // child: Text(
                          //   'Forget Password',
                          //   textAlign: TextAlign.justify,
                          //   style: MansaFont.getMediumFont_medium_blue(),
                          // ),
                        ),
                      ],
                    ),
              //   Container(
              //     height: 30,
              //   ),
              //   appButtonbgimage(AppLocalizations.of(context).lblPayNow,
              //   () => Navigator.of(context).push(MaterialPageRoute(
              //                   builder: (context) => CreatePayment())),
              //  bgColor: lightBgColor,
              //  bgColor2: transColor),

              ]),
            ),
          ),
          drawer: buildDrawer()
        );

  }


  @override
  Future dispose() {
    super.dispose();
  }


}
