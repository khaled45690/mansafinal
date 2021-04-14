import 'dart:async';
import 'dart:convert';

import 'package:mansaapp/APIs/ServiceApi.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/ServiceVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mansaapp/APIs/UploadApi.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:dio/dio.dart';


class Infographics extends StatefulWidget {

  @override
  _InfographicsState createState() => new _InfographicsState();
}


class _InfographicsState extends State<Infographics> {
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String name="";
  String email="";
  String imageprofile="";

  GlobalKey<FormState> _form_logo = GlobalKey<FormState>();
  var nameenglishKey_log = GlobalKey<FormFieldState>();
  var namearabicKey_log = GlobalKey<FormFieldState>();
  var desKey_log = GlobalKey<FormFieldState>();
  var phone1Key_log = GlobalKey<FormFieldState>();
  var phone2Key_log = GlobalKey<FormFieldState>();
  var emailKey_log = GlobalKey<FormFieldState>();
  var facebookKey_log = GlobalKey<FormFieldState>();
  var twitterKey_log = GlobalKey<FormFieldState>();
  var instagramKey_log = GlobalKey<FormFieldState>();
var snapShatKey_log = GlobalKey<FormFieldState>();
  var youtubeKey_log = GlobalKey<FormFieldState>();




String _path;
Map<String, String> _paths;
Map<String, String> _paths2;
String _extension;
String _extension2;
FileType _pickType=FileType.any;
bool _multiPick = true;
String uploadTxt1="";
File file;
String firstUpload="";
String secondUpload="";
int lblFirstUpload=0;
int lblSecondUpload =0;
List<Asset> images = List<Asset>();

  Future<void> loadAssetFromCamera1() async{
    final _picked = ImagePicker();
    final picked =  await _picked.getImage(source: ImageSource.camera);

    if (picked != null) {
      print(picked.path.split('/').last);
      String fileName = picked.path.split('/').last;
      final bytes = File(picked.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      _upload_Base64_pass_Base46(base64Image , fileName);
    }else {
      print("something happened");
    }
  }

Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
       //_pickImage(_context);
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          //actionBarColor: "#abcdef",
          //actionBarTitle: "Example App",
          allViewTitle: "Choose Images",
          //useDetailsView: false,
          //selectCircleStrokeColor: "#000000",
        ),
      );
      print("Assets");
      String  base64Image;
      List<MultipartFile> multipart = List<MultipartFile>();

                for (int i = 0; i < resultList.length; i++) {
                  //AssetImage('graphics/background.png')
                 print(resultList[i].identifier);
                 print(resultList[i]);
                 print(resultList[i].name);
                 ByteData byteData = await resultList[i].getByteData(quality: imageQualityForMultipleImages);
                 List<int> imageData = byteData.buffer.asUint8List();
                base64Image = base64Encode(imageData);
                 print(imageData);
                 print(base64Image);
                  _upload_Base64_pass_Base46(base64Image , resultList[i].name);
                //  ByteData bytes = await rootBundle.load(resultList[i].name);
                // var buffer = bytes.buffer;
                // var m = base64.encode(Uint8List.view(buffer));
                // print(m);
                } 
      print(resultList);
      
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
     // _error = error;
    });
  }
  
