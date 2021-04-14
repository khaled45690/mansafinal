import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/AdvertiseApi.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Models/Advertise.dart';
import 'package:mansaapp/resources/fonts.dart';

import '../AboutApp.dart';
import '../localizations.dart';
import 'AboutApp.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'MyCart.dart';
import 'Offers.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'SigninScreen.dart';
import 'Terms.dart';

class Ads extends StatefulWidget{
 
  // ContactUs():super();

  @override
  MyAds createState() {
    return MyAds();
  }
}
class MyAds extends State<Ads>{

bool apiCall = true ;
   @override
  void initState() {
    super.initState();
    //post=getAboutApp();
    AdvertiseApi.getAdvertisements().then((response){
      if(response.code !=200){
        Navigator.pop(context);
      }else {
        setState(() {
         this.advertises = response.data;
         setState(() {
          this.apiCall = false ;
        });
          //this.apiCall = false;
        });
      }

    },onError: (error){
      setState(() {
        print("Error response.data.ValueAr");
         //this.content = response.data;
        //this.apiCall = false ;
      });
      print("getting moreDetails error : : : $error");
    });
  }

List<AdvertiseVM> advertises = new List<AdvertiseVM>();
  @override
  void dispose() {
    super.dispose();
  }

    BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey key;
  String dropdownValue = 'One';
  String name="";
  String email="";
  String imageprofile="";
  double priceAsTxt;
  @override
  Widget build(BuildContext context){
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
          title: new Text(
            AppLocalizations.of(context).lblLast_Ads,
            style: MansaFont.baseFontStyle(),
          ),
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
      body: this.apiCall ? Center(child: CircularProgressIndicator(),):GridView.builder(
                      // padding: EdgeInsets.only(
                      //     left: 16.0, right: 16.0 ,bottom: 16.0),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //crossAxisSpacing: 16.0,
                       // mainAxisSpacing: 16.0,
                        // childAspectRatio:
                        // (MediaQuery.of(context).size.width / 2 - 48) /
                        //     (MediaQuery.of(context).size.height /
                        //         3.5),
                      ),
                      itemCount: advertises.length,
                      itemBuilder: (context, index) {
                        AdvertiseVM advertise = advertises[index];
                        priceAsTxt = advertise.Price;
                        return  new InkWell(
                          child:Container(
                            child: Card(
                              child: new Column(
                      children: <Widget>[
                        new Image.network(advertise.Image,fit: BoxFit.fill,),
                        new Container(
                          height: 40,
                        ),
                        new Container(
                          //padding: new EdgeInsets.all(7.0),

                          child: new Row(
                            children: <Widget>[
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.near_me),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text(AppLocalizations.of(context).locale=="en" ?advertise.TitleEn:advertise.TitleAr,style: MansaFont.baseRegularcolorFontE(),),
                             ),
                            //  new Padding(
                            //    padding: new EdgeInsets.all(7.0),
                            //    child: new Icon(Icons.money_off),
                            //  ),
                            //  new Padding(
                            //    padding: new EdgeInsets.all(7.0),
                            //    child: new Text(AppLocalizations.of(context).locale=="en" ?" Price $priceAsTxt":"السعر  $priceAsTxt",style: MansaFont.baseRegularcolorFontE()),
                            //  )

                            ],
                          )
                        ),
                        Center(
                                  child: new Text(AppLocalizations.of(context).locale=="en" ?advertise.Description:advertise.DescriptionAr,style: MansaFont.baseRegularcolorFontE()),
                                ),
                      ],
                    ),
                            ),
                          )
                    
                  );


                      }),
      drawer: buildDrawer()
    );
  }
}

// class Ads extends StatelessWidget{
//   BuildContext _context;
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   GlobalKey key;
//   String dropdownValue = 'One';
//   String name="";
//   String email="";
//   String imageprofile="";

//   List cards = new List.generate(20, (i)=>new CustomCard()).toList();
//   @override
//   Widget build(BuildContext context) {
//       return new Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: bgColor,
//             appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: new BoxDecoration(
//               gradient: new LinearGradient(
//                   colors: [lightBgColor, transColor],
//                   begin: const FractionalOffset(0.0, 0.0),
//                   end: const FractionalOffset(0.5, 0.0),
//                   stops: [0.0, 1.0],
//                   tileMode: TileMode.clamp
//               ),
//             ),
//           ),
//           title: new Text(
//             AppLocalizations.of(context).lblLast_Ads,
//             style: MansaFont.baseFontStyle(),
//           ),
//           centerTitle: true,
//             automaticallyImplyLeading: true,
//             elevation: 0.0,
//             leading: new IconButton(icon: AppLocalizations.of(context).locale=="en" ? Image.asset("images/asset32.png") : Image.asset("images/rightArrow.png"),iconSize: 30.0,
//                 onPressed: () => Navigator.of(context).pop()),
//             actions: <Widget>[
//               IconButton(
//                   icon: new IconButton(icon:
//                   imageprofile.isEmpty ? new Image.asset("images/asset17.png"): NetworkImage(imageprofile)),iconSize: 40.0,
//                   onPressed: () => _scaffoldKey.currentState.openDrawer()
//               ),
//             ],
//         ),
//             body: new Container(
//               child: new ListView(
//                 children: cards,
//               )

//             ),
//             drawer: buildDrawer()

//         );

//     }
// }

// class CustomCard extends StatelessWidget {
//    AdvertiseVM ads;
//   CustomCard({this.ads});
//   @override
//   Widget build(BuildContext context) {
    
//               return  new Card(
//                     child: new Column(
//                       children: <Widget>[
//                         new Image.asset("images/ads.jpg",fit: BoxFit.fill,),
                        
//                         new Padding(
//                           padding: new EdgeInsets.all(7.0),
//                           child: new Row(
//                             children: <Widget>[
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Icon(Icons.near_me),
//                              ),
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Text(ads.TitleAr,style: new TextStyle(fontSize: 18.0),),
//                              ),
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Icon(Icons.money_off),
//                              ),
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Text('سعر الاعلان',style: new TextStyle(fontSize: 18.0)),
//                              )

//                             ],
//                           )
//                         )
//                       ],
//                     ),
//                   );
//   }
// }


