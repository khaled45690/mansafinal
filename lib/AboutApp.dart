// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'localizations.dart';

// class AboutApp extends StatefulWidget{
//   AboutApp():super();
//   final String title="";

//   @override
//   _AboutAppState createState()=>_AboutAppState();
// }




// class _AboutAppState extends State<AboutApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         title: Text(widget.title)
//       ),
     
//       body: ListView(
//         children: <Widget>[
         
//             new Image.asset(
//               'images/asset7.png',
//               height: 150.0,
//               width: 150.0,
//             ),
//             new SizedBox(height: 5.0),
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(AppLocalizations.of(context).lblname , 
//             style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20.0,
//                     fontStyle: FontStyle.italic,
//                     // padding: EdgeInsets.all(24.0),
//                     color: Colors.black)),
//             ),
            
//           ],
//       ),
//     );
//   }
// }

