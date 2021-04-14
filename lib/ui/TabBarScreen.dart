// import 'package:mansa/helper/Preferences.dart';
import 'package:mansaapp/Constants/_buildDrawer.dart';
import 'package:mansaapp/Constants/customcolors.dart';
import 'package:mansaapp/Helper/Preferences.dart';
import 'package:mansaapp/Models/UserVM.dart';
import 'package:mansaapp/ui/Offers.dart';
import 'package:mansaapp/utilis/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mansa/constants/customcolors.dart';
import 'package:mansaapp/resources/Strings.dart';
import 'package:mansaapp/resources/fonts.dart';
// import 'package:mansa/ui/HomeScreen.dart';
import 'package:mansaapp/ui/SigninScreen.dart';
import '../AboutApp.dart';
import '../localizations.dart';
import 'Ads.dart';
import 'CartScreen.dart';
import 'ContactUs.dart';
import 'HomeScreen.dart';
import 'MyCart.dart';
import 'Ourservices.dart';
import 'PaymentScreen.dart';
import 'Terms.dart';
import 'AboutApp.dart';
// import 'CartScreen.dart';
// import 'PaymentScreen.dart';


class TabBarScreen extends StatefulWidget {
  TabBarScreen({Key key, this.title}) : super(key: key);
  String title;

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin{
  BuildContext _context;
  TabController _controller;
  var selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name = "";
  String email = "";
  String imageprofile = "";

UserVM user ;
  @override
  void initState() {
    print("Start Tab ");
    restore();
    super.initState();
    _controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          selectedIndex = _controller.index;
        });
      });
      getUser().then((user){
      setState(() {
              this.user = user ;
      
      });
    });
    //   getLngPref().then((lng){
    //   setState(() {
        
    //     this._LngPref = lng ;
    //     print("LLLLLLLL");
    //     print(this._LngPref.isEnglish);
    //   });
    // });
    // WidgetsBinding.instance.addObserver(this);
  }

  restore() async {
    final SharedPreferences Prefs = await SharedPreferences.getInstance();
    setState(() {
      name = Prefs.getString('username') ?? "";
      email = Prefs.getString('email') ?? "";
      imageprofile = Prefs.getString('image') ?? "";
    });
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _context = context;
    return WillPopScope(
      onWillPop: ()async{
        print("back button presed");
        //Categories.changeNotifierCategoriesBackPressed.sink.add("back hah ");
        return false ;
      },
      child:Scaffold(
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
          title: new Text(gettitle(), style: MansaFont.baseFontStyle(),),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          leading: new IconButton(
                icon: new IconButton(icon:
                new Image.asset("images/asset17.png")
                   ), iconSize: 40.0,
                onPressed: (){
                  _scaffoldKey.currentState.openDrawer();
                  print(" Drawer");
                } 
            ),
          actions: <Widget>[
            CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    NetworkImage(imageprofile),
                backgroundColor: Colors.transparent,
              ),
            // CircleAvatar(
              
            //   backgroundColor: Colors.brown.shade800,
            //   child: new Image.network(imageprofile , fit: BoxFit.cover,)
            // )
            // IconButton(
            //   icon: new Image.network(imageprofile), iconSize: 30.0,
            //   onPressed: () {}),
          ],
        ),
        backgroundColor: bgColor,
        body: Container(
            child: TabBarView(controller: _controller, children: [
              Container(
                child: HomeScreen(),
              ),
              Container(
                child: user==null||user.user_Id==null?Container():CartScreen(),
              ),
              Container(
               child: user==null||user.user_Id==null?Container():PaymentScreen(),
              ),
            ]),
          ),
        

        bottomNavigationBar: Container(
          height: 65,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: bgColor))),
          child: new TabBar(
            controller: _controller,
            tabs: [
              Tab(
                icon: Image.asset(
                  (selectedIndex == 0)
                      ? 'images/asset24.png'
                      : 'images/asset20.png',
                  fit: BoxFit.scaleDown,

                ),
              ),
              Tab(
                icon: Image.asset(
                  (selectedIndex == 1)
                      ? 'images/asset22.png'
                      : 'images/asset21.png',
                  fit: BoxFit.scaleDown,

                ),
              ),
              Tab(

                icon: Image.asset(
                  (selectedIndex == 2)
                      ? 'images/asset23.png'
                      : 'images/asset19.png',
                  fit: BoxFit.scaleDown,

                ),
              ),
            ],
            labelColor: soundPlayerBg,
            unselectedLabelColor: lightBgColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(color: Colors.transparent),
            indicatorPadding: EdgeInsets.all(20.0),
            indicatorColor: soundPlayerBg,
          ),
        ),
        drawer: buildDrawer()
      ) ,
    );
      
      
      
    
   
  }

  String gettitle() {
    String result = "";
    if (_controller.index == 0) {
      result = AppLocalizations.of(context).lblHome;
    }
    else if (_controller.index == 1) {
      result =AppLocalizations.of(context).lblMy_Orders;
    }
    else {
      result = AppLocalizations.of(context).lblPayment;
    }
    return result;
  }


}
