import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/AuthApi.dart';
import 'package:mansaapp/APIs/UploadApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Helper/ImagePickerHelper.dart';
import 'package:mansaapp/Helper/SneakbarHelper.dart';
import 'package:mansaapp/Models/UploadResponse.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
// import 'package:mansa/API/RequestsAndResponses/AuthenticationBloc.dart';
// import 'package:mansa/constants/customcolors.dart';
// import 'package:mansa/helper/ImagePickerHelper.dart';
import '../localizations.dart';
import 'ConfirmCode.dart';
import 'TabBarScreen.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mansaapp/APIs/UploadApi.dart';
import 'package:flutter/services.dart';
import 'Terms.dart';
import 'package:image_picker/image_picker.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => new _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey_reg = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey_reg = GlobalKey<FormState>();
  var nameKey_reg = GlobalKey<FormFieldState>();
  var emailKey_reg = GlobalKey<FormFieldState>();
  var passKey_reg = GlobalKey<FormFieldState>();
  var phoneKey_reg = GlobalKey<FormFieldState>();
  GlobalKey key;
  static bool isAr = true;
  String location;
  File _image = null;
  String urlImage = "";
  String imagename="";
  bool monVal = false;
  bool loading = true;
  String imageBaseName="";
  StreamSubscription registerSubscribtion;
  // var authenticationBloc = AuthenticationBloc();
bool _obscureText = true ;
  @override
  void dispose() {
    super.dispose();
    registerSubscribtion.cancel();
    // authenticationBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    // registerSubscribtion = authenticationBloc.registerSubject.listen((data) {
    //   Navigator.of(_context).pushReplacement(
    //       MaterialPageRoute(builder: (_context) => TabBarScreen()));
    // }, onError: (error) {
    //   hideAppDialog(this.context);
    //   showSnack(error.toString());
    // });
  }

  String _path;
Map<String, String> _paths;
String _extension;
FileType _pickType=FileType.image;
bool _multiPick = false;
String uploadTxt1="";
File file;
String firstUpload="";
int lblFirstUpload=0;
void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
Future<File> pickImage(BuildContext context, Function callback) async {
    SneakbarHelper(context)
      ..setBackgroundColor(Colors.black26)
      ..setDuration(5)
      ..buildCustomBody(_getDialog(context, callback))
      ..show();
  }
  void openFileExplorer() async {
    try {
      
      //_path = null;
      if (_multiPick) {
        var value = await FilePicker.platform.pickFiles(type: _pickType,allowedExtensions: [_extension]);
        _paths = {value.files.first.name : value.files.first.path};
        _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});  
       
        print("Length");
        print( _paths.length); 
      } else {
        var value = await FilePicker.platform.pickFiles(
            type: _pickType, allowedExtensions: [_extension]);
        _path = value.files.first.path;
        String fileName = _path.split('/').last;
        String filePath = _path;
        print("FileName : $fileName");
        print("filePath : $filePath");
        print("_path : $_path");
        upload(fileName, filePath); 
      }
      print("pathssssssss");
      print(_paths);
      print(_path);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
}
  Future getImageFromGallery() async {
    try{
      var value = await ImagePicker().getImage(source: ImageSource.gallery , imageQuality: imageQuality);
    print("image");
    File image = File(value.path);
    _upload_Base64(image);
            String fileName = basename(image.path);
    }on Exception catch(e){
      print("Error Ya man");
    }
    catch(Excep){
      print("Error Ya man");
    }
    

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

Widget _getDialog(BuildContext context, Function callback) {
  print("Get Dialog");
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                urlImage="images/Loading.gif";  
              });
              getImageFromGallery();
              //openFileExplorer();
              //getImage();
            },
            color: lightBgColor,
            child: Text(AppLocalizations.of(context).lblOpenGalary,style: MansaFont.baseFontStyle()),
          ),
          // MARK:- camera option
          // RaisedButton(
          //   onPressed: () {
          //     _pick(ImageSource.camera, callback);
          //   },
          //   color: lightBgColor,
          //   child: Text("CAMERA",style: MansaFont.baseFontStyle()),
          // )
        ],
      ),
    );
  }
  // File _image;

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = image;
  //   });
  // }

