import 'dart:convert';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter/cupertino.dart';
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
import 'GetLocation.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'SocialMedia.dart';
import 'Terms.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mansaapp/APIs/UploadApi.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:dio/dio.dart';

class Emarketing extends StatefulWidget {
  @override
  _EmarketingState createState() => new _EmarketingState();
}

class _EmarketingState extends State<Emarketing> with WidgetsBindingObserver {
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String dropdownValue = 'One';
  String name = "";
  String email = "";
  String imageprofile = "";
  List _countries = ["السعوديه", "مصر", "الامارات", "الكويت", "البحرين", "قطر"];
  List _kwaitCities = [
    "اعاصمه",
    "الاحمدي",
    "الفروانية",
    "الجهراء",
    "حولي",
    "مبارك الكبير"
  ];
  List _bahrinCities = [
    "المنامه",
    "المحرق",
    "الرفاع",
    "ستره",
    "مدينه حمد",
    "مدينة عيسى",
    "جد حفص",
    "الحد",
    "	الدراز"
  ];
  List _qatarCities = [
    "أبو الظلوف",
    "أبو ثايله",
    "الدوحه الجديده",
    "الـعريش",
    "البدع الشرقيه",
    "الغنيم",
    "الغارية",
    "الهلال الغربيه",
    "الهلال الشرقيه",
    "الهتمي",
    "الجسره",
    "الجميليه",
    "الكعبان",
    "الخليفه",
    "الخور",
    "الذخيرة",
    "الخاور",
    "الخواير",
    "الـمفجر",
    "القابيه",
    "المدينه الثانيه",
    "العذبة",
    "النجمه",
    "الراكيات",
    "الريان",
    "الرويس",
    "السالاته",
    "السلاتة الجديدة",
    "الصنيع",
    "السوق",
    "الثقب",
    "دخان",
    "زكريت",
    "أم باب",
    "مسيعيد",
    "أم صلال على",
    "أم ضلال محمد",
    "أم الاحويا",
    "أم الشخوط",
    "أم العمد",
    "أم عبيريه",
    "عصاة الراعي",
    "حوطان",
    "الصخامه",
    "مدينة رأس لفان "
  ];
  List _saudiaCities = [
    "مكة المكرمة",
    "جدة",
    "الطائف",
    "القنفذة",
    "الليث",
    "رابغ",
    "خليص",
    "الخرمة",
    "رنية",
    "تربة",
    "الجموم",
    "الأحساء",
    "حفر الباطن	",
    "الجبيل",
    "القطيف",
    "الخبر",
    "الخفجي",
    "الرياض",
    "الدرعيه",
    "الخرج",
    "الدوادمي",
    "المجمعه",
    "القويعيه",
    "الافلاج",
    "وادي الدواسر",
    "الزلفي",
    "شقراء",
    "حوطه بني تميم",
    "عفيف",
    "الغاط",
    "المدينه المنوره",
    "ينبع",
    "العلا",
    "مهد الذهب",
    "الحناكيه",
    "بدر",
    "خيبر",
    "العيص",
    "وادي الفرع",
    "بريده",
    "الرس",
    "المذنب",
    "البكيريه",
    "البدائع",
    "الدمام",
    "الاحساء",
    "حفر الباطن",
    "الجبيل",
    "القطيف",
    "الخبر",
    "الخفجي",
    "أبها",
    "خميس مشيط",
    "بيشه",
    "النماص",
    "محايل عسير",
    "ظهران الجنوب",
    "تثليث",
    "تبوك",
    "الوجه",
    "ضيا",
    "تيماء",
    "أملج",
    "حائل",
    "بقعاء",
    "عرعر",
    "رفجاء",
    "طريف",
    "جازان",
    "صبيا",
    "أبو عريش",
    "صامطه",
    "بيش",
    "الدرب",
    "نجران",
    "شروره",
    "الباحه",
    "بلجرشي",
    "المندق",
    "المخواه",
    "قلوه",
    "سكاكا",
    "القريات",
    "دومه الجندل"
  ];
  List _egyptCities = [
    "القاهره",
    "المنوفيه",
    "الدقهليه",
    "الشرقيه",
    "الغربيه",
    "الاسماعيليه",
    "الاسكندريه",
    "البحر الاحمر",
    "أسوان",
    "سوهاج",
    "قنا",
    "المنيا",
    "الجيزه",
    "القليوبيه",
    "البحيره",
    "مطروح",
    "دمياط",
    "كفر الشيخ",
    "بورسعيد",
    "الاسماعيليه",
    "السويس",
    "شمال سينا",
    "جنوب سينا",
    "بني سويف",
    "الفيوم",
    "أسيوط",
    "الوادي الجديد",
    "قنا",
    "الاقصر"
  ];
  List _emiratesCities = [
    "دبي",
    "أبو ظبي",
    "الشارقه",
    "العين",
    "رأس الخيمه",
    "عجمان",
    "الفجيره",
    "أم القيوين",
    "خورفكان",
    "دبا الحصن"
  ];
  List _discounts = [
    "0%",
    "5%",
    "10%",
    "15%",
    "20%",
    "25%",
    "30%",
    "35%",
    "40%",
    "45%",
    "50%",
    "55%",
    "60%",
    "65%",
    "70%",
    "75%",
    "80%",
    "85%",
    "90%",
    "95%",
    "100%"
  ];
  List _days = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30"
  ];
  List _months = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  List _years = [
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030"
  ];
  List _sectors = [ "حكومي", "أفراد", "جمعيات خيريه" , "خاص"];
  List<DropdownMenuItem<String>> _dropDownMenuCountries;
  List<DropdownMenuItem<String>> _dropDownMenuCities;
  List<DropdownMenuItem<String>> _dropDownMenuDiscounts;
  List<DropdownMenuItem<String>> _dropDownMenudays;
  List<DropdownMenuItem<String>> _dropDownMenumonths;
  List<DropdownMenuItem<String>> _dropDownMenuyears;
  List<DropdownMenuItem<String>> _dropDownMenuSector;
  String _selectedCountry;
  String _selectedCity;
  String _selectedDiscount;
  String _selectedfromDay;
  String _selectedfromMonth;
  String _selectedfromYear;
  String _selectedToDay;
  String _selectedToMonth;
  String _selectedToYear;
  String _selectedSector;

  GlobalKey<FormState> _form_logo = GlobalKey<FormState>();
  var phone1Key_log = GlobalKey<FormFieldState>();
  var phone2Key_log = GlobalKey<FormFieldState>();
  var emailKey_log = GlobalKey<FormFieldState>();
  var desKey_log = GlobalKey<FormFieldState>();
  var destrictKey_log = GlobalKey<FormFieldState>();

  String _path;
  Map<String, String> _paths;
  Map<String, String> _paths2;
  String _extension;
  String _extension2;
  FileType _pickType = FileType.any;
  bool _multiPick = true;
  String uploadTxt1 = "";
  File file;
  String firstUpload = "";
  String secondUpload = "";
  int lblFirstUpload = 0;
  int lblSecondUpload = 0;

  LatLng position;
  String address = "اختر المكان المراد الاعلان عنه من الخريطة";

  String mailValue = "";
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
      String base64Image;
      List<MultipartFile> multipart = List<MultipartFile>();

      for (int i = 0; i < resultList.length; i++) {
        //AssetImage('graphics/background.png')
        print(resultList[i].identifier);
        print(resultList[i]);
        print(resultList[i].name);
        ByteData byteData = await resultList[i]
            .getByteData(quality: imageQualityForMultipleImages);
        List<int> imageData = byteData.buffer.asUint8List();
        base64Image = base64Encode(imageData);
        print(imageData);
        print(base64Image);
        _upload_Base64_pass_Base46(base64Image, resultList[i].name);
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
      //  images = resultList;
      // _error = error;
    });
  }
  Future<void> loadAssetFromCamera2() async {
    final _picked = ImagePicker();
    final picked =  await _picked.getImage(source: ImageSource.camera);

    if (picked != null) {
      print(picked.path.split('/').last);
      String fileName = picked.path.split('/').last;
      final bytes = File(picked.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      _upload_Base64_pass_Base46_2(base64Image , fileName);
    }else {
      print("something happened");
    }
  }
  Future<void> loadAssets2() async {
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
      String base64Image;
      List<MultipartFile> multipart = List<MultipartFile>();

      for (int i = 0; i < resultList.length; i++) {
        //AssetImage('graphics/background.png')
        print(resultList[i].identifier);
        print(resultList[i]);
        print(resultList[i].name);
        ByteData byteData = await resultList[i]
            .getByteData(quality: imageQualityForMultipleImages);
        List<int> imageData = byteData.buffer.asUint8List();
        base64Image = base64Encode(imageData);
        print(imageData);
        print(base64Image);
        _upload_Base64_pass_Base46_2(base64Image, resultList[i].name);
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
      //  images = resultList;
      // _error = error;
    });
  }

  void openFileExplorer() async {
    try {
      _path = null;
      if (_multiPick) {
        var value = await FilePicker.platform.pickFiles(
            type: _pickType, allowedExtensions: [_extension]);
        // showAppLoading(_context);
        // lblFirstUpload="Loading ....";
        _paths = {value.files.first.name:value.files.first.path};
        _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});

        print("Length");
        print(_paths.length);
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

  void _upload_Base64(File file) {
    UploadApi.upload_Base64AndReturnId(file).then((response) {
      if (response.code == 200) {
        setState(() {
          lblFirstUpload = lblFirstUpload + 1;
          firstUpload = firstUpload + response.data + ",";
        });
        print(response.message);
      } else {
        print("${response.message}");
      }
    });
  }

  void _upload_Base64_pass_Base46(String base64, String name) {
    UploadApi.upload_Base64AndReturnId2(base64, name).then((response) {
      if (response.code == 200) {
        setState(() {
          lblFirstUpload = lblFirstUpload + 1;
          firstUpload = firstUpload + response.data + ",";
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
    setState(() {});
  }

//////////////
  void openFileExplorer2() async {
    try {
      _path = null;
      if (_multiPick) {
        var value  = await FilePicker.platform.pickFiles(
            type: _pickType, allowedExtensions: [_extension]);
        _paths2.forEach((fileName, filePath) => {upload2(fileName, filePath)});
        _paths2 = {value.files.first.name:value.files.first.path};
        print("Length");
        print(_paths2.length);
      } else {
        var value = await FilePicker.platform.pickFiles(
            type: _pickType, allowedExtensions: [_extension]);
        _path = value.files.first.name;
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
      if (response.code == 200) {
        setState(() {
          lblSecondUpload = lblSecondUpload + 1;
          secondUpload = firstUpload + response.data + ",";
        });

        print(response.message);
      } else {
        print("${response.message}");
      }
    });
  }

  void _upload_Base64_pass_Base46_2(String base64, String name) {
    UploadApi.upload_Base64AndReturnId2(base64, name).then((response) {
      if (response.code == 200) {
        setState(() {
          lblSecondUpload = lblSecondUpload + 1;
          secondUpload = firstUpload + response.data + ",";
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
    setState(() {});
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
                  tileMode: TileMode.clamp),
            ),
          ),
          title: new Text(
            AppLocalizations.of(context).lblEMarketing_compaigns,
            style: MansaFont.baseFontStyle(),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          leading: new IconButton(
              icon: new IconButton(icon: new Image.asset("images/asset17.png")),
              iconSize: 40.0,
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          actions: <Widget>[
            IconButton(
                icon: AppLocalizations.of(context).locale == "en"
                    ? Image.asset("images/1-01.png")
                    : Image.asset("images/asset32.png"),
                iconSize: 30.0,
                onPressed: () => Navigator.of(context).pop()),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form_logo,
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 20),
                width: MediaQuery.of(context).size.width,
                color: grey_ligth,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblCountry,
                              textAlign: TextAlign.center,
                              style: MansaFont.getBoldFontinside(),
                            ),
                            Container(
                                child: new DropdownButton(
                              value: _selectedCountry,
                              items: _dropDownMenuCountries,
                              onChanged: changedDropDownCountry,
                            )
                                // DropdownCountryExample("قم بالاختيار"),
                                ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblCity,
                              textAlign: TextAlign.center,
                              style: MansaFont.getBoldFontinside(),
                            ),
                            Container(
                                child: new DropdownButton(
                              value: _selectedCity,
                              items: _dropDownMenuCities,
                              onChanged: changedDropDownCity,
                            )
                                //DropdownExample("قم بالاختيار"),
                                ),
                          ],
                        ),
                      ),

                      // Expanded(
                      //   flex: 1,
                      //   child: Text(
                      //       AppLocalizations.of(context).lblCity,
                      //       textAlign: TextAlign.center,
                      //       style: MansaFont.getBoldFontinside(),
                      //     ),
                      // ),
                      // Expanded( // wrap your Column in Expanded
                      // flex: 3,
                      //   child: Container(
                      //       child: DropdownExample("قم بالاختيار"),
                      //     ),
                      // ),
                    ],
                  ),
                  Container(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblSector,
                              textAlign: TextAlign.center,
                              style: MansaFont.getBoldFontinside(),
                            ),
                            Container(
                                child: new DropdownButton(
                              value: _selectedSector,
                              items: _dropDownMenuSector,
                              onChanged: changedDropDownSector,
                            )
                                //DropdownDistrictExample("قم بالاختيار"),
                                ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).lblDistrict + " * ",
                              textAlign: TextAlign.center,
                              style: MansaFont.getBoldFontinside(),
                            ),
                            Container(
                              child: TextFormField(
                                key: destrictKey_log,
                                maxLines: 1,
                                textAlign:
                                    AppLocalizations.of(context).locale == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                style: MansaFont.getLightFont(),
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context).lblDistrict +
                                          " *",
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 5,
                  ),
                ]),
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
                        AppLocalizations.of(context).lblContact_with,
                        textAlign: TextAlign.center,
                        style: MansaFont.getBoldFontinside(),
                      ),
                    ),
                  ]),
              Container(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalizations.of(context).lblFirstNum + " *",
                      //textAlign: TextAlign.center,
                      style: MansaFont.baseFontStyleWithBackground(),
                    ),
                  ),
                  Expanded(
                    // wrap your Column in Expanded
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          key: phone1Key_log,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlign: AppLocalizations.of(context).locale == "en"
                              ? TextAlign.left
                              : TextAlign.right,
                          style: MansaFont.getLightFont(),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .lblFirstNumPlaceholder,
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
                    child: Text(
                      AppLocalizations.of(context).lblSecondNum,
                      textAlign: TextAlign.center,
                      style: MansaFont.baseFontStyleWithBackground(),
                    ),
                  ),
                  Expanded(
                    // wrap your Column in Expanded
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          key: phone2Key_log,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlign: AppLocalizations.of(context).locale == "en"
                              ? TextAlign.left
                              : TextAlign.right,
                          style: MansaFont.getLightFont(),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .lblSecondNumPlaceholder,
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
                    child: Text(
                      AppLocalizations.of(context).lblemail,
                      //textAlign: TextAlign.center,
                      style: MansaFont.baseFontStyleWithBackground(),
                    ),
                  ),
                  Expanded(
                    // wrap your Column in Expanded
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          key: emailKey_log,
                          maxLines: 1,
                          initialValue: mailValue,
                          textAlign: AppLocalizations.of(context).locale == "en"
                              ? TextAlign.left
                              : TextAlign.right,
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

              Container(
                height: 20,
              ),
              Container(
                height: 10,
              ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        AppLocalizations.of(context).lblDiscount,
                        textAlign: TextAlign.center,
                        style: MansaFont.getRegularFontinside(),
                      ),
                    ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedDiscount,
                      items: _dropDownMenuDiscounts,
                      onChanged: changedDropDownDiscount,
                    )
                        //DropdownDiscount("0%"),
                        ),
                    Container(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        AppLocalizations.of(context)
                            .lblFor_Application_Customers,
                        textAlign: TextAlign.center,
                        style: MansaFont.getRegularFontinside2(),
                      ),
                    ),
                  ]),
              Container(
                height: 5,
              ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        AppLocalizations.of(context).lblFrom,
                        textAlign: TextAlign.center,
                        style: MansaFont.getRegularFontinside(),
                      ),
                    ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedfromDay,
                      items: _dropDownMenudays,
                      onChanged: changedDropDownfromday,
                    )
                        //Dropdowndays("1"),
                        ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedfromMonth,
                      items: _dropDownMenumonths,
                      onChanged: changedDropDownfrommonth,
                    )
                        // Dropdown_month("1"),
                        ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedfromYear,
                      items: _dropDownMenuyears,
                      onChanged: changedDropDownfromyear,
                    )
                        //Dropdownyear("2020"),
                        ),
                    Container(
                      width: 5,
                    ),
                  ]),
              Container(
                height: 20,
              ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        AppLocalizations.of(context).lblUnit,
                        textAlign: TextAlign.center,
                        style: MansaFont.getRegularFontinside(),
                      ),
                    ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedToDay,
                      items: _dropDownMenudays,
                      onChanged: changedDropDowntoday,
                    )
                        //Dropdowndays("1"),
                        ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedToMonth,
                      items: _dropDownMenumonths,
                      onChanged: changedDropDowntomonth,
                    )
                        //Dropdown_month("1"),
                        ),
                    Container(
                      width: 5,
                    ),
                    Container(
                        child: new DropdownButton(
                      value: _selectedToYear,
                      items: _dropDownMenuyears,
                      onChanged: changedDropDowntoyear,
                    )
                        //Dropdownyear("2020"),
                        ),
                    Container(
                      width: 5,
                    ),
                  ]),
              Container(
                height: 20,
              ),



              // Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Container(
              //         width: 230,
              //         child: Column(
              //           children: <Widget>[
              //             appButtonbgimage_normal(
              //                 // Strings.getupload(),
              //                 //     () => Navigator.of(context).push(MaterialPageRoute(
              //                 //     builder: (context) => Emarkiting_campaigns())),
              //                 AppLocalizations.of(context).lblgetupload,
              //                     () => Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) => AboutApp())),
              //                 bgColor: desgin_button1_start,
              //                 bgColor2: desgin_button1_end),
              //             Container(
              //               child: Text(
              //                 AppLocalizations.of(context).lblgetupload_text,
              //                 textAlign: TextAlign.center,
              //                 style: MansaFont.getRegularFontinside(),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ]
              // ),

              //  Container(
              //     height: 20,
              //   ),
              //   Container(
              //     child: Text(service==null?"":AppLocalizations.of(context).locale=="en" ?"Service Price : "+service.Price.toString():"سعر الخدمه :  "+service.Price.toString()),
              //   ),

              Container(
                height: 20,
              ),


              InkWell(
                onTap: () async {
                  this.position = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GetLocation()));
                  if (position != null) {
                    print(
                        "loaction is in : : ${position.latitude},${position.longitude}");
                    String address = await getAddress(position);
                    setState(() {
                      this.address = address;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white),
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width / 1.3,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(flex: 7, child: Text(this.address)),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 25.0,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                        TextFormField(
                          key: desKey_log,
                          maxLines: 3,
                          textAlign: AppLocalizations.of(context).locale == "en"
                              ? TextAlign.left
                              : TextAlign.right,
                          style: MansaFont.getLightFont(),
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .lblDescriptionPlaceholder +
                                " *",
                            labelStyle: MansaFont.getLightFont_TextFormField(),
                            // fillColor: Colors.blueGrey,
                            // hintText: AppLocalizations.of(context).lblDescriptionPlaceholder,
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
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
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'images/asset34.png',
                                height: 20,
                                //width: 20,
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      mailValue =
                                          emailKey_log.currentState.value;
                                    });

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
                                      AppLocalizations.of(context).locale ==
                                          "en"
                                          ? 'images/asset311.png'
                                          : 'images/assetAr31.png',
                                      height: 20,

                                      // width: 250,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                ),
                                Text(
                                  AppLocalizations.of(context).locale == "en"
                                      ? " Uploaded " +
                                      lblFirstUpload.toString() +
                                      " Images "
                                      : "* تم رفع " +
                                      lblFirstUpload.toString() +
                                      " صور  ",
                                  textAlign: TextAlign.center,
                                  style: MansaFont.getBoldFontinside_V2(),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'images/asset34.png',
                                height: 20,
                                //width: 20,
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
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
                                                loadAssetFromCamera2();
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
                                                loadAssets2();
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
                                      AppLocalizations.of(context).locale ==
                                          "en"
                                          ? 'images/assetCerEn.PNG'
                                          : 'images/filesAndDocs.png',
                                      height: 20,
                                      width: 100,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                ),
                                Text(
                                  AppLocalizations.of(context).locale == "en"
                                      ? "* Uploaded " +
                                      lblSecondUpload.toString() +
                                      " Images *"
                                      : "* تم رفع " +
                                      lblSecondUpload.toString() +
                                      " صور  *",
                                  textAlign: TextAlign.center,
                                  style: MansaFont.getBoldFontinside_V2(),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ]),

              Container(
                height: 30,
              ),


              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    // wrap your Column in Expanded
                    child: Column(
                      children: <Widget>[
                        appButtonbgimage(
                            // Strings.Next(),
                            // () => Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => Emarkiting_campaigns())),
                            AppLocalizations.of(context).lblNext,
                            () => send_data(),
                            bgColor: lightBgColor,
                            bgColor2: transColor),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        drawer: buildDrawer());
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List _countries) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in _countries) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

  void changedDropDownCountry(String selectedC) {
    setState(() {
      _selectedCountry = selectedC;
      if (selectedC == "السعوديه") {
        _dropDownMenuCities = buildAndGetDropDownMenuItems(_saudiaCities);
      } else if (selectedC == "مصر") {
        _dropDownMenuCities = buildAndGetDropDownMenuItems(_egyptCities);
      } else if (selectedC == "الامارات") {
        _dropDownMenuCities = buildAndGetDropDownMenuItems(_emiratesCities);
      } else if (selectedC == "الكويت") {
        _dropDownMenuCities = buildAndGetDropDownMenuItems(_kwaitCities);
      } else if (selectedC == "البحرين") {
        _dropDownMenuCities = buildAndGetDropDownMenuItems(_bahrinCities);
      } else if (selectedC == "قطر") {
        _dropDownMenuCities = buildAndGetDropDownMenuItems(_qatarCities);
      }

      _selectedCity = _dropDownMenuCities[0].value;
    });
  }

  void changedDropDownCity(String selectedCity) {
    setState(() {
      _selectedCity = selectedCity;
    });
  }

  void changedDropDownSector(String selectedS) {
    setState(() {
      _selectedSector = selectedS;
    });
  }

  void changedDropDownDiscount(String selectedDisc) {
    setState(() {
      _selectedDiscount = selectedDisc;
      //_selectedCity = _dropDownMenuDiscounts[0].value;
    });
  }

  void changedDropDownfromday(String selectedD) {
    setState(() {
      _selectedfromDay = selectedD;
    });
  }

  void changedDropDownfrommonth(String selectedD) {
    setState(() {
      _selectedfromMonth = selectedD;
    });
  }

  void changedDropDownfromyear(String selectedD) {
    setState(() {
      _selectedfromYear = selectedD;
    });
  }

  ////
  void changedDropDowntoday(String selectedD) {
    setState(() {
      _selectedToDay = selectedD;
    });
  }

  void changedDropDowntomonth(String selectedD) {
    setState(() {
      _selectedToMonth = selectedD;
    });
  }

  void changedDropDowntoyear(String selectedD) {
    setState(() {
      _selectedToYear = selectedD;
    });
  }

  send_data() {
    try {
      if (_form_logo.currentState.validate()) {
        if (firstUpload == null ||
            firstUpload == "" ||
            // desKey_log.currentState.value==null||desKey_log.currentState.value==""||
            phone1Key_log.currentState.value == null ||
            phone1Key_log.currentState.value == "" ||
            // phone2Key_log.currentState.value==null||phone2Key_log.currentState.value==""||
            // emailKey_log.currentState.value==null||emailKey_log.currentState.value==""||
            destrictKey_log.currentState.value == null ||
            destrictKey_log.currentState.value == "" ||
            _selectedfromDay == null ||
            _selectedfromDay == "" ||
            _selectedfromMonth == null ||
            _selectedfromMonth == "" ||
            _selectedfromYear == null ||
            _selectedfromYear == "" ||
            _selectedToDay == null ||
            _selectedToDay == "" ||
            _selectedToMonth == null ||
            _selectedToMonth == "" ||
            _selectedToYear == null ||
            _selectedToYear == "" ||
            _selectedDiscount == null ||
            _selectedDiscount == "" ||
            _selectedSector == null ||
            _selectedSector == "" ||
            _selectedCountry == null ||
            _selectedCountry == "" ||
            this.position.latitude == null ||
            this.position.longitude == null ||
            _selectedCity == null ||
            _selectedCity == "") {
          print("objectobjectobjectobjectobjectobjectobject");
          showInSnackBar(AppLocalizations.of(_context).lblEnterYourData,
              _context, _scaffoldKey);
        } else {
          print("service.Price------------------------------------------------------------>>>>>>>>>>>>>>>>>>>>>>");
          print(service.Price);
          //showAppLoading(context);
          ShoppingCartVM obj = new ShoppingCartVM();
          // obj.NameAr=namearabicKey_log.currentState.value;
          // obj.NameEn=nameenglishKey_log.currentState.value;
          obj.Phone1 = phone1Key_log.currentState.value;
          obj.Phone2 = phone2Key_log.currentState.value;
          obj.Description = desKey_log.currentState.value;
          // obj.Facebook=facebookKey_log.currentState.value;
          obj.Email = emailKey_log.currentState.value;
          // obj.Twitter=twitterKey_log.currentState.value;
          // obj.Instagram=instagramKey_log.currentState.value;
          // obj.Snapshat=snapShatKey_log.currentState.value;
          obj.ServiceId = 7;
          obj.UserId = user.user_Id;
          obj.FromDay = _selectedfromDay;
          obj.FromMonth = _selectedfromMonth;
          obj.FromYear = _selectedfromYear;
          obj.ToDay = _selectedToDay;
          obj.ToMonth = _selectedToMonth;
          obj.ToYear = _selectedToYear;
          obj.Discount = _selectedDiscount;
          obj.District = destrictKey_log.currentState.value;
          obj.Sector = _selectedSector;
          obj.Country = _selectedCountry;
          obj.City = _selectedCity;
          obj.Price = service.Price;
          obj.filesIds = firstUpload;
          obj.latitude = "${this.position.latitude}";
          obj.longitude = "${this.position.longitude}";
          obj.AddressForAdvertise = address;
          print(obj.latitude);
          print(obj.longitude);
          print(address);
          //"${this.position.latitude},${this.position.longitude}",
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SocialMediaList(
              socialItem: [
                new SocialItem('', 'images/facebook.jpg', false, 1),
                new SocialItem('','images/tiktok.jpg',false,2),
                new SocialItem('', 'images/instagram.jpg', false, 3),
                new SocialItem('', 'images/twitter.jpg', false, 4),
                new SocialItem('', 'images/snapchat.jpg', false, 5),
              ],
              shoppingCart: obj,
            ),
          ));
        }
      } else {
        hideAppDialog(context);
      }
    } catch (error) {
      print("object");
      print(error.toString());
      hideAppDialog(_context);
      //showSnack(error.toString());
    }
    ;
  }

  UserVM user;
  @override
  void initState() {
    restore();
    super.initState();
    _dropDownMenuCountries = buildAndGetDropDownMenuItems(_countries);
    _selectedCountry = _dropDownMenuCountries[0].value;
    _dropDownMenuCities = buildAndGetDropDownMenuItems(_saudiaCities);
    _selectedCity = _dropDownMenuCities[0].value;
    _dropDownMenuDiscounts = buildAndGetDropDownMenuItems(_discounts);
    _selectedDiscount = _dropDownMenuDiscounts[0].value;
    //
    var now = new DateTime.now();
    var curr_day = now.day.toString();
    var curr_mon = now.month.toString();
    var curr_year = now.year.toString();
    if(curr_day == "31"){
      curr_day = "30";
    }
    if (curr_day.length == 1) {
      curr_day = "0" + curr_day;
    }
    if (curr_mon.length == 1) {
      curr_mon = "0" + curr_mon;
    }
    //
    _dropDownMenudays = buildAndGetDropDownMenuItems(_days);
     _selectedfromDay=_dropDownMenudays[0].value;
     print(curr_day);
    _selectedfromDay = curr_day;
    _dropDownMenudays[0].value;
    _selectedToDay = curr_day;
    _dropDownMenudays[0].value;
    _dropDownMenumonths = buildAndGetDropDownMenuItems(_months);
    _selectedfromMonth = curr_mon; //_dropDownMenumonths[0].value;
    _selectedToMonth = curr_mon; //_dropDownMenumonths[0].value;
    _dropDownMenuyears = buildAndGetDropDownMenuItems(_years);
    _selectedfromYear = now.year.toString(); //_dropDownMenuyears[0].value;
    _selectedToYear = now.year.toString(); //_dropDownMenuyears[0].value;
    //
    _dropDownMenuSector = buildAndGetDropDownMenuItems(_sectors);
    _selectedSector = _dropDownMenuSector[0].value;
    getUser().then((user) {
      setState(() {
        this.user = user;
      });
    });
    if (user != null) {
      print("user.emaillllllllllllllllllll");
      print(user.email);
    }

    ServiceApi.getServices().then((response) {
      if (response.code == 200) {
        response.data.forEach((s) {
          print(s);
          if (s.Id == 7) {
            print(s);
            this.service = s;
          }
        });
      } else {
        print("${response.message}");
      }
      setState(() {});
    });
  }

  ServiceVM service;
  restore() async {
    final SharedPreferences Prefs = await SharedPreferences.getInstance();
    setState(() {
      name = Prefs.getString('username') ?? "";
      email = Prefs.getString('email') ?? "";
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// ignore: must_be_immutaFnextble
class Dropdowndays extends StatefulWidget {
  String test2 = "";
  Dropdowndays(String s) {
    test2 = s;
  }

  @override
  _DropdowndaysState createState() {
    return _DropdowndaysState(test2);
  }
}

class _DropdowndaysState extends State<Dropdowndays> {
  String discount;
  String title2 = "";
  _DropdowndaysState(String s) {
    title2 = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            discount = value;
          });
        },
        hint: Text(title2),
        value: discount,
        items: [
          DropdownMenuItem<String>(
            child: Text('1'),
            value: '1',
          ),
          DropdownMenuItem<String>(
            child: Text('2'),
            value: '2',
          ),
          DropdownMenuItem<String>(
            child: Text('3'),
            value: '3',
          ),
          DropdownMenuItem<String>(
            child: Text('4'),
            value: '4',
          ),
          DropdownMenuItem<String>(
            child: Text('5'),
            value: '5',
          ),
          DropdownMenuItem<String>(
            child: Text('6'),
            value: '6',
          ),
          DropdownMenuItem<String>(
            child: Text('7'),
            value: '7',
          ),
          DropdownMenuItem<String>(
            child: Text('8'),
            value: '8',
          ),
          DropdownMenuItem<String>(
            child: Text('9'),
            value: '9',
          ),
          DropdownMenuItem<String>(
            child: Text('10'),
            value: '10',
          ),
          DropdownMenuItem<String>(
            child: Text('11'),
            value: '11',
          ),
          DropdownMenuItem<String>(
            child: Text('12'),
            value: '12',
          ),
          DropdownMenuItem<String>(
            child: Text('13'),
            value: '13',
          ),
          DropdownMenuItem<String>(
            child: Text('14'),
            value: '14',
          ),
          DropdownMenuItem<String>(
            child: Text('15'),
            value: '15',
          ),
          DropdownMenuItem<String>(
            child: Text('16'),
            value: '16',
          ),
          DropdownMenuItem<String>(
            child: Text('17'),
            value: '17',
          ),
          DropdownMenuItem<String>(
            child: Text('18'),
            value: '18',
          ),
          DropdownMenuItem<String>(
            child: Text('19'),
            value: '19',
          ),
          DropdownMenuItem<String>(
            child: Text('20'),
            value: '20',
          ),
          DropdownMenuItem<String>(
            child: Text('21'),
            value: '21',
          ),
          DropdownMenuItem<String>(
            child: Text('22'),
            value: '22',
          ),
          DropdownMenuItem<String>(
            child: Text('23'),
            value: '23',
          ),
          DropdownMenuItem<String>(
            child: Text('24'),
            value: '24',
          ),
          DropdownMenuItem<String>(
            child: Text('25'),
            value: '25',
          ),
          DropdownMenuItem<String>(
            child: Text('26'),
            value: '26',
          ),
          DropdownMenuItem<String>(
            child: Text('27'),
            value: '27',
          ),
          DropdownMenuItem<String>(
            child: Text('28'),
            value: '28',
          ),
          DropdownMenuItem<String>(
            child: Text('29'),
            value: '29',
          ),
          DropdownMenuItem<String>(
            child: Text('30'),
            value: '30',
          ),
          DropdownMenuItem<String>(
            child: Text('31'),
            value: '31',
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Dropdown_month extends StatefulWidget {
  String test3 = "";
  Dropdown_month(String s) {
    test3 = s;
  }

  @override
  _Dropdown_monthState createState() {
    return _Dropdown_monthState(test3);
  }
}

class _Dropdown_monthState extends State<Dropdown_month> {
  String discount;
  String title2 = "";
  _Dropdown_monthState(String s) {
    title2 = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            discount = value;
          });
        },
        hint: Text(title2),
        value: discount,
        items: [
          DropdownMenuItem<String>(
            child: Text('1'),
            value: '1',
          ),
          DropdownMenuItem<String>(
            child: Text('2'),
            value: '2',
          ),
          DropdownMenuItem<String>(
            child: Text('3'),
            value: '3',
          ),
          DropdownMenuItem<String>(
            child: Text('4'),
            value: '4',
          ),
          DropdownMenuItem<String>(
            child: Text('5'),
            value: '5',
          ),
          DropdownMenuItem<String>(
            child: Text('6'),
            value: '6',
          ),
          DropdownMenuItem<String>(
            child: Text('7'),
            value: '7',
          ),
          DropdownMenuItem<String>(
            child: Text('8'),
            value: '8',
          ),
          DropdownMenuItem<String>(
            child: Text('9'),
            value: '9',
          ),
          DropdownMenuItem<String>(
            child: Text('10'),
            value: '10',
          ),
          DropdownMenuItem<String>(
            child: Text('11'),
            value: '11',
          ),
          DropdownMenuItem<String>(
            child: Text('12'),
            value: '12',
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Dropdownyear extends StatefulWidget {
  String test4 = "";
  Dropdownyear(String s) {
    test4 = s;
  }

  @override
  _DropdownyearState createState() {
    return _DropdownyearState(test4);
  }
}

class _DropdownyearState extends State<Dropdownyear> {
  String discount;
  String title2 = "";
  _DropdownyearState(String s) {
    title2 = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            discount = value;
          });
        },
        hint: Text(title2),
        value: discount,
        items: [
          DropdownMenuItem<String>(
            child: Text('2020'),
            value: '2020',
          ),
          DropdownMenuItem<String>(
            child: Text('2021'),
            value: '2021',
          ),
          DropdownMenuItem<String>(
            child: Text('2022'),
            value: '2022',
          ),
          DropdownMenuItem<String>(
            child: Text('2023'),
            value: '2023',
          ),
          DropdownMenuItem<String>(
            child: Text('2024'),
            value: '2024',
          ),
          DropdownMenuItem<String>(
            child: Text('2025'),
            value: '2025',
          ),
          DropdownMenuItem<String>(
            child: Text('2026'),
            value: '2026',
          ),
          DropdownMenuItem<String>(
            child: Text('2027'),
            value: '2027',
          ),
          DropdownMenuItem<String>(
            child: Text('2028'),
            value: '2028',
          ),
          DropdownMenuItem<String>(
            child: Text('2029'),
            value: '2029',
          ),
          DropdownMenuItem<String>(
            child: Text('2031'),
            value: '2031',
          ),
          DropdownMenuItem<String>(
            child: Text('2032'),
            value: '2032',
          ),
          DropdownMenuItem<String>(
            child: Text('2033'),
            value: '2033',
          ),
          DropdownMenuItem<String>(
            child: Text('2034'),
            value: '2034',
          ),
          DropdownMenuItem<String>(
            child: Text('2035'),
            value: '2035',
          ),
          DropdownMenuItem<String>(
            child: Text('2036'),
            value: '2036',
          ),
          DropdownMenuItem<String>(
            child: Text('2037'),
            value: '2037',
          ),
          DropdownMenuItem<String>(
            child: Text('2038'),
            value: '2038',
          ),
          DropdownMenuItem<String>(
            child: Text('2039'),
            value: '2039',
          ),
          DropdownMenuItem<String>(
            child: Text('2040'),
            value: '2040',
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DropdownDiscount extends StatefulWidget {
  String test2 = "";
  DropdownDiscount(String s) {
    test2 = s;
  }

  @override
  _DropdownDiscountState createState() {
    return _DropdownDiscountState(test2);
  }
}

class _DropdownDiscountState extends State<DropdownDiscount> {
  String discount;
  String title2 = "";
  _DropdownDiscountState(String s) {
    title2 = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            discount = value;
          });
        },
        hint: Text(title2),
        value: discount,
        items: [
          DropdownMenuItem<String>(
            child: Text('0%'),
            value: '0%',
          ),
          DropdownMenuItem<String>(
            child: Text('10%'),
            value: '10%',
          ),
          DropdownMenuItem<String>(
            child: Text('20%'),
            value: '20%',
          ),
          DropdownMenuItem<String>(
            child: Text('30%'),
            value: '30%',
          ),
          DropdownMenuItem<String>(
            child: Text('40%'),
            value: '40%',
          ),
        ],
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  String test = "";
  DropdownExample(String s) {
    test = s;
  }

  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState(test);
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String city;
  String title = "";
  _DropdownExampleState(String s) {
    title = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            city = value;
          });
        },
        hint: Text(title),
        value: city,
        items: [
          DropdownMenuItem<String>(
            child: Text('مكه المكرمه'),
            value: 'مكه المكرمه',
          ),
          DropdownMenuItem<String>(
            child: Text('الرياض'),
            value: 'الرياض',
          ),
          DropdownMenuItem<String>(
            child: Text('جده'),
            value: 'جده',
          ),
          DropdownMenuItem<String>(
            child: Text('المدينه المنوره'),
            value: 'المدينه المنوره',
          ),
          DropdownMenuItem<String>(
            child: Text('تبوك'),
            value: 'تبوك',
          ),
          DropdownMenuItem<String>(
            child: Text('الدمام'),
            value: 'الدمام',
          ),
          DropdownMenuItem<String>(
            child: Text('الاحساء'),
            value: 'الاحساء',
          ),
          DropdownMenuItem<String>(
            child: Text('القطيف'),
            value: 'القطيف',
          ),
          DropdownMenuItem<String>(
            child: Text('خميس مشيط'),
            value: 'خميس مشيط',
          ),
          DropdownMenuItem<String>(
            child: Text('المظيلف'),
            value: 'المظيلف',
          ),
          DropdownMenuItem<String>(
            child: Text('الهفوف'),
            value: 'الهفوف',
          ),
          DropdownMenuItem<String>(
            child: Text('المبرز'),
            value: 'المبرز',
          ),
          DropdownMenuItem<String>(
            child: Text('الطائف'),
            value: 'الطائف',
          ),
          DropdownMenuItem<String>(
            child: Text('نجران'),
            value: 'نجران',
          ),
          DropdownMenuItem<String>(
            child: Text('حفر الباطن'),
            value: 'حفر الباطن',
          ),
          DropdownMenuItem<String>(
            child: Text('الجبيل'),
            value: 'الجبيل',
          ),
          DropdownMenuItem<String>(
            child: Text('ضباء'),
            value: 'ضباء',
          ),
          DropdownMenuItem<String>(
            child: Text('الخرج'),
            value: 'الخرج',
          ),
          DropdownMenuItem<String>(
            child: Text('الثقبه'),
            value: 'الثقبه',
          ),
          DropdownMenuItem<String>(
            child: Text('ينبع البحر'),
            value: 'ينبع البحر',
          ),
          DropdownMenuItem<String>(
            child: Text('الخبر'),
            value: 'الخبر',
          ),
          DropdownMenuItem<String>(
            child: Text('عرعر'),
            value: 'عرعر',
          ),
          DropdownMenuItem<String>(
            child: Text('الحويه'),
            value: 'الحويه',
          ),
          DropdownMenuItem<String>(
            child: Text('عنيزه'),
            value: 'عنيزه',
          ),
          DropdownMenuItem<String>(
            child: Text('سكاكا'),
            value: 'سكاكا',
          ),
          DropdownMenuItem<String>(
            child: Text('جيزان'),
            value: 'جيزان',
          ),
          DropdownMenuItem<String>(
            child: Text('القريات'),
            value: 'القريات',
          ),
          DropdownMenuItem<String>(
            child: Text('الظهران'),
            value: 'الظهران',
          ),
          DropdownMenuItem<String>(
            child: Text('الباحه'),
            value: 'الباحه',
          ),
          DropdownMenuItem<String>(
            child: Text('الزلفي'),
            value: 'الزلفي',
          ),
          DropdownMenuItem<String>(
            child: Text('الرس'),
            value: 'الرس',
          ),
          DropdownMenuItem<String>(
            child: Text('وادي الدواسر'),
            value: 'وادي الدواسر',
          ),
          DropdownMenuItem<String>(
            child: Text('بيشه'),
            value: 'بيشه',
          ),
          DropdownMenuItem<String>(
            child: Text('سيهات'),
            value: 'سيهات',
          ),
          DropdownMenuItem<String>(
            child: Text('شروره'),
            value: 'شروره',
          ),
          DropdownMenuItem<String>(
            child: Text('بحره'),
            value: 'بحره',
          ),
          DropdownMenuItem<String>(
            child: Text('تاروت'),
            value: 'تاروت',
          ),
          DropdownMenuItem<String>(
            child: Text('الدوامي'),
            value: 'الدوامي',
          ),
          DropdownMenuItem<String>(
            child: Text('صبياء'),
            value: 'صبياء',
          ),
          DropdownMenuItem<String>(
            child: Text('بيش'),
            value: 'بيش',
          ),
          DropdownMenuItem<String>(
            child: Text('احد رفيده'),
            value: 'احد رفيده',
          ),
          DropdownMenuItem<String>(
            child: Text('الفريش'),
            value: 'الفريش',
          ),
          DropdownMenuItem<String>(
            child: Text('بارق'),
            value: 'بارق',
          ),
          DropdownMenuItem<String>(
            child: Text('الحوطه'),
            value: 'الحوطه',
          ),
          DropdownMenuItem<String>(
            child: Text('الافلاج'),
            value: 'الافلاج',
          ),
        ],
      ),
    );
  }
}

