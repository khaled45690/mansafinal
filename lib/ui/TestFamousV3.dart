import 'package:flutter/material.dart';
import 'package:mansaapp/APIs/FamousApi.dart';
import 'package:mansaapp/Models/FamousVM.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TestFamousV3 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "List View Collapsable",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageScreenState createState() => new _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePage> {
List<SocialFamousVM> SocialFamousVMs = new List<SocialFamousVM>();
  List<ItemModel> prepareData = new List<ItemModel>();
    List<int> myList = List<int>();
  double totalPrice = 0;
  @override
  void initState() {
   // totalPrice = widget.shoppingCart.Price;
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemCount: prepareData.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(
              prepareData[i].header,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue),
            ),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(prepareData[i]),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildExpandableContent(ItemModel policies) {
    List<Widget> columnContent = [];

    for (var content in policies.bodyModel.SocialFamousVMs)
      columnContent.add(
        // new ListTile(
        //     title: new Text(
        //       content,
        //       style: new TextStyle(fontSize: 18.0, color: Colors.lightBlue),
        //     ),

        //     onTap: () {
        //       _openWebUrl(Websites.endpoints[content], content);
        //     }),
        new ListTile(
        onTap:null,
        
        leading: new Container(
          //backgroundColor: Colors.blue,
          child: CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    NetworkImage("https://w-aqar.com/Content/assets/images/logo2.png"),
                backgroundColor: Colors.transparent,
              ),
        ),

        title: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                
               // Container(height: 4,),
                new Expanded(child: 
                new Text(content.NameAr
                ,style: TextStyle( fontSize: 16))),
                Container(height: 10,),
                    new Expanded(child: new Text(content.Rate.toString() ,style: TextStyle( fontSize: 15),)),
                new Checkbox(value: true, onChanged: (bool value) {
                  setState(() {
                    content.isCheck = value;
                    if(value){
                      totalPrice =totalPrice +content.Price;
                      myList.add(content.Id);
                    }else{
                      totalPrice =totalPrice -content.Price;
                      myList.remove(content.Id);
                    }
                  });
                })
              ],
            ),
            Text(content.NameAr, style: TextStyle( fontSize: 15), )
            // Container(
            //   height: 10,
            // )
          ],
        )
        
    ),
      );

    return columnContent;
  }

  _openWebUrl(String url, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneralWebScreen(url: url, item: title),
      ),
    );
  }
}

class Websites {
  final String title;
  List<String> contents = [];

  static final Map<String, String> endpoints = const {
    "git": "https://github.com/",
    "google": "https://www.google.com/",
    "flutter": "https://flutter.dev/docs/get-started/install",
    "swift": "https://developer.apple.com/swift/"
  };

  Websites(this.title, this.contents);
}

final titles = [
  'websites sample 1',
  'websites sample 2',
];

List<Websites> policies = [
  new Websites('websites sample 1', [
    'git',
    'flutter',
  ]),
  new Websites('Websites sample 2', ['google', 'swift']),
];
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
/////////////


class GeneralWebScreen extends StatelessWidget {
  final String url;
  final String item;

  GeneralWebScreen({Key key, @required this.url, @required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item),
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}



























    //                              return new ListTile(
    //     onTap:null,
        
    //     leading: new Container(
    //       //backgroundColor: Colors.blue,
    //       child: CircleAvatar(
    //             radius: 25.0,
    //             backgroundImage:
    //                 NetworkImage(socialItem.Image ),
    //             backgroundColor: Colors.transparent,
    //           ),
    //     ),

    //     title: Column(
    //       children: <Widget>[
    //         new Row(
    //           children: <Widget>[
                
    //            // Container(height: 4,),
    //             new Expanded(child: 
    //             new Text(AppLocalizations.of(context).locale=="en"?socialItem.NameEn:socialItem.NameAr
    //             ,style: TextStyle( fontSize: 16))),
    //             Container(height: 10,),
    //                 new Expanded(child: new Text(socialItem.Price.toString() + AppLocalizations.of(context).lblRyal ,style: TextStyle( fontSize: 15),)),
    //             new Checkbox(value: socialItem.isCheck, onChanged: (bool value) {
    //               setState(() {
    //                 socialItem.isCheck = value;
    //                 if(value){
    //                   totalPrice =totalPrice +socialItem.Price;
    //                   myList.add(socialItem.Id);
    //                 }else{
    //                   totalPrice =totalPrice -socialItem.Price;
    //                   myList.remove(socialItem.Id);
    //                 }
    //               });
    //             })
    //           ],
    //         ),
    //         Text(socialItem.Followers.toString() + AppLocalizations.of(context).lblFollowers , style: TextStyle( fontSize: 15), )
    //         // Container(
    //         //   height: 10,
    //         // )
    //       ],
    //     )
        
    // )
                        