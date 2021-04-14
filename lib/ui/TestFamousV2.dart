import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/FamousApi.dart';
import 'package:mansaapp/APIs/ShoppingCartApi.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Constants/strings.dart';
import 'package:mansaapp/Models/FamousVM.dart';
import 'package:mansaapp/Models/ShoppingCartVM.dart';
import 'package:mansaapp/utilis/CustomizedWidgets.dart';

import '../localizations.dart';

class TestFamousV2 extends StatefulWidget {
  @override
  _TestFamousV2State createState() => _TestFamousV2State();
}

class _TestFamousV2State extends State<TestFamousV2> {
  List<SocialFamousVM> SocialFamousVMs = new List<SocialFamousVM>();
  List<ItemModel> prepareData = new List<ItemModel>();
    List<int> myList = List<int>();

  double totalPrice = 0;
  @override
  void initState() {
    totalPrice = 55;
    FamousApi.selectAll().then((response){
      if(response.code !=200){
        Navigator.pop(context);
      }else {
        prepareData = <ItemModel>[
        ItemModel(header: 'Facebook', bodyModel: BodyModel(price: 20, quantity: 10,SocialFamousVMs: new List<FamousVM>())),
        ItemModel(header: 'Google', bodyModel: BodyModel(price: 35, quantity: 5,SocialFamousVMs: new List<FamousVM>())),
        ItemModel(header: 'Instagram', bodyModel: BodyModel(price: 800, quantity: 15,SocialFamousVMs: new List<FamousVM>())),
        ItemModel(header: 'Twitter', bodyModel: BodyModel(price: 80, quantity: 150,SocialFamousVMs: new List<FamousVM>())),
      ItemModel(header: 'Snapchat', bodyModel: BodyModel(price: 80, quantity: 150,SocialFamousVMs: new List<FamousVM>())),
      ItemModel(header: 'Youtube', bodyModel: BodyModel(price: 80, quantity: 150,SocialFamousVMs: new List<FamousVM>()))
      ];
        response.data.forEach((famousObj){
          setState(() {
            if(famousObj.SocialMediaId == 1){
            prepareData[0].bodyModel.SocialFamousVMs.add(famousObj);
          }else if(famousObj.SocialMediaId == 2){
            prepareData[1].bodyModel.SocialFamousVMs.add(famousObj);
          }else if(famousObj.SocialMediaId == 3){
            prepareData[2].bodyModel.SocialFamousVMs.add(famousObj);
          }else if(famousObj.SocialMediaId == 4){
            prepareData[3].bodyModel.SocialFamousVMs.add(famousObj);
          }else if(famousObj.SocialMediaId == 5){
            prepareData[4].bodyModel.SocialFamousVMs.add(famousObj);
          }else if(famousObj.SocialMediaId == 6){
            prepareData[5].bodyModel.SocialFamousVMs.add(famousObj);
          }
          });
        });
        setState(() {
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
    
    // widget.socialItem.forEach((item){
    //   print(item.id);
    // });
  }
  
bool apiCall = true ;
 BuildContext _context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).lblFamous),
      ),
      body: this.apiCall ? Center(child: CircularProgressIndicator(),):
      
      
//       Container(
//           padding: EdgeInsets.all(10),
          
//         child: Column(
//         children: <Widget>[
          
          
//           Text(prepareData[0].header),
//           Container(
//             child: Expanded(
//             flex: 1,
//                     child: ListView(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               children: prepareData[0].bodyModel.SocialFamousVMs.map((FamousVM socialItem) {

//                                 //return Text("data");
//                                 return new ListTile(
//         onTap:null,
        
//         leading: new Container(
//           //backgroundColor: Colors.blue,
//           child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:
//                     NetworkImage(socialItem.Image ),
//                 backgroundColor: Colors.transparent,
//               ),

          
//         ),

//         title: Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
                
//                // Container(height: 4,),
                
//                 new Expanded(child: 
//                 new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
//                 ,style: TextStyle( fontSize: 16))),
//                 Container(height: 10,),
//                     new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
//                 new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
//                   setState(() {
//                     socialItem.isCheck = value;
//                     if(value){
//                       totalPrice =totalPrice +socialItem.Price;
//                       myList.add(socialItem.Id);
//                     }else{
//                       totalPrice =totalPrice -socialItem.Price;
//                       myList.remove(socialItem.Id);
//                     }
                    
//                   });
//                 })
//               ],
//             ),
//             Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
//             // Container(
//             //   height: 10,
//             // )
//           ],
//         )
        
//     );
//                                //return FamousUsersList(socialItem);
//                               }).toList(),
//                             ),
//                   ),
//           ),
          
//                   Container(height: 20,),
//     //      Text(prepareData[1].header),
//     //       Expanded(
//     //         flex: 1,
//     //                 child: ListView(
//     //                 scrollDirection: Axis.vertical,
//     //                 shrinkWrap: true,
//     //                           padding: EdgeInsets.symmetric(vertical: 8.0),
//     //                           children: prepareData[1].bodyModel.SocialFamousVMs.map((FamousVM socialItem) {

//     //                             //return Text("data");
//     //                              return new ListTile(
//     //     onTap:null,
        
//     //     leading: new Container(
//     //       //backgroundColor: Colors.blue,
//     //       child: CircleAvatar(
//     //             radius: 25.0,
//     //             backgroundImage:
//     //                 NetworkImage(socialItem.Image ),
//     //             backgroundColor: Colors.transparent,
//     //           ),
//     //     ),

//     //     title: Column(
//     //       children: <Widget>[
//     //         new Row(
//     //           children: <Widget>[
                
//     //            // Container(height: 4,),
//     //             new Expanded(child: 
//     //             new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
//     //             ,style: TextStyle( fontSize: 16))),
//     //             Container(height: 10,),
//     //                 new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
//     //             new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
//     //               setState(() {
//     //                 socialItem.isCheck = value;
//     //                 if(value){
//     //                   totalPrice =totalPrice +socialItem.Price;
//     //                   myList.add(socialItem.Id);
//     //                 }else{
//     //                   totalPrice =totalPrice -socialItem.Price;
//     //                   myList.remove(socialItem.Id);
//     //                 }
//     //               });
//     //             })
//     //           ],
//     //         ),
//     //         Text(socialItem.Followers.toString() +  AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
//     //         // Container(
//     //         //   height: 10,
//     //         // )
//     //       ],
//     //     )
        
//     // );
//     //                           // return FamousUsersList(socialItem);
//     //                           }).toList(),
//     //                         ),
//     //               ),
          
          
//           Text(prepareData[2].header),
//           Expanded(
//                     child: ListView(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               children: prepareData[2].bodyModel.SocialFamousVMs.map((FamousVM socialItem) {

//                                 //return Text("data");
//                                  return new ListTile(
//         onTap:null,
        
//         leading: new Container(
//           //backgroundColor: Colors.blue,
//           child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:
//                     NetworkImage(socialItem.Image ),
//                 backgroundColor: Colors.transparent,
//               ),          
//         ),

//         title: Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
                
//                // Container(height: 4,),
//                 new Expanded(child: 
//                 new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
//                 ,style: TextStyle( fontSize: 16))),
//                 Container(height: 10,),
//                     new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
//                 new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
//                   setState(() {
//                     socialItem.isCheck = value;
//                     if(value){
//                       totalPrice =totalPrice +socialItem.Price;
//                       myList.add(socialItem.Id);
//                     }else{
//                       totalPrice =totalPrice -socialItem.Price;
//                       myList.remove(socialItem.Id);
//                     }
//                   });
//                 })
//               ],
//             ),
//             Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
//             // Container(
//             //   height: 10,
//             // )
//           ],
//         )
        
//     );
//                                //return FamousUsersList(socialItem);
//                               }).toList(),
//                             ),
//                   ),
//           Text(prepareData[3].header),
//           Expanded(
//                     child: ListView(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               children: prepareData[3].bodyModel.SocialFamousVMs.map((FamousVM socialItem) {

//                                 //return Text("data");
//                                  return new ListTile(
//         onTap:null,
        
//         leading: new Container(
//           //backgroundColor: Colors.blue,
//           child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:
//                     NetworkImage(socialItem.Image ),
//                 backgroundColor: Colors.transparent,
//               ),
//         ),

//         title: Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
                
//                // Container(height: 4,),
//                 new Expanded(child: 
//                 new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
//                 ,style: TextStyle( fontSize: 16))),
//                 Container(height: 10,),
//                     new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
//                 new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
//                   setState(() {
//                     socialItem.isCheck = value;
//                     if(value){
//                       totalPrice =totalPrice +socialItem.Price;
//                       myList.add(socialItem.Id);
//                     }else{
//                       totalPrice =totalPrice -socialItem.Price;
//                       myList.remove(socialItem.Id);
//                     }
//                   });
//                 })
//               ],
//             ),
//             Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
//             // Container(
//             //   height: 10,
//             // )
//           ],
//         )
        
//     );
//                                //return FamousUsersList(socialItem);
//                               }).toList(),
//                             ),
//                   ),
//           Text(prepareData[4].header),
//           Expanded(
//                     child: ListView(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               children: prepareData[4].bodyModel.SocialFamousVMs.map((FamousVM socialItem) {

//                                 //return Text("data");
//                                  return new ListTile(
//         onTap:null,
        
//         leading: new Container(
//           //backgroundColor: Colors.blue,
//           child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:
//                     NetworkImage(socialItem.Image ),
//                 backgroundColor: Colors.transparent,
//               ),
//         ),

//         title: Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
                
//                // Container(height: 4,),
//                 new Expanded(child: 
//                 new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
//                 ,style: TextStyle( fontSize: 16))),
//                 Container(height: 10,),
//                     new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
//                 new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
//                   setState(() {
//                     socialItem.isCheck = value;
//                     if(value){
//                       totalPrice =totalPrice +socialItem.Price;
//                       myList.add(socialItem.Id);
//                     }else{
//                       totalPrice =totalPrice -socialItem.Price;
//                       myList.remove(socialItem.Id);
//                     }
//                   });
//                 })
//               ],
//             ),
//             Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
//             // Container(
//             //   height: 10,
//             // )
//           ],
//         )
        
//     );
//                                //return FamousUsersList(socialItem);
//                               }).toList(),
//                             ),
//                   ),
//           Text(prepareData[5].header),
//           Expanded(
//                     child: ListView(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               children: prepareData[5].bodyModel.SocialFamousVMs.map((FamousVM socialItem) {

//                                 //return Text("data");
//  return new ListTile(
//         onTap:null,
        
//         leading: new Container(
//           //backgroundColor: Colors.blue,
//           child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage:
//                     NetworkImage(socialItem.Image ),
//                 backgroundColor: Colors.transparent,
//               ),
//         ),

//         title: Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
                
//                // Container(height: 4,),
//                 new Expanded(child: 
//                 new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
//                 ,style: TextStyle( fontSize: 16))),
//                 Container(height: 10,),
//                     new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
//                 new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
//                   setState(() {
//                     socialItem.isCheck = value;
//                     if(value){
//                       totalPrice =totalPrice +socialItem.Price;
//                       myList.add(socialItem.Id);
//                     }else{
//                       totalPrice =totalPrice -socialItem.Price;
//                       myList.remove(socialItem.Id);
//                     }
//                   });
//                 })
//               ],
//             ),
//             Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
//             // Container(
//             //   height: 10,
//             // )
//           ],
//         )
        
//     );
//                                //return FamousUsersList(socialItem);
//                               }).toList(),
//                             ),
//                   ),
//                   Text(totalPrice.toString()+AppLocalizations.of(context).lblRyal),
//           appButtonbgimage(
//                               // Strings.Next(),
//                               // () => Navigator.of(context).push(MaterialPageRoute(
//                               //     builder: (context) => Emarkiting_campaigns())),
//                               AppLocalizations.of(context).lblNext,
//                               (){ send_data();},
//                               bgColor: lightBgColor,
//                               bgColor2: transColor),
//         ],
//       ),
//         ),
        
        
        ListView.builder(
          itemCount: prepareData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: Duration(seconds: 1),
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'PRICE: ${prepareData[index].bodyModel.price}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PRICE: ${prepareData[index].bodyModel.SocialFamousVMs.length}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PRICE: ${prepareData[index].bodyModel.SocialFamousVMs.length}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PRICE: ${prepareData[index].bodyModel.SocialFamousVMs.length}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            ),
                            
                            // Container(
                            //   child: ListView(
                            //   padding: EdgeInsets.symmetric(vertical: 8.0),
                            //   children: prepareData[index].bodyModel.SocialFamousVMs.map((socialItem) {

                            //     return Text("data");

                            //    // return FamousUsersList(socialItem);
                            //   }).toList(),
                            // ),
                            // ),
                            
                          ],
                        ),
                       
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        prepareData[index].header,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: prepareData[index].isExpanded,
                ),
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  prepareData[index].isExpanded =
                      !prepareData[index].isExpanded;
                });
              },
            );
          
          
          },
        ),
      
    );
  }
 send_data() {

    
    try {
      showAppLoading(context);
     
    }catch(error) {
      print("object");
      print(error.toString());
      hideAppDialog(context);
    };

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
  BodyModel({this.price, this.quantity ,this.SocialFamousVMs});
}
class SocialFamousVM {
  int id=0;
  String name;
  double price;
  String avatarImage;
  bool isCheck;
  SocialFamousVM({this.name, this.avatarImage, this.isCheck , this.id , this.price});
}
///////////////////
///
///
///
class FamousUsersList extends StatefulWidget{
  final FamousVM socialItem;
  FamousUsersList(FamousVM socialItem)
      : socialItem = socialItem,
        super(key: new ObjectKey(socialItem));
  @override
  FamousUsersState createState() {
    return new FamousUsersState(socialItem);
  }
}
class FamousUsersState extends State<FamousUsersList> {
  final FamousVM socialItem;
  FamousUsersState(this.socialItem);
  @override
  Widget build(BuildContext context) {
     // return new ListTile(leading:Icon(Icons.code),title:Text('hahaha'));

    return new ListTile(
        onTap:null,
        
        leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage(socialItem.Image ),
                backgroundColor: Colors.transparent,
              ),

        title: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                
               // Container(height: 4,),
                new Expanded(child: 
                new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
                ,style: TextStyle( fontSize: 16))),
                Container(height: 10,),
                    new Expanded(
                      child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,
                      style: TextStyle( fontSize: 15),)),
                new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
                  setState(() {
                    socialItem.isCheck = value;
                   // totalPrice =totalPrice +socialItem.Price;
                  });
                })
              ],
            ),
            Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
            // Container(
            //   height: 10,
            // )
          ],
        )
        
    );
  }
}
/////////////


