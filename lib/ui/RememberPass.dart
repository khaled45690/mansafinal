import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/AuthApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../localizations.dart';
import 'TabBarScreen.dart';



class RememberPass extends StatefulWidget{


  RememberPass();
  @override
  _RememberPassState createState()=>_RememberPassState();
}




class _RememberPassState extends State<RememberPass> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var email = GlobalKey<FormFieldState>();
  @override void initState() {
    print("Emaillllllll For Registration");
  //  print(widget.user.email);
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
                  tileMode: TileMode.clamp
              ),
            ),
          ),
          title: new Text(AppLocalizations.of(context).lblDoYouRememberPass, style: MansaFont.baseFontStyle(),),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          
        ),
     
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
         
            new Image.asset(
              'images/asset12.png',
              height: 250.0,
              width: 250.0,
            ),
            new Text(AppLocalizations.of(context).lblPleaseInsertEmail),
            new SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(""),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                      key: email,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: MansaFont.getLightFont(),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: grey_ligth, width: 0.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: grey_ligth, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                    ),
                    
                  ),
                ),
                
                Expanded(
                  flex: 1,
                  child: Text(""),
                ),

               
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Text("السوق سوقك هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة. وحتى يسهل على المستخدم إيجاد ما يبحث عنه أو الإعلان عمّا يريد بيعه يوجد أقسام رئيسية وفرعية لعرض وتصفّح مختلف أنواع السلع والخدمات المتداولة بينهم وإتاحة التواصل المباشر فيما بينهم بكل سهولة." , 
            // style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20.0,
            //         fontStyle: FontStyle.italic,
            //         // padding: EdgeInsets.all(24.0),
            //         color: Colors.black)),
            // ),
             new SizedBox(height: 10.0),
              appButtonbgimage(AppLocalizations.of(context).lblConfirm,
                        () => verifyCode(),
                         //() => getRegister(),
                            bgColor: lightBgColor, bgColor2: transColor),
          ],
        ),
        
      )
    );
  }









  verifyCode() {
    try {
        if(email.currentState.value==null || email.currentState.value==""){
          showInSnackBar(AppLocalizations.of(context).lblEnterYourData, context, _scaffoldKey);
        }else{
             showAppLoading(context);
          AuthApi.rememberPass(email.currentState.value).then((response) {
        if (response.code ==200 ) {
           hideAppDialog(context);
           showInSnackBar(AppLocalizations.of(context).lblCheckEmail, context, _scaffoldKey);
          } else {
            showInSnackBar("${response.message}", context, _scaffoldKey);
            print("${response.message}");
            hideAppDialog(context);
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
        }
     
    } catch (error) {
      hideAppDialog(context);
   //   showSnack(error.toString());
    }
  }


}

