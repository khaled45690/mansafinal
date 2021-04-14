
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/ContentApi.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/ui/AboutApp.dart';
import 'package:mansaapp/ui/Ads.dart';
import 'package:mansaapp/ui/ChangePassword.dart';
import 'package:mansaapp/ui/ContactUs.dart';
import 'package:mansaapp/ui/CreatePayment.dart';
import 'package:mansaapp/ui/MyCart.dart';
import 'package:mansaapp/ui/MyOrders.dart';
import 'package:mansaapp/ui/Offers.dart';
import 'package:mansaapp/ui/Ourservices.dart';
import 'package:mansaapp/ui/SigninScreen.dart';
import 'package:mansaapp/ui/Terms.dart';
import 'package:mansaapp/ui/Update_useraccount.dart';

import '../localizations.dart';
import 'customcolors.dart';
class buildDrawer extends StatefulWidget {

  @override
  __buildDrawerState createState() => new __buildDrawerState();
}

class __buildDrawerState extends State<buildDrawer> {
  BuildContext _context;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
bool AllowChangePass = false;
 @override
  void initState() {
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
    // ContentApi.getContactUs().then((response){
    //   if(response.code !=200){
    //   }else {
    //       setState(() {
    //         if(response.message=="0"){
    //           AllowChangePass =true;
    //         }else{
    //           AllowChangePass = false;
    //         }
    //     });
        
        
    //   }

    // },onError: (error){
    //   setState(() {
    //     print("Error response.data.ValueAr");
    //   });
    //   print("getting moreDetails error : : : $error");
    // });
    
  }
  UserVM user ;
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    _context = context;
    return Drawer(
      key: _scaffoldKey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
             
              UserAccountsDrawerHeader(
                accountName:user==null||user.userName==null||user.email==""?Text(AppLocalizations.of(context).locale=="en"?"Please Login":"من فضلك قم بتسجيل الدخول"): Text(user.userName),
            accountEmail: user==null||user.email==null||user.email==""?Text(""):Text(user.email),
            currentAccountPicture:user==null||user.email==null||user.email==""?
               Padding(
                          padding:EdgeInsets.all(0.0),
                          child: Image.asset('images/asset18.png' , width: 500,height: 500,),
                        ):Padding(
                          padding:EdgeInsets.all(0.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage(user.image),
                            backgroundColor: Colors.transparent,
                          ),
                          
                          
                          //Image.network(user.image , width: 500,height: 500,),
                        ),
               
            decoration: BoxDecoration(color: Colors.blueAccent),
            
                // accountName: new Text(
                //     name, style: MansaFont.getmenufont(), textScaleFactor: 1.5),
                // accountEmail: new Text(email, style: MansaFont.getmenufont(),
                //     textScaleFactor: 1.5),
                // currentAccountPicture: imageprofile.isEmpty ? 
                // Container(
                //   child: Column(
                //     children: <Widget>[
                //       // Material(
                //       //   elevation:100,
                //       //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                //       //   child: Padding(
                //       //     padding:EdgeInsets.all(100.0),
                //       //     child: Image.asset('images/asset18.png' , width: 500,height: 500,),
                //       //   ),
                //       // ),
                //       Image.asset('images/asset18.png' , width: 200,height: 200,),
                //       Text("Osama" , style:TextStyle(color:Colors.white,fontSize:20.0))
                //     ],
                //   ),
                // )
                
                //     : NetworkImage(imageprofile),
                // decoration: new BoxDecoration(
                //   color: gray,
                //   gradient: new LinearGradient(
                //       colors: [lightBgColor, transColor],
                //       begin: const FractionalOffset(0.1, 0.8),
                //       end: const FractionalOffset(1.0, 0.5),
                //       tileMode: TileMode.clamp
                //   ),
                // ),
                
              ),
              
              ListTile(
                title: Text(AppLocalizations.of(context).lblOur_Services,
                  style: MansaFont.baseRegularcolorFontE(),),
               contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                 // _scaffoldKey.currentState.openDrawer();
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => Ourservices()));
                  
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                    //new Text(AppLocalizations.of(context).lblOur_Services,
                  //style: MansaFont.baseRegularcolorFontE(),),
                  ],
                ),
              ),
              user==null||user.email==null||user.email==""?Container():Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              user==null||user.email==null||user.email==""?Container():ListTile(
                title: Text(AppLocalizations.of(context).lblMy_Orders ,
                  style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => MyCart()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(AppLocalizations.of(context).lblMy_Orders ,
                  // style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              user==null||user.email==null||user.email==""?Container():Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              user==null||user.email==null||user.email==""?Container():ListTile(
                title: Text(
                  AppLocalizations.of(context).lblPayment, style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => CreatePayment()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lblPayment, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              user==null||user.email==null||user.email==""?Container():Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              user==null||user.email==null||user.email==""?Container():ListTile(
                title: Text(
                  AppLocalizations.of(context).lblMyBills, style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => MyOrders()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lblPayment, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              (user==null||user.email==null||user.email=="")?Container():Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              (user==null||user.email==null||user.email=="")?Container():ListTile(
                title: Text(
                  AppLocalizations.of(context).lblChangePassword, style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => ChangePassword()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lblPayment, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              (user==null||user.email==null||user.email=="")?Container():Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              (user==null||user.email==null||user.email=="")?Container():ListTile(
                title: Text(
                  AppLocalizations.of(context).lblUpdateProfile, style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => Update_useraccount()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lblPayment, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context).lblLast_Ads, style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => Ads()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lblLast_Ads, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context).lblOffers, style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => Offers()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lblLast_Ads, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).lblTerms_and_Conditions,
                  style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => Terms()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(AppLocalizations.of(context).lblTerms_and_Conditions,
                  // style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).lblAboutApp,
                  style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => AboutApp()));
                //  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(AppLocalizations.of(context).lblAboutApp,
                  // style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).lblContact_Us,
                  style: MansaFont.baseRegularcolorFont(),),
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => ContactUs()));
                  _scaffoldKey.currentState.openDrawer();
                },
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(AppLocalizations.of(context).lblContact_Us,
                  // style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
              user==null||user.email==null||user.email==""?ListTile(
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                title: Text(
                  AppLocalizations.of(context).lbllogin, style: MansaFont.baseRegularcolorFont(),),
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lbllogout, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
                onTap: () {
                  Navigator.pop(context);
                 // _scaffoldKey.currentState.openDrawer();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SigninScreen()));
                },
              ):ListTile(
                contentPadding: EdgeInsets.fromLTRB(40.0,0,40.0,0),
                title: Text(
                  AppLocalizations.of(context).lbllogout, style: MansaFont.baseRegularcolorFont(),),
                trailing: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  //  new StarRating(starCount: 5, rating: pro.rating, color: Colors.amber),
                  //   new Text(
                  // AppLocalizations.of(context).lbllogout, style: MansaFont.baseRegularcolorFont(),),
                  ],
                ),
                
                onTap: () {
                  // Preferences().setUserId("");
                  // Preferences().setusername("");
                  // Preferences().setemail("");
                  // Preferences().setPassword("");
                  // Preferences().setPhone("");
                  // Preferences().setimage("");
                  // Preferences().setfacebookKey("");
                  // Preferences().setfcmID("");
                  // Preferences().setphoneKey_2("");
                  // Preferences().setservicid("");
                 // _scaffoldKey.currentState.openDrawer();
                 clear();
                 Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SigninScreen()));
                },
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
                height: 2.0,
                color: gray,
              ),
            ],
          ),
        );
  }



  @override
  Future dispose() {
    super.dispose();
  }


}












        