void openFileExplorer() async {
    try {
      
      _path = null;
      if (_multiPick) {
        var value = await FilePicker.platform.pickFiles();
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
void _upload_Base64_pass_Base46(String base64 , String name) {
  
  UploadApi.upload_Base64AndReturnId2(base64 , name).then((response) {
      if (response.code ==200 ) {
        setState(() {
          lblFirstUpload=lblFirstUpload+1;
          firstUpload=firstUpload+response.data+",";
        });
        print(response.message);
      } else {
        print("${response.message}");
      }
    });
 }
void _upload_Base64(File file) {
  
  UploadApi.upload_Base64AndReturnId(file).then((response) {
      if (response.code ==200 ) {
        setState(() {
          lblFirstUpload=lblFirstUpload+1;
          firstUpload=firstUpload+response.data+",";
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
void openFileExplorer2() async {
    try {
      _path = null;
      if (_multiPick) {
        var value = await FilePicker.platform.pickFiles();
        _paths2 = {value.files.first.name : value.files.first.path};
        _paths2.forEach((fileName, filePath) => {upload2(fileName, filePath)});   
        print("Length");
        print( _paths2.length); 
      } else {
        var value = await FilePicker.platform.pickFiles(
            type: _pickType, allowedExtensions: [_extension]);
        _path = value.files.first.path;
      }
      print("pathssssssss");
      print(_paths2);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
}
void _upload_Base64_2(File file) {
  UploadApi.upload_Base64AndReturnId(file).then((response) {
      if (response.code ==200 ) {
        setState(() {
          lblSecondUpload=lblSecondUpload+1;
          secondUpload=firstUpload+response.data+",";
        });
        
        print(response.message);
      } else {
        print("${response.message}");
      }
    });
 }
  upload2(fileName, filePath) {
    file = new File(filePath);
    _upload_Base64_2(file);
    _extension = fileName.toString().split('.').last;
    setState(() {
    });
  }
  ////////////
  ///
  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
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
          title: new Text(AppLocalizations.of(context).lblInfographics,  style: MansaFont.baseFontStyle() ,) ,
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
          padding: EdgeInsets.all(10),
          child: Form(
            key: _form_logo,
              child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                               AppLocalizations.of(context).lblImage_Information,
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
                          Container(
                            child: Image.asset(
                              'images/asset34.png',
                              height: 35,
                              width: 60,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                            onTap: (){
                              return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  actions: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 60),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          loadAssetFromCamera1();
                                        },
                                        child: Icon(Icons.camera_alt),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 30),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          loadAssets();
                                        },
                                        child:
                                        Icon(Icons.photo_camera_back),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Container(
                            child: Image.asset(
                               AppLocalizations.of(context).locale=="en" ?'images/asset311.png':'images/assetAr31.png',
                              height: 30,
                              width: 200,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              
                            ),
                            
                          ),
                          ),
                          
                            ],
                          ),
                        ]

                    ),
                    Container(
                            width: 20,
                          ),
                          Text(
                             AppLocalizations.of(context).locale=="en" ? "* Uploaded "+ lblFirstUpload.toString()+" Images *     ":"       * تم رفع "+ lblFirstUpload.toString()+" صور  *",
                              textAlign: TextAlign.center,
                              style: MansaFont.getBoldFontinside(),
                            ),
                    Container(
                      height: 20,
                    ),
                    Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/asset34.png',
                              height: 35,
                              width: 60,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                            onTap: openFileExplorer2,
                            child: Container(
                            child: Image.asset(
                               AppLocalizations.of(context).locale=="en" ?'images/uploadSctiptAr.PNG':'images/uploadSctiptAr.PNG',
                              height: 30,
                              width: 200,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              
                            ),
                            
                          ),
                          ),
                          
                            ],
                          ),
                        ]
                    ),
                    Container(
                            width: 20,
                          ),
                          Text(
                             AppLocalizations.of(context).locale=="en" ? "* Uploaded "+ lblSecondUpload.toString()+" Images *     ":"    * تم رفع "+ lblSecondUpload.toString()+" صور  *",
                              textAlign: TextAlign.center,
                              style: MansaFont.getBoldFontinside(),
                            ),
                    Container(
                      height: 10,
                    ),
                    Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded( // wrap your Column in Expanded
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      key: desKey_log,
                                      maxLines: 3,
                                     // textAlign: TextAlign.left,
                                      style: MansaFont.getLightFont(),
                                      decoration: InputDecoration(
                                        labelText: AppLocalizations.of(context).lblDescriptionPlaceholder,
                                        labelStyle:
                                        MansaFont.getLightFont_TextFormField(),
                                        // fillColor: Colors.blueGrey,
                                        // hintText: AppLocalizations.of(context).lblDescriptionPlaceholder,
                                        contentPadding: new EdgeInsets.symmetric(
                                            vertical: 14.0, horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.grey, width: 0.0),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
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
                          Container(
                            height: 2,
                            color: grey_ligth,
                          ),
                          Container(
                            height: 20,
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
                                Expanded(
                                  flex: 1,
                                  child: Text(AppLocalizations.of(context).lblFacebook, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: facebookKey_log,
                                        maxLines: 1,
                                        //textAlign: TextAlign.left,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblFacebook,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "facebook.com/....",
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
                                  child: Text(AppLocalizations.of(context).lblTwitter, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: twitterKey_log,
                                        maxLines: 1,
                                        //textAlign: TextAlign.left,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblTwitter,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "twitter.com/....",
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
                                  child: Text(AppLocalizations.of(context).lblInstagram, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: instagramKey_log,
                                        maxLines: 1,
                                        //textAlign: TextAlign.left,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblInstagram,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "Instagram.com/....",
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
                                  child: Text(AppLocalizations.of(context).lblSnapShat, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: snapShatKey_log,
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblSnapShat,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "Snapshat.com/....",
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
                                  child: Text(AppLocalizations.of(context).lblYoutube, 
                                    //textAlign: TextAlign.center,
                                    style: MansaFont.baseFontStyleWithBackground(),),
                                ),
                                Expanded( // wrap your Column in Expanded
                                flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        key: youtubeKey_log,
                                        maxLines: 1,
                                        //textAlign: TextAlign.left,
                                        style: MansaFont.getLightFont(),
                                        decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context).lblYoutube,
                                          // labelStyle:
                                          // MansaFont.getLightFont_TextFormField(),
                                          // fillColor: Colors.blueGrey,
                                          hintText: "Youtube.com/....",
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
                            Container(
                              child: Text(service==null?"":AppLocalizations.of(context).lblServicePrice+service.Price.toString()+AppLocalizations.of(context).lblRyal),
                            ),
                            Container(
                              height: 20,
                            ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded( // wrap your Column in Expanded
                          child: Column(
                            children: <Widget>[
                              appButtonbgimage(
                                   AppLocalizations.of(context).lblNext,
                                      () => send_data()
                                  ,
                                  bgColor: lightBgColor,
                                  bgColor2: transColor),
                            ],
                          ),
                        ),
                      ],

                    ),

                  ]
              )
          ),
        ),


        drawer: buildDrawer()

      );
  }


 
  send_data() {

    
    try {
      if (_form_logo.currentState.validate()) {
        if(desKey_log.currentState.value==null||desKey_log.currentState.value==""||
        phone1Key_log.currentState.value==null||phone1Key_log.currentState.value==""
        // phone2Key_log.currentState.value==null||phone2Key_log.currentState.value==""||
       // emailKey_log.currentState.value==null||emailKey_log.currentState.value==""
        // facebookKey_log.currentState.value==null||facebookKey_log.currentState.value==""||
        // nameenglishKey_log.currentState.value==null||nameenglishKey_log.currentState.value==""||
        // namearabicKey_log.currentState.value==null||namearabicKey_log.currentState.value==""||
        // twitterKey_log.currentState.value==null||twitterKey_log.currentState.value==""||
        // instagramKey_log.currentState.value==null||instagramKey_log.currentState.value==""||
        // snapShatKey_log.currentState.value==null||snapShatKey_log.currentState.value==""||
        // youtubeKey_log.currentState.value==null||youtubeKey_log.currentState.value==""
        ){
          print("objectobjectobjectobjectobjectobjectobject");
          showInSnackBar(AppLocalizations.of(_context).lblEnterYourData, _context, _scaffoldKey);
        }else{
          showAppLoading(context);
          ShoppingCartVM obj = new ShoppingCartVM();
          // obj.NameAr=namearabicKey_log.currentState.value;
          // obj.NameEn=nameenglishKey_log.currentState.value;
          obj.Phone1=phone1Key_log.currentState.value;
          obj.Phone2=phone2Key_log.currentState.value;
          obj.Description=desKey_log.currentState.value;
          obj.Facebook=facebookKey_log.currentState.value;
          obj.Email=emailKey_log.currentState.value;
          obj.Twitter=twitterKey_log.currentState.value;
          obj.Instagram=instagramKey_log.currentState.value;
          obj.Snapshat=snapShatKey_log.currentState.value;
          obj.ServiceId=6;
          obj.UserId=user.user_Id;
          obj.Price=service.Price;
          obj.filesIds=firstUpload;
          obj.filesIds2=secondUpload;
          ShoppingCartApi.addToShoppingCar(obj).then((response) {
          if (response.code ==200 ) {
            hideAppDialog(context);
            showInSnackBarAfterAddService(AppLocalizations.of(_context).lblServiceAdded, _context, _scaffoldKey);
   
            //showInSnackBar("تم اضافه الخدمه الي سله الطلبات", _context, _scaffoldKey);
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
        
      } else {
        hideAppDialog(context);
      }
    }catch(error) {
      print("object");
      print(error.toString());
      hideAppDialog(_context);
      //showSnack(error.toString());
    };

  }
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
    ServiceApi.getServices().then((response) {
          if (response.code ==200 ) {
            response.data.forEach((s){
              if(s.Id==6){
                this.service = s;
              }
            });
          } else {
            print("${response.message}");
          }
          setState(() {
          });
        });
  }
  UserVM user ;
ServiceVM service ;

  restore() async {
    final SharedPreferences Prefs= await SharedPreferences.getInstance();
    setState(() {
      name=Prefs.getString('username') ?? "";
      email= Prefs.getString('email') ?? "";
      imageprofile= Prefs.getString('image') ?? "";



    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}


