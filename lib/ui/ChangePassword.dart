
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/AuthApi.dart';
import 'package:mansaapp/APIs/ContentApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart'; 


class ChangePassword extends StatefulWidget{
  int id; // id for user or Store
   ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() {
    return _ChangePasswordState();
  }
}




class _ChangePasswordState extends State<ChangePassword> {
 BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String imageprofile="";
  bool apiCall = false ;
  UserVM user ;

     @override
  void initState() {
    super.initState();
    getUser().then((user){
      setState(() {
              this.user = user ;
      });
    });
    //post=getAboutApp();
    
  }
  @override
  void dispose() {
    super.dispose();
  }

  //  @override
  //  _launchFacebook(String url) async {
  //     //const url = content.facebook;
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  //   _launchWebsite() async {
  //     const url = 'elsouqsouqak.com';
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }

    TextEditingController newpassword = new TextEditingController();
    TextEditingController phone = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController message = new TextEditingController();
    TextEditingController complants = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          title: new Text(AppLocalizations.of(context).lblChangePassword,  style: MansaFont.baseFontStyle() ,) ,
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
      body: Column(
        children: <Widget>[
            
            // new SizedBox(height: 5.0),
            // Expanded(
            //   flex: 7,
            //   child: Container(
            //     // color: Color(0xFF9E9E9E),
            //     child: Text("اتصل بنا" , 
            // style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20.0,
            //         backgroundColor: Color(0xFF9E9E9E),
                    
            //         // padding: EdgeInsets.all(24.0),
            //         color: Colors.black),maxLines: 1,),
            //   ),
            // ),
            
            
             this.apiCall ? Center(child: CircularProgressIndicator(),):new Container(
              child:    Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(13),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 450,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.circular(13)),
                                  child: Column(
                                    children: <Widget>[
                                      
                                      Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width-32,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                                flex: 6,
                                                child: InkWell(
                                                  onTap:(){
                                                  },
                                                  child: new TextField(
                                                    controller: newpassword,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    keyboardType: TextInputType.text,
                                                    // controller: emailEditingContrller,
                                                    decoration: InputDecoration(
                                                        labelText: AppLocalizations.of(context).lblpassword,
                                                        // hintText: " الاسم",
                                                        labelStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                        // border: OutlineInputBorder(
                                                        //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                        //     borderSide: BorderSide(
                                                        //         width: 1.0,
                                                        //         color: Colors.green,
                                                        //         style: BorderStyle.solid))
                                                                ),
                                                  ),
                                                )),
                                           
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(top: 8 ,bottom: 8 , right: 32 , left: 32),
                                      //   child: Divider(height: 2, color: Colors.grey,),
                                      // ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(top: 8 ,bottom: 8 , right: 32 , left: 32),
                                      //   child: Divider(height: 2, color: Colors.grey,),
                                      // ),
                                      Container(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width-32,
                                        child: Row(
                                          children: <Widget>[
                                            
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap:(){
                                                    submitForm();
                                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FollowingProducts(this.user.id)));
                                                  },
                                                  child:RaisedButton(
                                                  onPressed: () {
                                                    // Validate returns true if the form is valid, otherwise false.
                                                   submitForm();
                                                  },
                                                  child: Text(AppLocalizations.of(context).lblConfirm),
                                                ),
                                                  // child: new FlatButton(
                                                  //   child: new Text("ارسال"),
                                                  //   // onPressed: () => Navigator.pop(context),
                                                  // ),
                                                )),
                                           
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             

                            ],
                          ),
                        ),
                  
                    ),
                  ),
                  flex: 3,
                ),
            
            
            ),
            
            // ListTile(
            //   title: Text('Item 1'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
          ],
      ),
      drawer: buildDrawer()
    );
  }


  Widget _getFormUI() {
    return new Column(
      children : <Widget>[
         
      SizedBox(
        height: 30.0,
      ),
      TextField(
        autofocus: false,
        obscureText: true,
        keyboardType: TextInputType.text,
        // controller: emailEditingContrller,
        decoration: InputDecoration(
            labelText: "Password",
            hintText: "Password",
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.green,
                    style: BorderStyle.solid))),
      ),
      SizedBox(
        height: 50.0,
      ),
      ButtonTheme(
        //elevation: 4,
        //color: Colors.green,
        minWidth: double.infinity,
        child: MaterialButton(
          onPressed: () => {},
          textColor: Colors.white,
          color: Colors.green,
          height: 50.0,
          child: Text("LOGIN"),
        ),
      ),
      ],
    );
  }
 


  submitForm() {
    // setState(() {
    //   this.addingApi = true;
    // });
    // print(widget.id);
    // int subcatId=0;
              showAppLoading(context);

    print(message.text);
    
    print(email.text);
    print(phone.text);
    print(complants.text);
   if(newpassword.text==null||newpassword.text==""){
        showInSnackBar("من فضلك قد بادراج جميع الحقول ", context, _scaffoldKey);
      }else{
        AuthApi.changePassWord(
              user.user_Id,
              newpassword.text,
            )
        .then((response) {
                      hideAppDialog(context);

           if (response.code ==200 ) {
            showInSnackBar(response.message, context, _scaffoldKey);
   
            //showInSnackBar("تم اضافه الخدمه الي سله الطلبات", _context, _scaffoldKey);
           // showSnack("تم اضافه الخدمه الي سله المهملات");
          } else {
                        showInSnackBar(response.message, context, _scaffoldKey);

            print("${response.message}");
            //showInSnackBar("${response.message}", context, _scaffoldKey);
          }
      setState(() {
        // this.addingApi = false;
      });
    }, onError: (error) {
      setState(() {
        // this.addingApi = false;
      });
     // print("adding product error : :$error");
    });
      }
   
}


}