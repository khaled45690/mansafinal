
import 'dart:convert';
import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:mansaapp/APIs/AuthApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Helper/slider.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../LocaleHelper.dart';
import '../TestGmailLogin.dart';
import '../localizations.dart';
import 'RememberPass.dart';
import 'SignupScreen.dart';
import 'TabBarScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Terms.dart';
import 'TestFamousV2.dart';
import 'TestFamousV3.dart';

// import 'TabBarScreen.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  SpecificLocalizationDelegate _specificLocalizationDelegate;

@override void initState() {
    // TODO: implement initState
    super.initState();
    helper.onLocaleChanged = onLocaleChange;
    _specificLocalizationDelegate =  SpecificLocalizationDelegate(new Locale("ar"));
    getUser().then((u) {
      setState(() {
        user=u;
      });
      
      });
  }
UserVM user;
 onLocaleChange(Locale locale){
    setState((){
     
      _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mansa',
      debugShowCheckedModeBanner: false,
     localizationsDelegates: [

     new FallbackCupertinoLocalisationsDelegate(),
       //app-specific localization
       _specificLocalizationDelegate
     ],

      supportedLocales: [Locale('en'),Locale('ar')],
     locale: _specificLocalizationDelegate.overriddenLocale ,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:user==null||user.user_Id==null?SigninScreen():TabBarScreen(),//TestFamousV2()//
    );
  }
}

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => new _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>{

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

// Future<UserCredential> _signIn(BuildContext context) async {
//
//    Scaffold.of(context).showSnackBar(new SnackBar(
//           content: new Text('Sign in'),
//         ));
//
//     final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//    UserCredential userDetails = await _firebaseAuth.signInWithCredential(credential);
//   ProviderDetails providerInfo = new ProviderDetails(userDetails.additionalUserInfo.providerId);
//
// List<ProviderDetails> providerData = new List<ProviderDetails>();
//     providerData.add(providerInfo);
//
//     UserDetails details = new UserDetails(
//         userDetails.additionalUserInfo.providerId,
//         userDetails.user.displayName,
//         userDetails.user.photoUrl,
//         userDetails.user.email,
//         providerData,
// );
// print(details.userEmail);
// print(details.userName);
//   Navigator.of(context).push(MaterialPageRoute(
//    builder: (context) => TabBarScreen()));
//     // Navigator.push(
//     //   context,
//     //   new MaterialPageRoute(
//     //     builder: (context) => new ProfileScreen(detailsUser: details),
//     //   ),
//     // );
//     return userDetails;
//   }

  SpecificLocalizationDelegate _specificLocalizationDelegate;
bool _obscureText = true ;
void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
@override void initState() {
    // TODO: implement initState
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey_log =
      new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _form_log = GlobalKey<FormState>();
  var passKey_log = GlobalKey<FormFieldState>();
  var phoneKey_log = GlobalKey<FormFieldState>();
  // AuthenticationBloc _bloc = AuthenticationBloc();

  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  GlobalKey key;
  static bool isAr = true;
  String location;
  File _image = null;
  String urlImage = "";
  bool monVal = false;
  bool loading = true;
  GoogleSignInAccount _currentUser;
  String _contactText;
  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    _context = context;
    return Scaffold(
        key: _scaffoldKey_log,
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
          leading: Container(),
          title: new Text(
           AppLocalizations.of(context).lblLogin_Welcome,
            style: MansaFont.baseFontStyle2(),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.0,
        ),
        
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          child:Row(
                            children: <Widget>[
                              CupertinoSwitch(
                          activeColor: button3,
                          value: AppLocalizations.of(context).locale=="en"?true:false,
                          onChanged: (bool value) {
                            
                              if (AppLocalizations.of(context).locale == "en") {
                                this.setState((){
                                  print("ar");
                                  helper.onLocaleChanged(new Locale("ar"));
                                });
                              } else {
                                this.setState((){
                                  print("En");
                                  helper.onLocaleChanged(new Locale("en"));
                                });
                              }
                         
                          },
                        ),
                        Text(
                          "  ${AppLocalizations.of(context).locale=="en" ? "EN" : "عربي"}",
                          style: MansaFont.baseRegularcolorFont(),
                        ),
                            ],
                          ),
                          
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(child: Text(AppLocalizations.of(context).lblViewTxt),
                            onPressed:(){
                               Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TabBarScreen()));
                            } ,
                            //color: Color(16056319),
                            //textColor: Colors.black,
                            
                           // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),padding: EdgeInsets.all(20),
                            splashColor: Color(16056319),
                            shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)
                            ),
                            //shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white)),
                          )
                        ),
                    ],
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image.asset(
                      AppLocalizations.of(context).lblLogoSrc,
                      height: 100,
                      width: 250,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  userNameInputs(),
                ],
              ),
            ),
          ),
        ),
      );
  }

  userNameInputs() {
    setState(() {
      _context = context;  
    });
    
    return Container(
      child: Center(child: _buildCard()),
    );
  }
  // #docregion Card
  Widget _buildCard() => SizedBox(
        child: Form(
          key: _form_log,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    cursorColor: desgin_button4_end,
                    key: phoneKey_log,
                    keyboardType: TextInputType.text,
                    textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                    style: MansaFont.getLightFont(),
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lblemail,
                      labelStyle: MansaFont.getLightFont_TextFormField(),
                      fillColor: gray,
                      hintText: AppLocalizations.of(context).lblemailPlaceholder,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 17.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: grey_ligth, width: 0.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: desgin_button4_end, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  )),
                  Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: TextFormField(
                                maxLines: 1,
                                obscureText: _obscureText,
                                textInputAction: TextInputAction.next,
                                cursorColor: desgin_button4_end,
                                key: passKey_log,
                                keyboardType: TextInputType.visiblePassword,
                                textAlign:  AppLocalizations.of(context).locale=="en"?TextAlign.left:TextAlign.right,
                                style: MansaFont.getLightFont(),
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context).lblpassword,
                                  labelStyle: MansaFont.getLightFont_TextFormField(),
                                  fillColor: gray,
                                  hintText: AppLocalizations.of(context).lblpasswordPlaceholder,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 17.0, horizontal: 10.0),
                                  // border: OutlineInputBorder(
                                  //   borderSide:
                                  //       const BorderSide(color: grey_ligth, width: 0.0),
                                  //   borderRadius: BorderRadius.circular(25.0),
                                  // ),
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: const BorderSide(
                                  //       color: desgin_button4_end, width: 1.0),
                                  //   borderRadius: BorderRadius.circular(25.0),
                                  // ),
                                ),
                              )
                            ),
                            AppLocalizations.of(_context).locale=="en"? Positioned(top: 3.0,
                              right: 0.0,
                              child:IconButton(
                                icon: _obscureText ==true ?Icon(Icons.visibility_off ,color: Colors.grey,) :Icon(Icons.visibility ,color: Colors.grey,),
                                onPressed: _toggle,
                              ) ,
                            ):Positioned(top: 3.0,
                              left: 0.0,
                              child:IconButton(
                                icon: _obscureText ==true ?Icon(Icons.visibility_off ,color: Colors.grey,) :Icon(Icons.visibility ,color: Colors.grey,),
                                onPressed: _toggle,
                              ) ,
                            ),
                          ],
                        ),
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
                        Container(
                          child: Text(
                            AppLocalizations.of(context).lblRemember,
                            
                            textAlign: TextAlign.justify,
                            style: MansaFont.getMediumFont_small(),
                          ),
                        ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                          onTap: (){
                            Navigator.of(_context).push(
                         MaterialPageRoute(builder: (context) => RememberPass()));//RememberPass
                          },
                          child: Text(
                              AppLocalizations.of(_context).lblDoYouRememberPass,
                              textAlign:  AppLocalizations.of(_context).locale=="en"?TextAlign.right:TextAlign.left,
                              style: MansaFont.getLightFont_TextFormField(),
                            ),
                        ),
                  ),
                  
                  Container(
                    width: 30,
                  ),
                  Container(
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
                    // wrap your Column in Expanded
                    child: Column(
                      children: <Widget>[
                        appButtonbgimage(AppLocalizations.of(context).lbllogin, () => getLogin(),
                            bgColor: lightBgColor, bgColor2: transColor),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 5,
              ),
              // Container(
              //   child: Text(
              //      AppLocalizations.of(context).lblOr,
              //     textAlign: TextAlign.justify,
              //
              //     style: MansaFont.getMediumFont_medium2(),
              //   ),
              // ),
              Container(
                height: 5,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Expanded(
              //       // wrap your Column in Expanded
              //       child: Column(
              //         children: <Widget>[
              //           SliderButton(
              //             action: () {
              //               ///Do something here
              //               ///
              //
              //               // _signIn(context)
              //               //   .then((UserCredential user) => print(user))
              //               //   .catchError((e) => print(e));
              //            _handleGetContact();
              //              Navigator.of(context).pop();
              //              Navigator.of(context).push(MaterialPageRoute(
              //                  builder: (context) => TestGmailLogin()));
              //             },
              //        // action: () {
              //        //   print('Using the sword');
              //        // },
              //
              //             ///Put label over here
              //             label: Text(
              //               AppLocalizations.of(context).lblLoginWithGmail,
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 17),
              //             ),
              //             icon: Center(
              //                 child: Image.asset(
              //               'images/gmail_icon.png',
              //               fit: BoxFit.contain,
              //             )),
              //             alignLabel: AppLocalizations.of(context).locale=="en" ?Alignment.centerRight:Alignment.centerLeft,
              //             ///Change All the color and size from here.
              //             width: 250,
              //             radius: 10,
              //             buttonColor: Colors.red,
              //             highlightedColor: Colors.white,
              //             baseColor: Colors.red,
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Expanded(
                      //padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      flex: 1,
                      child: Container(
                      child: Text(
                        AppLocalizations.of(context).lblHaveAccount,
                        textAlign: TextAlign.justify,

                        style: MansaFont.getMediumFont_gray2(),
                      ),
                    ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                      child: FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          AppLocalizations.of(context).lblCreatAccount,
                          style: MansaFont.getMediumFont_medium_blue(),
                        ),
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.transparent)),
                      ),
                    ),
                    ),

                    // Container(
                    //   width: 5,
                    // ),

                  ]),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    // _bloc.loginSubject.close();
    // _bloc.dispose();
    super.dispose();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    print("Start Gmail Configuration");
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names'),
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Future<void> _handleSignOut() async {
  //   _googleSignIn.disconnect();
  // }

  getLogin() {
    try {
      if (_form_log.currentState.validate()) {
        print(phoneKey_log.currentState.value);
        print(passKey_log.currentState.value);
        if(phoneKey_log.currentState.value==null || phoneKey_log.currentState.value==""||
        passKey_log.currentState.value==null || passKey_log.currentState.value==""){
          showInSnackBar(AppLocalizations.of(context).lblEnterYourData, context, _scaffoldKey_log);
        }else{
             showAppLoading(context);
          AuthApi.login(phoneKey_log.currentState.value, passKey_log.currentState.value).then((response) {
        if (response.code ==200 ) {
          saveUser(response.data).then((done) {
            if (done){
              print(response.data);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TabBarScreen()));
            }
                 hideAppDialog(context);

          }, onError: (error) {
            print("saving user Error : :  :$error");
          });
        } else {
          hideAppDialog(context);
         // showInSnackBar("${response.message}" , context , );
          print("${response.message}");
          showInSnackBar(AppLocalizations.of(context).lblUserNotFound, context, _scaffoldKey_log);
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
    } catch (error) {
      hideAppDialog(context);
      showSnack(error.toString());
    }
  }

  void showSnack(String msg, {Duration duration}) async {
    _scaffoldKey_log.currentState.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: MansaFont.getRegularFont(),
      ),
      duration: duration == null ? Duration(seconds: 5) : duration,
    ));
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}

