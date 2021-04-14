import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/ServiceApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/resources/fonts.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'MyCart.dart';
import 'NumPicker.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';
 
class SocialMediaList extends StatefulWidget {
  SocialMediaList({Key key, this.socialItem , this.shoppingCart}) :super(key: key);
  List<SocialItem> socialItem;
  ShoppingCartVM shoppingCart;
  List<int> myList = List<int>();
  @override
  _SocialMediaListState createState() {
    return new _SocialMediaListState();
  }
}
class _SocialMediaListState extends State<SocialMediaList> {

   @override
  void initState() {
    ServiceApi.getEMarketingPrices().then((response) {
          if (response.code ==200 ) {
            setState(() {
              widget.shoppingCart.platforms = response.data;
              print("filled platform");
            });
            response.data.forEach((s){
              
            });
          } else {
            print("${response.message}");
          }
          setState(() {
          });
        });
    // widget.socialItem.forEach((item){
    //   print(item.id);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(AppLocalizations.of(context).lblSocialMediaList),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.socialItem.map((SocialItem socialItem) {
                  return new ShoppingItemList(socialItem);
                }).toList(),
              )),
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
                              (){
                                for (SocialItem p in widget.socialItem) {
                                  if (p.isCheck){
                                    print(p.name);
                                    print(p.id);
                                    widget.myList.add(p.id);
                                  }
                                    print(p.name);
                                }
                                widget.shoppingCart.socials=widget.myList;
                                print(widget.shoppingCart.City);
                                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> Select(shoppingCart: widget.shoppingCart,)));
                              },
                              bgColor: lightBgColor,
                              bgColor2: transColor),
                        ],
                      ),
                    ),
                  ],
                ),
              // new RaisedButton(onPressed: () {
              //   for (SocialItem p in widget.socialItem) {
              //     if (p.isCheck){
              //       print(p.name);
              //       print(p.id);
              //       widget.myList.add(p.id);
              //     }
              //       print(p.name);
              //   }

              //       widget.shoppingCart.socials=widget.myList;
              // //  print(widget.shoppingCart.City);
              //   Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> Select(shoppingCart: widget.shoppingCart,)));
              // },
              //   child: new Text(AppLocalizations.of(context).lblNext),
              // )
            ],
          ),
        )
    );
  }
}

class ShoppingItemList extends StatefulWidget{
  final SocialItem socialItem;
  ShoppingItemList(SocialItem socialItem)
      : socialItem = socialItem,
        super(key: new ObjectKey(socialItem));
  @override
  ShoppingItemState createState() {
    return new ShoppingItemState(socialItem);
  }
}
class ShoppingItemState extends State<ShoppingItemList> {
  final SocialItem socialItem;
  ShoppingItemState(this.socialItem);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:null,
        
        leading: new Container(
          //backgroundColor: Colors.blue,
          child: new Image(image: new AssetImage(socialItem.avatarImage)),

          
        ),

        title: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(child: new Text(socialItem.name)),
                new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
                  setState(() {
                    socialItem.isCheck = value;
                    
                  });
                })
              ],
            ),
            Container(
              height: 10,
            )
          ],
        )
        
    );
  }
}








class SocialItem {
  int id=0;
  String name;
  String avatarImage;
  bool isCheck;
  SocialItem(this.name, this.avatarImage, this.isCheck , this.id);
}



