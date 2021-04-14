import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/FamousApi.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/FamousVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../localizations.dart';

class FamousV2 extends StatefulWidget {
  FamousV2({Key key, this.shoppingCart}) : super(key: key);
  ShoppingCartVM shoppingCart;
  @override
  _FamousV2State createState() => _FamousV2State();
}

class _FamousV2State extends State<FamousV2> {
  String headerValue;
  List<SocialFamousVM> SocialFamousVMs = new List<SocialFamousVM>();
  List<ItemModel> prepareData = new List<ItemModel>();
  List<int> myList = List<int>();
  List<String> header = [];
  int preparedDataParameter = 0;
  double totalPrice = 0;
  @override
  void initState() {
    List<String> data = [];
    totalPrice = widget.shoppingCart.Price;
    FamousApi.selectAll().then((response) {
      if (response.code != 200) {
        Navigator.pop(context);
      } else {
        prepareData = <ItemModel>[
          ItemModel(
              header: AppLocalizations.of(context).lblFacebook,
              bodyModel: BodyModel(
                  price: 20,
                  quantity: 10,
                  SocialFamousVMs: new List<FamousVM>())),
          ItemModel(
              header: AppLocalizations.of(context).lblGoogle,
              bodyModel: BodyModel(
                  price: 35,
                  quantity: 5,
                  SocialFamousVMs: new List<FamousVM>())),
          ItemModel(
              header: AppLocalizations.of(context).lblInstagram,
              bodyModel: BodyModel(
                  price: 800,
                  quantity: 15,
                  SocialFamousVMs: new List<FamousVM>())),
          ItemModel(
              header: AppLocalizations.of(context).lblTwitter,
              bodyModel: BodyModel(
                  price: 80,
                  quantity: 150,
                  SocialFamousVMs: new List<FamousVM>())),
          ItemModel(
              header: AppLocalizations.of(context).lblSnapShat,
              bodyModel: BodyModel(
                  price: 80,
                  quantity: 150,
                  SocialFamousVMs: new List<FamousVM>())),
          ItemModel(
              header: AppLocalizations.of(context).lblYoutube,
              bodyModel: BodyModel(
                  price: 80,
                  quantity: 150,
                  SocialFamousVMs: new List<FamousVM>())),
          ItemModel(
              header: AppLocalizations.of(context).locale == "en" ? "Tiktok" : "تيكتوك",
              bodyModel: BodyModel(
                  price: 80,
                  quantity: 150,
                  SocialFamousVMs: new List<FamousVM>())),
        ];
        print("response.data");
        response.data.forEach((famousObj) {
          setState(() {
            print(famousObj.Price);
            if (famousObj.SocialMediaId == 1) {
              prepareData[0].bodyModel.SocialFamousVMs.add(famousObj);
            } else if (famousObj.SocialMediaId == 2) {
              prepareData[1].bodyModel.SocialFamousVMs.add(famousObj);
            } else if (famousObj.SocialMediaId == 3) {
              prepareData[2].bodyModel.SocialFamousVMs.add(famousObj);
            } else if (famousObj.SocialMediaId == 4) {
              prepareData[3].bodyModel.SocialFamousVMs.add(famousObj);
            } else if (famousObj.SocialMediaId == 5) {
              prepareData[4].bodyModel.SocialFamousVMs.add(famousObj);
            } else if (famousObj.SocialMediaId == 6) {
              prepareData[5].bodyModel.SocialFamousVMs.add(famousObj);
            }else if (famousObj.SocialMediaId == 7) {
              prepareData[6].bodyModel.SocialFamousVMs.add(famousObj);
            }
          });
        });
        setState(() {
          setState(() {
            this.apiCall = false;
          });
          for (int i = 0; i < prepareData.length; i++) {
            if (prepareData[i].header == "جوجل" || prepareData[i].header == "Google") {

            }else{
              setState(() {
                header.add(prepareData[i].header);
                headerValue = prepareData[0].header;
              });
            }

          }
          //this.apiCall = false;
        });
      }
    }, onError: (error) {
      setState(() {
        print("Error response.data.ValueAr");
      });
      print("getting moreDetails error : : : $error");
    });
  }

