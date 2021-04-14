import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/PaymentAccountApi.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/OrderDataVM.dart';
import 'package:mansaapp/Models/PaymentAccountVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/ui/TabBarScreen.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../localizations.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mansaapp/APIs/UploadApi.dart';
import 'package:flutter/services.dart';


import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mansaapp/APIs/UploadApi.dart';
import 'package:flutter/services.dart';
import 'Terms.dart';
import 'package:image_picker/image_picker.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => new _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey_log =
      new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _form_log = GlobalKey<FormState>();
  bool _isButtonDisabled;
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name="";
  String email="";
  String imageprofile="";
    static gettitleFontinside_blueV2({double fontSize = 13}) => TextStyle(color: lightBgColor ,fontFamily: "Tajawal", fontSize: fontSize,fontWeight: FontWeight.bold);

List _accounts = ["بنك البلاد", "الراجحي", "البنك الأول","الإنماء","ساب"];

String title="";
String accountName="";
String account_IBAN="";
String account_No="";
 var customerNameKey_log = GlobalKey<FormFieldState>();
  var accountTransferKey_log = GlobalKey<FormFieldState>();
  var accountTransferToKey_log = GlobalKey<FormFieldState>();
  var phone1Key_log = GlobalKey<FormFieldState>();
  var phone2Key_log = GlobalKey<FormFieldState>();
  var emailKey_log = GlobalKey<FormFieldState>();
  var nameWhoTransferKey_log = GlobalKey<FormFieldState>();

  List<DropdownMenuItem<String>> _dropDownMenuAccounts;
  String _selectedAccount;



  String _path;
Map<String, String> _paths;
Map<String, String> _paths2;
String _extension;
String _extension2;
FileType _pickType;
bool _multiPick = false;
String uploadTxt1="";
File file;
String firstUpload="";
String lblFirstUpload="ارفق ايصال الدفع";

void getImageFromGallery() async {
  var value = await ImagePicker().getImage(source: ImageSource.gallery , imageQuality: imageQuality);
  print("image");
  File image = File(value.path);
  _upload_Base64(image);
           // String fileName = basename(image.path);
           // _image = image;
       // String filePath = _path;
        // print("FileName : $fileName");
        // print("filePath : $filePath");
        // print("_path : $_path");
      //  upload(fileName, filePath); 
    setState(() {
    //  imageURI = image;
    });
  }

void openFileExplorer() async {
    try {
      
      _path = null;
      if (_multiPick) {
        var value = await FilePicker.platform.pickFiles(type: _pickType,allowedExtensions: [_extension]);
        _paths = {value.files.first.name : value.files.first.path};
           // showAppLoading(_context);
          // lblFirstUpload="Loading ....";
        _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});  
       
        print("Length");
        print( _paths.length); 
       // hideAppDialog(_context); 
      } else {
        var value = await FilePicker.platform.pickFiles(
            type: _pickType, allowedExtensions: [_extension]);
        _path = value.files.first.path;
        String fileName = _path.split('/').last;
        String filePath = _path;
        upload(fileName, filePath);
      }
      print("pathssssssss");
      print(_paths);
     // lblFirstUpload=_paths.length.toString();
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
   // hideAppDialog(_context);
    if (!mounted) return;
}
void _upload_Base64(File file) {
  
  UploadApi.upload_Base64(file).then((response) {
      if (response.code ==200 ) {
        setState(() {
          firstUpload=response.data;
          lblFirstUpload="تم رفع الملف بنجاح";
        });
        print(response.message);
      } else {
        print("${response.message}");
      }
    });
 }
  upload(fileName, filePath) {
    file = new File(filePath);
    _upload_Base64(file);
    _extension = fileName.toString().split('.').last;
    setState(() {
    });
  }
//////////////
///
  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
   // lblFirstUpload = AppLocalizations.of(context).locale=="en" ?"Upload Image ":"ارفق ايصال الدفع";
    _context = context;
    return Scaffold(
        backgroundColor: bgColor,
        key: _scaffoldKey,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Form(
                child: _isButtonDisabled ? sucessview() : paymentview(),
         
         
          ),
        ),
      );
  }
UserVM user ;
  PaymentAccountVM _paymentAccount = new PaymentAccountVM();
