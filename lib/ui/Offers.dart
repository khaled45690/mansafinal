import 'dart:collection';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:mansaapp/APIs/OfferApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Models/OfferVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'MyCart.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';

class Offers extends StatefulWidget{
 
  // ContactUs():super();

  @override
  MyHomePage createState() {
    return MyHomePage();
  }
}


class MyHomePage extends State<Offers>{

bool apiCall = true ;
   @override
  void initState() {
    super.initState();
    //post=getAboutApp();
    OfferApi.getOffers().then((response){
      if(response.code !=200){
        Navigator.pop(context);
      }else {
        setState(() {
         this.offers = response.data;
         setState(() {
          this.apiCall = false ;
        });
          //this.apiCall = false;
        });
      }

    },onError: (error){
      setState(() {
        print("Error response.data.ValueAr");
         //this.content = response.data;
        //this.apiCall = false ;
      });
      print("getting moreDetails error : : : $error");
    });
  }

List<OfferVM> offers = new List<OfferVM>();
  @override
  void dispose() {
    super.dispose();
  }

    BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String dropdownValue = 'One';
  String name="";
  String email="";
  String imageprofile="";
  double priceAsTxt;
  @override
  Widget build(BuildContext context){
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
          title: new Text(
            AppLocalizations.of(context).lblOffers,
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
      body: this.apiCall ? Center(child: CircularProgressIndicator(),):GridView.builder(
                      // padding: EdgeInsets.only(
                      //     left: 16.0, right: 16.0 ,bottom: 16.0),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //crossAxisSpacing: 16.0,
                       // mainAxisSpacing: 16.0,
                        // childAspectRatio:
                        // (MediaQuery.of(context).size.width / 2 - 48) /
                        //     (MediaQuery.of(context).size.height /
                        //         3.5),
                      ),
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        OfferVM offer = offers[index];
                        priceAsTxt=offer.Price;
                        return InkWell(
                         
                          child: Container(
                          height: 20,
                          child: Card(
                            child:Column(
                              children: <Widget>[
                                Image.network(
                                  offer.Image,
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  height: 20,
                                ),
                                Center(
                                  child: new Text(AppLocalizations.of(context).locale=="en" ?offer.TitleEn:offer.TitleAr,style: MansaFont.baseRegularcolorFontE()),
                                ),
                                Center(
                                  child: new Text(AppLocalizations.of(context).locale=="en" ?"Offer Price $priceAsTxt":'سعر العرض $priceAsTxt',style: MansaFont.baseRegularcolorFontE()),
                                ),
                                Center(
                                  child: new Text(AppLocalizations.of(context).locale=="en" ?offer.Description:offer.DescriptionAr,style: MansaFont.baseRegularcolorFontE()),
                                ),
                              ],
                            ),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 7,
                          margin: EdgeInsets.all(10),
                        ),
                        ),
                        );


                      }),
      drawer: buildDrawer()
    );
  }
}





// new GridView.builder(
//         itemCount: offers.length,
//         itemBuilder: (context, index) {
//                         OfferVM offer = offers[index];
//                  GridTile(
//             child:Container(
//               height: 20,
//               child: Card(
//                 child:Column(
//                   children: <Widget>[
//                      Image.network(
//                       offer.Image,
//                       fit: BoxFit.fill,
//                     ),
//                     Center(
//                       child: new Text(offer.TitleAr),
//                     ),
//                     Center(
//                       child: new Text(offer.Price.toString())
//                     )
//                   ]
//                 ),
//               semanticContainer: true,
//               clipBehavior: Clip.antiAliasWithSaveLayer,
              
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 7,
//               margin: EdgeInsets.all(10),
//             ),
//             ),
            
//             );
//           }
//         ),











///
///
// new GridView.count(
//         crossAxisCount: 1,
//         children: new List<Widget>.generate(16, (index) {
//           return new GridTile(
//             child:Container(
//               height: 20,
//               child: Card(
//                 child:Column(
//                   children: <Widget>[
//                      Image.asset(
//                       'images/offer.jpg',
//                       fit: BoxFit.fill,
//                     ),
//                     Center(
//                       child: new Text('عرض علي خدمه لوجو '),
//                     ),
//                     Center(
//                       child: new Text('سعر العرض 5 ريال'),
//                     )
//                   ],
//                 ),
//               semanticContainer: true,
//               clipBehavior: Clip.antiAliasWithSaveLayer,
              
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 7,
//               margin: EdgeInsets.all(10),
//             ),
//             ),
            
             
            
//             // new Card(
//             //   color: Colors.blue.shade200,
//             //   child: new Center(
//             //     child: new Text('عرض رقم  $index'),
//             //   )
//             );
          
//         }),
//       ),