Future<void> _upload_Base64(File file) async {
  print('Tag' + file.path.toString());
    var stream =
    new http.ByteStream(DelegatingStream.typed(file.openRead()));
    // get file length
    var length = await file.length();
    // string to uri
    //var uri = Uri.parse("url");
    var uri = Uri.parse(BASE_URL+"api/UploadFile/FileUpload");
    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(file.path));
    // add file to multipart
    request.files.add(multipartFile);
    // send
    var response = await request.send();
    print("reasonPhrase");
    print(response.contentLength);
    print(response.headers);
    print(response.reasonPhrase);
    print(response.request);
    print(response.stream);
    print(response.statusCode);
    String result = "";
    // listen for response
    bool isFinished = false;
    
    response.stream.transform(utf8.decoder).listen((value) {
          result = value;
          print("value");
          print(value);
          print(result);
          
        } , onDone: () {
          print("Osama Osama Osama Osama Osama Osama Osama Osama Osama Osama Osama ");
            final jsonResponse = json.decode(result);
              print(jsonResponse.toString());
              print('After response :     $jsonResponse');
              UploadResponse2 obj = UploadResponse2.fromJson(jsonResponse);
                print("Start Return");
                if (obj.code ==200 ) {
                  setState(() {
                    _image = file;
                    lblFirstUpload=lblFirstUpload+1;
                    firstUpload=obj.data;
                    print('Success ya maaaaaaaaaan');
                  });
                  print(obj.message);
                } else {
                  print("${obj.message}");
                  print('Fail ya maaaaaaaaaan');
                }
              }
        );
    
    
  // UploadApi.upload(file).then((response) {
   
  //     print("Form Register");
  //   print(response.code);
  //     if (response.code ==200 ) {
  //       setState(() {
  //         _image = file;
  //         lblFirstUpload=lblFirstUpload+1;
  //         firstUpload=response.data;
  //         print('Success ya maaaaaaaaaan');
  //       });
  //       print(response.message);
  //     } else {
  //       print("${response.message}");
  //       print('Fail ya maaaaaaaaaan');
  //     }
  
    
  //   });
 }
  upload(fileName, filePath) {
    file = new File(filePath);
    imagename = basename(_path);
    print('Image Name  '+imagename);
    //print()
    //_image = file;
    _upload_Base64(file);

    _extension = fileName.toString().split('.').last;


    _image = file;
    setState(() {
      //     imagename = basename(image.path);
                      //     _image = image;
    });
  }