List<ShoppingCartVM> shoppingCarts ;
double subTotal=0;
     double tax=0;
     List<OrderDataVM> ordersData ;
      var sPrice="";
   @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;

    _dropDownMenuAccounts = buildAndGetDropDownMenuItems(_accounts);
    _selectedAccount=_dropDownMenuAccounts[0].value;
    getUser().then((user){
      setState(() {
              this.user = user ;
              if(user!=null){
          ShoppingCartApi.getShoppingCarForUser(user.user_Id).then((response) {
          if (response.code ==200 ) {
            shoppingCarts = response.data;
            print(shoppingCarts.length);
            shoppingCarts.forEach((cart){
             setState(() {
               subTotal=subTotal+cart.Price;
              sPrice=cart.Price.toString();
             });
            });
           setState(() {
             tax = (int.parse(response.message)/100)*subTotal;
           });
           print("الدفع من التاب");
             print("المجموع الكلي : "+ (subTotal+tax).toString());
          } else {
            print("${response.message}");
          }
          setState(() {
          });
        });
        }
      });
    });
    setState(() {
      
    });
    PaymentAccountApi.getPaymentAccounts().then((response) {
          if (response.code ==200 ) {
            setState(() {
              _paymentAccount=response.data;
              title="بنك البلاد";
        account_No=_paymentAccount.AlAhly_ACCountNO;
        accountName=_paymentAccount.AlAhly_BankNameAr;
        account_IBAN=_paymentAccount.AlAhly_IBAN;
            });
          } else {
            print("${response.message}");
          }
          setState(() {
          });
        });
  }
 
 
  @override
  Future dispose() {
    super.dispose();
  }

  paymentview() {
    return Column(
      mainAxisSize: MainAxisSize.max, 
      children: [
        
      // Container(
      //   margin: EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 20),
      //   width: MediaQuery.of(context).size.width,
      //   color: grey_ligth,
      //   child: Column(mainAxisSize: MainAxisSize.max, children: [
      //     Container(
      //       height: 5,
      //     ),
      //     new Text("Order : 2331",
      //         textAlign: TextAlign.center,
      //          style: MansaFont.gettitleFont()),
      //     new Text("Total : 440 SR",
      //         textAlign: TextAlign.center, style: MansaFont.gettitleFont()),
      //     Container(
      //       height: 5,
      //     ),
      //   ]),
      // ),
      Container(
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 20),
        width: MediaQuery.of(_context).size.width,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [grey_ligth, grey_ligth],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 2.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userNameInputs(),
            appButtonbgimage(_isButtonDisabled ? AppLocalizations.of(context).lblDone : AppLocalizations.of(context).lblNext,
                () => _isButtonDisabled ? null : Transfere_payment(),
                bgColor: _isButtonDisabled ? gray : lightBgColor,
                bgColor2: _isButtonDisabled ? gray : transColor),
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    ]);
  }
  sucessview() {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Container(
        margin: EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
            height: 80,
          ),
          Container(
            child: Image.asset(
              'images/asset2.png',
              height: 200,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          new Text(AppLocalizations.of(context).lblSuccess,
              textAlign: TextAlign.center, style: MansaFont.gettitleFont_payment_1()),
          SizedBox(
            height: 40,
          ),
          new Text(AppLocalizations.of(context).lblThanks,
              textAlign: TextAlign.center, style: MansaFont.gettitleFont_payment_2()),
          new Text(AppLocalizations.of(context).lblContactSoon,
              textAlign: TextAlign.center, style: MansaFont.gettitleFont_payment_2()),
          SizedBox(
            height: 40,
          ),
          appButtonbgimage(AppLocalizations.of(context).lblDone,
                  () => Transfere_payment(),
              bgColor: lightBgColor,
              bgColor2: transColor),
        ]),
      ),
    ]);
  }
  userNameInputs() {
    _context = context;

    return Container(
      padding: EdgeInsets.all(10),
      child: Container(child: _buildCard()),
    );
  }

  Transfere_payment() {
    if(_isButtonDisabled){
      
      setState(() {
        _isButtonDisabled = false;
      });
      Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TabBarScreen(),));
    }
    else {
      if(
        phone1Key_log.currentState.value==null||phone1Key_log.currentState.value==""||
        // phone2Key_log.currentState.value==null||phone2Key_log.currentState.value==""||
        //emailKey_log.currentState.value==null||emailKey_log.currentState.value==""||
        customerNameKey_log.currentState.value==null||customerNameKey_log.currentState.value==""||
        accountTransferKey_log.currentState.value==null||accountTransferKey_log.currentState.value==""||
        // accountTransferToKey_log.currentState.value==null||accountTransferToKey_log.currentState.value==""||
        nameWhoTransferKey_log.currentState.value==null||nameWhoTransferKey_log.currentState.value==""){
          print("objectobjectobjectobjectobjectobjectobject");
          showInSnackBar(AppLocalizations.of(_context).lblEnterYourData, _context, _scaffoldKey);
        }else{

          showAppLoading(_context);
          CreatePaymentVM obj = new CreatePaymentVM();
         // print(emailKey_log.currentState.value);
          obj.email=emailKey_log.currentState.value;
          obj.phone1=phone1Key_log.currentState.value;
          obj.phone2=phone2Key_log.currentState.value;
          obj.customerName=customerNameKey_log.currentState.value ;
          obj.accountTransfer=accountTransferKey_log.currentState.value;
          // obj.accountTransferTo = accountTransferToKey_log.currentState.value;
          obj.nameWhoTransfer=nameWhoTransferKey_log.currentState.value;
          obj.userId=user.user_Id;
          obj.bankName=_selectedAccount;
          obj.Orderfile=firstUpload;
          PaymentAccountApi.createPayment(obj).then((response) {
          if (response.code ==200 ) {
            setState(() {
            _isButtonDisabled = true;
          });
          hideAppDialog(_context);
          // Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => TabBarScreen(),));
           // hideAppDialog(context);
           // showInSnackBar("تم اضافه الخدمه الي سله الطلبات", _context, _scaffoldKey);
           // showSnack("تم اضافه الخدمه الي سله المهملات");
          } else {
            print("${response.message}");
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
  Widget _buildCard() => Container(
        child: Form(
          key: _form_log,
          child: Column(children: [
            
            Container(
              margin: EdgeInsets.only(right: 5, left: 5, bottom: 0, top: 20),
              child: Text(AppLocalizations.of(context).lblPaymentTitle,//"Bank Transaction on our Bank Account",
                  textAlign: TextAlign.center,
                  style: MansaFont.gettitleFontinside()),
            ),
            Container(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Text(AppLocalizations.of(context).lblAtBank),
                Text("    "),
                new DropdownButton(
                              value: _selectedAccount,
                              items: _dropDownMenuAccounts,
                              onChanged: changedDropDownAccount,
                            )
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
                children: <Widget>[
                  Container(
                    child: Text(title,
                      textAlign: TextAlign.left,
                      style: MansaFont.gettitleFontinside()
                      ),
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  Container(
                    child: SelectableText(
                        accountName,//"Akraz Al Janoub EST",
                        showCursor: true,
                        toolbarOptions: ToolbarOptions(
                            copy: true, selectAll: true, cut: false, paste: false),
                        textAlign: TextAlign.left,
                        style: gettitleFontinside_blueV2(),
                      ),
                  ),
                ]
            ),

            Container(
              height: 20,
            ),

            Row(
                children: <Widget>[
                  Container(
                    child:  Text(AppLocalizations.of(context).lblIBAN,
                        textAlign: TextAlign.left,
                        style: MansaFont.gettitleFontinside()),
                        ),
                ]
            ),
            Row(
                children: <Widget>[
                  Container(
                    child: SelectableText(
                        account_IBAN==null?"":account_IBAN,//"SA 6410000047890911000101",
                        showCursor: true,
                        toolbarOptions: ToolbarOptions(
                            copy: true, selectAll: true, cut: false, paste: false),
                        textAlign: TextAlign.center,
                        style: gettitleFontinside_blueV2(),
                      ),
                  ),
                ]
            ),
          
            Container(
              height: 20,
            ),
            Row(
                children: <Widget>[
                  Container(
                    child:  Text(AppLocalizations.of(context).lblAccountNo,
                      textAlign: TextAlign.left,
                      style: MansaFont.gettitleFontinside()),
                        ),
                ]
            ),
            Row(
                children: <Widget>[
                  Container(
                    child: SelectableText(
                      account_No==null?"":account_No,//"47890911000101",
                      showCursor: true,
                      toolbarOptions: ToolbarOptions(
                          copy: true, selectAll: true, cut: false, paste: false),
                      textAlign: TextAlign.center,
                      style: MansaFont.gettitleFontinside_blue(),
                    ),
                  ),
                ]
            ),
          Container(
            height: 20,
          ),
            Row(
              children: <Widget>[
                Expanded(
                flex: 1,
                child: Text(AppLocalizations.of(context).lblCustomerName, 
                  //textAlign: TextAlign.center,
                  style: MansaFont.baseFontStyleWithBackground(),),
              ),
              Expanded( // wrap your Column in Expanded
              flex: 1,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: customerNameKey_log,
                      maxLines: 1,
                      //textAlign: TextAlign.left,
                      style: MansaFont.getLightFont(),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lblCustomerName,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                      ),
                    )
                  ],
                ),
              ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                flex: 1,
                child: Text(AppLocalizations.of(context).lblAccountTransfer,//"nAccount Transfered", 
                  //textAlign: TextAlign.center,
                  style: MansaFont.baseFontStyleWithBackground(),),
              ),
              (subTotal+tax)!=0.0?Expanded( // wrap your Column in Expanded
              flex: 1,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: accountTransferKey_log,
                      initialValue: (subTotal+tax).toString(),
                      enabled: false,
                      
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      style: MansaFont.getLightFont(),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lblAccountTransfer,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                      ),
                    )
                  ],
                ),
              ):Container(

              ),
              ],
            ),
            // Container(
            //   height: 20,
            // ),
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //     flex: 1,
            //     child: Text(AppLocalizations.of(context).lblAccountTransferTo, 
            //       //textAlign: TextAlign.center,
            //       style: MansaFont.baseFontStyleWithBackground(),),
            //   ),
            //   Expanded( // wrap your Column in Expanded
            //   flex: 1,
            //     child: Column(
            //       children: <Widget>[
            //         TextFormField(
            //           key: accountTransferToKey_log,
            //           maxLines: 1,
            //           textAlign: TextAlign.left,
            //           style: MansaFont.getLightFont(),
            //           decoration: InputDecoration(
            //             labelText: AppLocalizations.of(context).lblAccountTransferTo,
            //             contentPadding: new EdgeInsets.symmetric(
            //                 vertical: 14.0, horizontal: 10.0),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            //   ],
            // ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                flex: 1,
                child: Text(AppLocalizations.of(context).lblWhoTransfer,//"Name Who Transfer", 
                  //textAlign: TextAlign.center,
                  style: MansaFont.baseFontStyleWithBackground(),),
              ),
              Expanded( // wrap your Column in Expanded
              flex: 1,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: nameWhoTransferKey_log,
                      maxLines: 1,
                      //textAlign: TextAlign.left,
                      style: MansaFont.getLightFont(),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lblWhoTransfer,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                      ),
                    )
                  ],
                ),
              ),
              ],
            ),
            Container(
              height: 40,
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      AppLocalizations.of(context).lblContact_Information,
                      textAlign: TextAlign.center,
                      style: MansaFont.getBoldFontinside(),
                    ),
                  ),
                ]
            ),
              Container(
                height: 20,
              ),    
            Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(AppLocalizations.of(context).lblFirstNum+" *", 
                  //textAlign: TextAlign.center,
                  style: MansaFont.baseFontStyleWithBackground(),),
              ),
              Expanded( // wrap your Column in Expanded
              flex: 2,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: phone1Key_log,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      //textAlign: TextAlign.left,
                      style: MansaFont.getLightFont(),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lblFirstNumPlaceholder,
                        // labelStyle:
                        // MansaFont.getLightFont_TextFormField(),
                        // fillColor: Colors.blueGrey,
                        // hintText: AppLocalizations.of(context).lblFirstNumPlaceholder,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                        // border: OutlineInputBorder(
                        //   borderSide:
                        //   const BorderSide(color: grey_ligth, width: 0.0),
                        //   borderRadius: BorderRadius.circular(25.0),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //   const BorderSide(color: grey_ligth, width: 1.0),
                        //   borderRadius: BorderRadius.circular(25.0),
                        // ),
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Text(AppLocalizations.of(context).lblSecondNum, 
                  textAlign: TextAlign.center,
                  style: MansaFont.baseFontStyleWithBackground(),),
              ),
              Expanded( // wrap your Column in Expanded
                flex: 2,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: phone2Key_log,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      //textAlign: TextAlign.left,
                      style: MansaFont.getLightFont(),
                      decoration: InputDecoration(
                        labelText:AppLocalizations.of(context).lblSecondNumPlaceholder,
                        // labelStyle:
                        // MansaFont.getLightFont_TextFormField(),
                        // fillColor: Colors.blueGrey,
                        // hintText: AppLocalizations.of(context).lblSecondNumPlaceholder,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                        // border: OutlineInputBorder(
                        //   borderSide:
                        //   const BorderSide(color: grey_ligth, width: 0.0),
                        //   borderRadius: BorderRadius.circular(25.0),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //   const BorderSide(color: grey_ligth, width: 1.0),
                        //   borderRadius: BorderRadius.circular(25.0),
                        // ),
                      ),
                    )

                  ],
                ),
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
                
                flex: 1,
                child: Text(AppLocalizations.of(context).lblemail, 
                  //textAlign: TextAlign.center,
                  style: MansaFont.baseFontStyleWithBackground(),),
              ),
              Expanded( // wrap your Column in Expanded
              flex: 3,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      key: emailKey_log,
                      maxLines: 1,
                      //textAlign: TextAlign.left,
                      style: MansaFont.getLightFont(),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lblemail,
                        // labelStyle:
                        // MansaFont.getLightFont_TextFormField(),
                        // fillColor: Colors.blueGrey,
                        // hintText: AppLocalizations.of(context).lblEmailSample,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10.0),
                        // border: OutlineInputBorder(
                        //   borderSide:
                        //   const BorderSide(color: grey_ligth, width: 0.0),
                        //   borderRadius: BorderRadius.circular(25.0),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //   const BorderSide(color: grey_ligth, width: 1.0),
                        //   borderRadius: BorderRadius.circular(25.0),
                        // ),
                      ),
                    )
                  ],
                ),
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
                      Container(
                        width: 230,
                        child: Column(
                          children: <Widget>[
                            appButtonbgimage_normal(
                                // Strings.getupload(),
                                //     () => Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => Emarkiting_campaigns())),
                                AppLocalizations.of(context).lblgetupload,
                                    getImageFromGallery,
                                bgColor: desgin_button1_start,
                                bgColor2: desgin_button1_end),
                            Container(
                              child: Text(
                                lblFirstUpload,
                                textAlign: TextAlign.center,
                                style: MansaFont.getRegularFontinside(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),

                Container(
                  height: 20,
                ),
          ]),
        ),
      );
void changedDropDownAccount(String selectedS) {
    setState(() {
      _selectedAccount = selectedS;
      if(selectedS=="بنك البلاد"){
        //title="بنك البلاد";
        account_No=_paymentAccount.AlAhly_ACCountNO;
        accountName=_paymentAccount.AlAhly_BankNameAr;
        account_IBAN=_paymentAccount.AlAhly_IBAN;
      }else if(selectedS=="الراجحي"){
        //title="الراجحي";
        account_No=_paymentAccount.AlRaghy_ACCountNO;
        accountName=_paymentAccount.AlRaghy_BankNameAr;
        account_IBAN=_paymentAccount.AlRaghy_IBAN;
      }else if(selectedS=="البنك الأول"){
        //title="البنك الأول";
        account_No=_paymentAccount.Sampa_ACCountNO;
        accountName=_paymentAccount.Sampa_BankNameAr;
        account_IBAN=_paymentAccount.Sampa_IBAN;
      }else if(selectedS=="الإنماء"){
        //title="الإنماء";
        account_No=_paymentAccount.AlEnma_ACCountNO;
        accountName=_paymentAccount.AlEnma_BankNameAr;
        account_IBAN=_paymentAccount.AlEnma_IBAN;
      }else if(selectedS=="ساب"){
        //title="ساب";
        account_No=_paymentAccount.Sap_ACCountNO;
        accountName=_paymentAccount.Sap_BankNameAr;
        account_IBAN=_paymentAccount.Sap_IBAN;
      }
      title=selectedS;
    });
  }
List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List _countries) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in _countries) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

}