  bool apiCall = true;
  BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(prepareData);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).lblFamous),
      ),
      body: this.apiCall
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 30 , left: 20),
                          decoration: BoxDecoration(boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ], color: Colors.white),
                          child: SizedBox(
                            width: width,
                            child: DropdownButton<String>(

                              isExpanded: true,
                              value: headerValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 25,
                              elevation: 16,
                              style: TextStyle(color: Colors.blue , fontSize: 20),
                              underline: Container(
                                height: 0,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  headerValue = newValue;
                                  if (newValue == "فيسبوك" || newValue == "Facebook") {
                                      preparedDataParameter = 0;
                                      print(preparedDataParameter);
                                  } else if (newValue == "جوجل" || newValue == "Google") {
                                      preparedDataParameter = 1;
                                      print(preparedDataParameter);
                                  } else if (newValue == "انستاجرام" || newValue == "Instagram") {
                                      preparedDataParameter = 2;
                                  } else if (newValue == "تويتر" || newValue == "Twitter") {
                                      preparedDataParameter = 3;
                                  } else if (newValue == "سنابشات" || newValue == "SnapShat") {
                                      preparedDataParameter = 4;
                                  } else if (newValue == "يوتيوب" || newValue == "Youtube") {
                                      preparedDataParameter = 5;
                                  }else if (newValue == "تيكتوك" || newValue == "Tiktok") {
                                    preparedDataParameter = 6;
                                  }

                                  print(newValue);
                                });
                              },
                              items:
                                  header.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildExpandableContent(prepareData[preparedDataParameter] , width),
                        ),

                      ],
                    ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(totalPrice.toString()+AppLocalizations.of(context).lblRyal),
                      appButtonbgimage(
                                          // Strings.Next(),
                                          // () => Navigator.of(context).push(MaterialPageRoute(
                                          //     builder: (context) => Emarkiting_campaigns())),
                                          AppLocalizations.of(context).lblNext,
                                          (){ send_data();},
                                          bgColor: lightBgColor,
                                          bgColor2: transColor),
              ],)
            ],
          ),
      // ListView.builder(
      //   itemCount: prepareData.length+1,
      //   itemBuilder: (context, i) {
      //     if (i == prepareData.length){
      //       return Column(
      //         children: <Widget>[
      //           Text(totalPrice.toString()+AppLocalizations.of(context).lblRyal),
      //     appButtonbgimage(
      //                         // Strings.Next(),
      //                         // () => Navigator.of(context).push(MaterialPageRoute(
      //                         //     builder: (context) => Emarkiting_campaigns())),
      //                         AppLocalizations.of(context).lblNext,
      //                         (){ send_data();},
      //                         bgColor: lightBgColor,
      //                         bgColor2: transColor),
      //         ],
      //       );
      //     }
      //     return new ExpansionTile(
      //       title: new Text(
      //         prepareData[i].header,
      //         style: new TextStyle(
      //             fontSize: 20.0,
      //             fontWeight: FontWeight.bold,
      //             fontStyle: FontStyle.italic,
      //             color: Colors.blue),
      //       ),
      //       children: <Widget>[
      //         new Column(
      //           children: _buildExpandableContent(prepareData[i]),
      //         ),
      //       ],
      //     );
      //
      //     return DropdownButton<String>(
      //       value: "One",
      //       icon: Icon(Icons.arrow_downward),
      //       iconSize: 24,
      //       elevation: 16,
      //       style: TextStyle(
      //           color: Colors.blue
      //       ),
      //       underline: Container(
      //         height: 2,
      //         color: Colors.blueAccent,
      //       ),
      //       onChanged: (String newValue) {
      //         // setState(() {
      //         //   dropdownValue = newValue;
      //         // });
      //       },
      //       items: <String>['One', 'Two', 'Free', 'Four']
      //           .map<DropdownMenuItem<String>>((String value) {
      //         return DropdownMenuItem<String>(
      //           value: value,
      //           child: Text(value),
      //         );
      //       })
      //           .toList(),
      //     );
      //   },
      // ),
    );
  }

  _buildExpandableContent(ItemModel policies , double width) {
    List<Widget> columnContent = [];

    for (var content in policies.bodyModel.SocialFamousVMs)
      columnContent.add(
         Container(
           margin: EdgeInsets.only(top: 20 , bottom: 20),
           height: 130,
           decoration: BoxDecoration(
               boxShadow: <BoxShadow>[
               BoxShadow(
                   color: Colors.grey,
                   blurRadius:5.0,
                   offset: Offset(0.0, 0))
             ], color: Colors.grey.shade300
           ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(

                  children: [
                    Container(
                      width : 90,
                      height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: Image.network(content.Image).image ,fit: BoxFit.fill)
                        ),
                        // child: Image.network(content.Image),
                    ),
                  ],
                ),
                Container(
                  width: width / 1.35,
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context).locale == "en"
                            ? content.NameEn
                            : content.NameAr,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 0 , top: 5),
                                  child: Text(
                                    content.Followers.toString() +
                                        AppLocalizations.of(context).lblFollowers,
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top:10),
                                  child: SmoothStarRating(
                                      isReadOnly: true,
                                      starCount: content.Rate == 0 ? 1 : content.Rate.toDouble(),
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      rating: content.Rate == 0 ? 1 : content.Rate.toDouble(),
                                      size: 30.0,
                                      color: Colors.amberAccent,
                                      borderColor: Colors.amberAccent,
                                      spacing:0.0
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(

                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 0 , top: 20),
                                  child: Text(
                                    content.Price.toString() +
                                        AppLocalizations.of(context).lblRyal,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Container(
                                  child: Checkbox(
                                      value: content.isCheck,
                                      onChanged: (bool value) {
                                        setState(() {
                                          content.isCheck = value;
                                          if (value) {
                                            totalPrice = totalPrice + content.Price;
                                            myList.add(content.Id);
                                          } else {
                                            totalPrice = totalPrice - content.Price;
                                            myList.remove(content.Id);
                                          }
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],

            ),
         ),
      );

    return columnContent;
  }

  send_data() {
    try {
      showAppLoading(context);
      widget.shoppingCart.Price = totalPrice;
      widget.shoppingCart.famous = myList;
      print("MyList " + myList.length.toString());
      ShoppingCartApi.addToShoppingCar(widget.shoppingCart).then((response) {
        if (response.code == 200) {
          hideAppDialog(context);
          // showInSnackBar("تم اضافه الخدمه الي سله الطلبات", context, _scaffoldKey);
          showInSnackBarAfterAddService(
              AppLocalizations.of(context).lblServiceAdded,
              context,
              _scaffoldKey);

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
    } catch (error) {
      print("object");
      print(error.toString());
      hideAppDialog(context);
    }
    ;
  }
}

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

class BodyModel {
  int price;
  int quantity;
  List<FamousVM> SocialFamousVMs;
  BodyModel({this.price, this.quantity, this.SocialFamousVMs});
}

class SocialFamousVM {
  int id = 0;
  String name;
  double price;
  String avatarImage;
  bool isCheck;
  SocialFamousVM(
      {this.name, this.avatarImage, this.isCheck, this.id, this.price});
}