//////////////
///

  @override
  Widget build(BuildContext context) {
    // TODO: implement getBody
    _context = context;
    return  Scaffold(
        key: _scaffoldKey_reg,
        backgroundColor: bgColor,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [lightBgColor, transColor],
                  begin: const FractionalOffset(0.1, 0.8),
                  end: const FractionalOffset(1.0, 0.5),
                  tileMode: TileMode.clamp),
            ),
          ),
          title: new Text(
            AppLocalizations.of(context).lblCreatAccount,
            style: MansaFont.baseFontStyle(),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          // actions: <Widget>[
          //     IconButton(icon: AppLocalizations.of(context).locale=="en" ? Image.asset("images/1-01.png") : Image.asset("images/asset32.png"),iconSize: 30.0,
          //       onPressed: () => Navigator.of(context).pop()),
          //   ],
          // leading: new IconButton(
          //     icon: AppLocalizations.of(context).locale=="en" ? Image.asset("images/1-01.png") : Image.asset("images/asset32.png"),
          //     iconSize: 30.0,
          //     onPressed: () => Navigator.of(_context).pop()),
              
        ),
        body: Center(
          child: Builder(
            builder: (cont) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    userProfileImage(cont),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        AppLocalizations.of(context).lblUploadPhoto,
                        textAlign: TextAlign.justify,
                        style: MansaFont.getMediumFont_gray(),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    userNameInputs(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  userNameInputs(BuildContext context) {
    _context = context;
    return Container(
      child: Center(child: _buildCard()),
    );
  }

  userProfileImage(BuildContext cont) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // new center image

        Center(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(vertical: 5.0),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: bgColor,
                        blurRadius:
                            0.0, // has the effect of softening the shadow
                        spreadRadius:
                            0.0, // has the effect of extending the shadow
                        offset: Offset(
                          1.0, // horizontal, move right 10
                          1.0, // vertical, move down 10
                        ),
                      )
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: _image != null
                          ? FileImage(_image)
                          : urlImage == null || urlImage.isEmpty
                              ? AssetImage("images/asset9.png")
                              : AssetImage(urlImage),
                    )),
              ),
              Positioned(
                //  bottom: 0,
                left: 0,
                right: 0,
                child: IconButton(
                    color: Colors.transparent,
                    iconSize: 10000,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                    
                      pickImage(cont, () {
                        setState(() {
                          // print("image path");
                          // print(image.path);
                          // _upload_Base64(image);
                          // imagename = basename(image.path);
                          // _image = image;
                        });
                      });
                     // _getDialog(cont,(){});
                      //openFileExplorer();
                      // ImagePickerHelper().pickImage(cont, (File image) {
                      //   setState(() {
                      //     print("image path");
                      //     print(image.path);
                      //     _upload_Base64(image);
                      //     imagename = basename(image.path);
                      //     _image = image;
                      //   });
                      // });
                    }),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  

  // #docregion Card
  Widget _buildCard() => SizedBox(
        child: Form(
          key: _formKey_reg,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: TextFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    cursorColor: desgin_button4_end,
                    key: nameKey_reg,
                    keyboardType: TextInputType.text,
                    textAlign:  AppLocalizations.of(_context).locale=="en"?TextAlign.left:TextAlign.right,
                    style: MansaFont.getLightFont(),
                    decoration: InputDecoration(
                      labelText:AppLocalizations.of(_context).lblname,
                      labelStyle: MansaFont.getLightFont_TextFormField(),
                      fillColor: gray,
                      hintText: AppLocalizations.of(_context).lblnamePlaceholder,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      // border: OutlineInputBorder(
                      //   borderSide:
                      //       const BorderSide(color: Colors.grey, width: 0.0),
                      //   borderRadius: BorderRadius.circular(25.0),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: const BorderSide(
                      //       color: desgin_button4_end, width: 1.0),
                      //   borderRadius: BorderRadius.circular(25.0),
                      // ),
                    ),
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    cursorColor: desgin_button4_end,
                    key: emailKey_reg,
                    keyboardType: TextInputType.emailAddress,
                    textAlign:  AppLocalizations.of(_context).locale=="en"?TextAlign.left:TextAlign.right,
                    style: MansaFont.getLightFont(),
                    decoration: InputDecoration(
                      labelText:AppLocalizations.of(_context).lblemail,
                      labelStyle: MansaFont.getLightFont_TextFormField(),
                      fillColor: gray,
                      hintText: AppLocalizations.of(_context).lblemailPlaceholder,
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
                  )),
              
              // Container(
              //     padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              //     child: ),
               Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: TextFormField(
                                maxLines: 1,
                                textInputAction: TextInputAction.next,
                                cursorColor: desgin_button4_end,
                                obscureText: _obscureText,
                                key: passKey_reg,
                                keyboardType: TextInputType.visiblePassword,
                                textAlign:  AppLocalizations.of(_context).locale=="en"?TextAlign.left:TextAlign.right,
                                style: MansaFont.getLightFont(),
                                decoration: InputDecoration(
                                  labelText:AppLocalizations.of(_context).lblpassword,
                                  labelStyle: MansaFont.getLightFont_TextFormField(),
                                  fillColor: gray,
                                  hintText: AppLocalizations.of(_context).lblpassword,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 17.0, horizontal: 10.0),
                              
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

              Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: TextFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    cursorColor: desgin_button4_end,
                    key: phoneKey_reg,
                    keyboardType: TextInputType.phone,
                    textAlign:  AppLocalizations.of(_context).locale=="en"?TextAlign.left:TextAlign.right,
                    style: MansaFont.getLightFont(),
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(_context).lblphone,
                      labelStyle: MansaFont.getLightFont_TextFormField(),
                      fillColor: gray,
                      hintText: AppLocalizations.of(_context).lblphonePlaceholder,
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
                  )),

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
                    child: InkWell(
                          onTap: (){
                            Navigator.of(_context).push(
                         MaterialPageRoute(builder: (context) => Terms()));
                          },
                          child: Text(
                              AppLocalizations.of(_context).lblAgreeTerms,
                              textAlign: TextAlign.justify,
                              style: MansaFont.getLightFont_TextFormField(),
                            ),
                        ),
                    
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    // wrap your Column in Expanded
                    child: Column(
                      children: <Widget>[
                        appButtonbgimage(AppLocalizations.of(_context).lblSignUp,
                        () => getRegister(),
                         //() => getRegister(),
                            bgColor: lightBgColor, bgColor2: transColor),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  getRegister() {
    try {
      if (_formKey_reg.currentState.validate()) {
        if(passKey_reg.currentState.value==""||passKey_reg.currentState.value==null||
        nameKey_reg.currentState.value==""||nameKey_reg.currentState.value==null||
        phoneKey_reg.currentState.value==""||phoneKey_reg.currentState.value==null||
        emailKey_reg.currentState.value==""||emailKey_reg.currentState.value==null){
          showInSnackBar(AppLocalizations.of(_context).lblEnterYourData, _context, _scaffoldKey_reg);
        }else{
          showAppLoading(_context);
          AuthApi.register(nameKey_reg.currentState.value, emailKey_reg.currentState.value , passKey_reg.currentState.value,phoneKey_reg.currentState.value , firstUpload).then((response) {
          if (response.code ==200 ) {
             hideAppDialog(_context);
             Navigator.of(_context).push(MaterialPageRoute(
                                 builder: (context) => ConfirmationCode(response.data)));
            // saveUser(response.data).then((done) {
            //   if (done){
            //     print(response.data);
            //     Navigator.of(_context).push(MaterialPageRoute(builder: (context) => TabBarScreen()));
            //   }
            //       hideAppDialog(_context);

            // }, onError: (error) {
            //   print("saving user Error : :  :$error");
            // });
          } else if(response.code==304) {
            showInSnackBar("${response.message}", _context, _scaffoldKey_reg);
            print("${response.message}");
            //showInSnacelsekBar("${response.message}", context, _scaffoldKey);
          }else{
            showInSnackBar("${response.message}", _context, _scaffoldKey_reg);
            print("${response.message}");
          }
          setState(() {
          //this.loginApi = false;
          });
        }, onError: (error) {
          showInSnackBar("حدث خطأ", _context, _scaffoldKey_reg);
          print("login Error : : :$error");
          setState(() {
          // this.loginApi = false;
          });
        });
          
        }
        // authenticationBloc.register(
        //     passKey_reg.currentState.value,
        //     nameKey_reg.currentState.value,
        //     phoneKey_reg.currentState.value,
        //     emailKey_reg.currentState.value,
        //     "'"+imagename+"'");

        
      } else {
        hideAppDialog(_context);
      }
    } catch (error) {
      showSnack(error.toString());
    }
    
  }

  void showSnack(String msg, {Duration duration}) async {
    _scaffoldKey_reg.currentState.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: MansaFont.getRegularFont(),
      ),
      duration: duration == null ? Duration(seconds: 5) : duration,
    ));
  }

// void _upload_Base64(File file) {

//   UploadApi.upload_Base64(file).then((response) {
//           if (response.code ==200 ) {
//             print(response.message);
//             print("succcess");
//             imageBaseName=response.data;
//           } else {
//             print("errorrrrr");
//             print("${response.message}");
//             imageBaseName="asset18.png";
//           }
//           // setState(() {
//           // });
//         });
//  }
}

upload(File imageFile) async {
  // open a bytestream
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse("http://mansaapp.somee.com/api/UploadFile/FileUpload");

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFile = new http.MultipartFile('file', stream, length, filename: basename(imageFile.path));

  // add file to multipart
  request.files.add(multipartFile);

  // send
  var response = await request.send();
  print(response.statusCode);

  // listen for response
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
