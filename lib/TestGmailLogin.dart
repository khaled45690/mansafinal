// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:mansaapp/resources/fonts.dart';
// import 'package:mansaapp/ui/SigninScreen.dart';
// import 'package:mansaapp/ui/SplashScreen.dart';
// import 'package:mansaapp/ui/TabBarScreen.dart';
// import 'package:mansaapp/utilis/CustomizedWidgets.dart';
//
// import 'APIs/AuthApi.dart';
// import 'Constants/customcolors.dart';
// import 'Models/UserVM.dart';
// import 'localizations.dart';
// //import 'ProfileScreen.dart';
//
//
// class TestGmailLogin extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GoogleSignApp();
//   }
// }
//
// class GoogleSignApp extends StatefulWidget {
//   @override
//   _GoogleSignAppState createState() => _GoogleSignAppState();
// }
//
// class _GoogleSignAppState extends State<GoogleSignApp> {
//
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googlSignIn = new GoogleSignIn();
//
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
//   UserCredential userDetails = await _firebaseAuth.signInWithCredential(credential);
//   ProviderDetails providerInfo = new ProviderDetails(userDetails.additionalUserInfo.providerId);
//
// List<ProviderDetails> providerData = new List<ProviderDetails>();
//     providerData.add(providerInfo);
//
//     UserDetails details = new UserDetails(
//         userDetails.additionalUserInfo.providerId,
//         userDetails.user.displayName,
//         userDetails.user.photoURL,
//         userDetails.user.email,
//         providerData,
// );
// print(details.userEmail);
// print(details.userName);
// showAppLoading(context);
// AuthApi.socialMediaLogin(details.userEmail ,details.userName,details.photoUrl).then((response) {
//         if (response.code ==200 ) {
//           saveUser(response.data).then((done) {
//             if (done){
//               print(response.data);
//               print(AppLocalizations.of(context).lblAboutApp);
//               Navigator.pop(context);
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarScreen()));
//             //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarScreen()));
//             }
//                  hideAppDialog(context);
//
//           }, onError: (error) {
//             print("saving user Error : :  :$error");
//           });
//         } else {
//           print("${response.message}");
//           //showInSnackBar("${response.message}", context, _scaffoldKey);
//         }
//         setState(() {
//          //this.loginApi = false;
//         });
//       }, onError: (error) {
//         print("login Error : : :$error");
//         setState(() {
//          // this.loginApi = false;
//         });
//       });
//     // Navigator.push(
//     //   context,
//     //   new MaterialPageRoute(
//     //     builder: (context) => new ProfileScreen(detailsUser: details),
//     //   ),
//     // );
//     return userDetails;
//   }
// BuildContext _context;
//   final GlobalKey<ScaffoldState> _scaffoldKey_log =
//       new GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey_log,
//         backgroundColor: bgColor,
//
//
//       body: Builder(
//         builder: (context) => Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(
//             decoration: new BoxDecoration(
//               gradient: new LinearGradient(
//                   colors: [splash_end, splash_start],
//                   begin: const FractionalOffset(0.1, 0.8),
//                   end: const FractionalOffset(1.0, 0.5),
//                   tileMode: TileMode.clamp
//               ),
//             ),
//             child: Center(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height:10.0),
//                   Container(
//                         width: 250.0,
//                           child: Align(
//                         alignment: Alignment.center,
//                         child: RaisedButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(30.0)),
//                           color: Color(0xffffffff),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                             Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
//                             SizedBox(width:10.0),
//                             Text(
//                             'Sign in with Google',
//                             style: TextStyle(color: Colors.black,fontSize: 18.0),
//                           ),
//                           ],),
//                           onPressed: () => _signIn(context)
//                                     .then((UserCredential user) => print(user))
//                                     .catchError((e) => print(e)),
//                         ),
//                       )
//                       ),
//                   ],
//                 ),
//             ),
//             ),
//
//         ],
//       ),),
//     );
//   }
// }
//
//
//
// class UserDetails {
//   final String providerDetails;
//   final String userName;
//   final String photoUrl;
//   final String userEmail;
//   final List<ProviderDetails> providerData;
//
//   UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
// }
//
//
// class ProviderDetails {
//   ProviderDetails(this.providerDetails);
//   final String providerDetails;
// }