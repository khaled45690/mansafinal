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



class ConfirmationCode extends StatefulWidget{
  UserVM user;
  ConfirmationCode(this.user);
  @override
  _ConfirmationCodeState createState()=>_ConfirmationCodeState();
}




class _ConfirmationCodeState extends State<ConfirmationCode> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var first = GlobalKey<FormFieldState>();
  var second = GlobalKey<FormFieldState>();
  var third = GlobalKey<FormFieldState>();
  var fourth = GlobalKey<FormFieldState>();
  int _currentIdex=0;
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  @override void initState() {
    print("Emaillllllll For Registration");
    print(widget.user.email);
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
          title: new Text(AppLocalizations.of(context).lblConfirmationCode, style: MansaFont.baseFontStyle(),),
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
            new Text(AppLocalizations.of(context).lblPleaseInsertCode),
            new SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(""),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                      key: fourth,
                      focusNode: focus4,
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
                  child: TextFormField(
                      key: third,
                    maxLines: 1,
                    focusNode: focus3,
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
                    onFieldSubmitted: (v){
                      FocusScope.of(context).requestFocus(focus4);
                    },
                     
                    onChanged: (String value){
                      if(value.length>=1){
                         FocusScope.of(context).requestFocus(focus4);
                        //  _next(index,);
                          return;
                      }else if (value.isEmpty) {
                          // _prev(index);
                        }
                    },
                  ),
                ),
                
                Expanded(
                  flex: 1,
                  child: TextFormField(
                      key: second,
                      focusNode: focus2,
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
                    onFieldSubmitted: (v){
                      FocusScope.of(context).requestFocus(focus3);
                    },
                     //autofocus: true,
                    onChanged: (String value){
                      if(value.length>=1){
                         FocusScope.of(context).requestFocus(focus3);
                        //  _next(index,);
                          return;
                      }else if (value.isEmpty) {
                          // _prev(index);
                        }
                    },
                  ),
                ),
                
                Expanded(
                  flex: 1,
                  child: TextFormField(
                      key: first,
                    maxLines: 1,
                   // maxLength: 2,
                    textAlign: TextAlign.left,
                    style: MansaFont.getLightFont(),
                    //autofocus: true,
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
                    onFieldSubmitted: (v){
                      FocusScope.of(context).requestFocus(focus2);
                    },
                     autofocus: true,
                    onChanged: (String value){
                      if(value.length>=1){
                         FocusScope.of(context).requestFocus(focus2);
                        //  _next(index,);
                          return;
                      }else if (value.isEmpty) {
                          // _prev(index);
                        }
                    },
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




// void _next(int index) {
//   if(index ==1){
//     setState(() {
//       _currentIdex = index + 1;
//     });
//   }
//     if (index != widget.length) {
//       setState(() {
//         _currentIdex = index + 1;
//       });
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         FocusScope.of(context).requestFocus(_listFocusNode[index + 1]);
//       });
//     }
//   }

//   void _prev(int index) {
//     if (index > 0) {
//       setState(() {
//         if (_listControllerText[index].text.isEmpty) {
//           _listControllerText[index - 1].text = ' ';
//         }
//         _currentIdex = index - 1;
//       });
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         FocusScope.of(context).requestFocus(_listFocusNode[index - 1]);
//       });
//     }
//   }




  verifyCode() {
    try {
        print(first.currentState.value);
        print(second.currentState.value);
        if(first.currentState.value==null || first.currentState.value==""||
        second.currentState.value==null || second.currentState.value==""||
        third.currentState.value==null || third.currentState.value==""||
        fourth.currentState.value==null || fourth.currentState.value==""){
          showInSnackBar(AppLocalizations.of(context).lblEnterYourData, context, _scaffoldKey);
        }else{
             showAppLoading(context);
          AuthApi.verifyCode(widget.user.user_Id , widget.user.email , first.currentState.value,
          second.currentState.value,third.currentState.value ,  fourth.currentState.value).then((response) {
        if (response.code ==200 ) {
           //  hideAppDialog(context);
            print("Response Code is 200");
            saveUser(response.data).then((done) {
              print("Start Saving User");
              if (done){
                print(response.data);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabBarScreen()));
              }
                  hideAppDialog(context);

            }, onError: (error) {
              print("saving user Error : :  :$error");
              hideAppDialog(context);
            });
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