/////////////////
///Cats
///
///
// return   Column(
//                       children: <Widget>[
//                         Container(
//                           height: 160.0,
//                           padding: EdgeInsets.only( bottom: 16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: <Widget>[
//                               Flexible(
//                                 child:category.bodyModel == null ? 
//                                 Container() : Container(
//                                 padding: EdgeInsets.only(left: 16.0 , right: 16.0 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Row(
//                                       children: <Widget>[
//                                         Image.network(category.header),
//                                         SizedBox(width: 8.0,),
//                                         Align(alignment: Alignment.center,child: Text("${category.header}",style: TextStyle(fontSize: 20.0 , color: Colors.black ,fontWeight: FontWeight.bold),)),
//                                       ],
//                                     ),
//                                     Container(
//                                       width: 70.0,
//                                       height: 30.0,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20.0),
//                                         color: Color(0x66000000),
//                                       ),
//                                       child: InkWell(
//                                         onTap: (){
//                                         },
//                                         child: Center(
//                                           child: Text("المزيد >" , style: TextStyle(color: Colors.white),),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),flex: 2,),
//                               SizedBox(height: 16.0,),
//                               Flexible(child: Container(
//                                 child: ListView.builder(
//                                     itemCount: category?.bodyModel?.length,
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (context ,index){
//                                       BodyModel product = category?.bodyModel[index];
//                                       return Padding(
//                                         padding: const EdgeInsets.only(right :8.0),
//                                         child: ClipRRect(
//                                           borderRadius: BorderRadius.circular(8.0),
//                                           child: Container(
//                                             child: InkWell(
//                                               child: Text(product.price.toString()),
//                                               onTap: (){
//                                               //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(product)));
//                                               }
//                                             ),
//                                             width: MediaQuery.of(context).size.width/3,
//                                             decoration: BoxDecoration(
//                                                 //image: DecorationImage(image: NetworkImage(product.images[0].image) ,fit: BoxFit.fill)
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                               ),flex: 5,),
//                             ],
//                           ),
//                         ),
//                         Padding(padding: EdgeInsets.all(8.0),
//                         child: Divider(height: 2.0, color: Colors.grey,),
//                         )
//                       ],
//                     );