/////////// Dropdown Sector

class DropdownDistrictExample extends StatefulWidget {
  String test = "";
  DropdownDistrictExample(String s) {
    test = s;
  }

  @override
  _DropdownDistrictExampleState createState() {
    return _DropdownDistrictExampleState(test);
  }
}

class _DropdownDistrictExampleState extends State<DropdownDistrictExample> {
  String District;
  String Districttitle = "";
  _DropdownDistrictExampleState(String s) {
    Districttitle = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            District = value;
          });
        },
        hint: Text(Districttitle),
        value: District,
        items: [
          DropdownMenuItem<String>(
            child: Text('حكومي'),
            value: 'حكومي',
          ),
          DropdownMenuItem<String>(
            child: Text('خاص'),
            value: 'مدني',
          ),
          DropdownMenuItem<String>(
            child: Text('جمعيات خيريه'),
            value: 'جمعيات خيريه',
          ),
        ],
      ),
    );
  }
}

/////////// Dropdown Country

class DropdownCountryExample extends StatefulWidget {
  String test = "";
  DropdownCountryExample(String s) {
    test = s;
  }

  @override
  _DropdownCountryExampleState createState() {
    return _DropdownCountryExampleState(test);
  }
}

class _DropdownCountryExampleState extends State<DropdownCountryExample> {
  String country;
  String countrytitle = "";
  _DropdownCountryExampleState(String s) {
    countrytitle = s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        onChanged: (String value) {
          setState(() {
            country = value;
          });
        },
        hint: Text(countrytitle),
        value: country,
        items: [
          DropdownMenuItem<String>(
            child: Text('السعوديه'),
            value: 'السعوديه',
          ),
          DropdownMenuItem<String>(
            child: Text('مصر'),
            value: 'مصر',
          ),
          DropdownMenuItem<String>(
            child: Text('الامارات'),
            value: 'الامارات',
          ),
        ],
      ),
    );
  }
}
