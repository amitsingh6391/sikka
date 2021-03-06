// import 'dart:io';

// import 'package:sikka/pages/home_page.dart';
// import 'package:sikka/view/helper/authnicate.dart';
// import 'package:sikka/view/helper/helperfunction.dart';
// import "package:flutter/material.dart";
// import 'package:flutter/rendering.dart';

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool userIsLoggedIn;

//   @override
//   void initState() {
//     getLoggedInState();
//     super.initState();
//   }

//   getLoggedInState() async {
//     await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
//       setState(() {
//         userIsLoggedIn = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
       
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//     primaryColor: Color(0xff145C9E),
//     scaffoldBackgroundColor: Color(0xff1F1F1F),
//     accentColor: Color(0xff007EF4),
//     fontFamily: "OverpassRegular",
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: userIsLoggedIn != null
//       ? userIsLoggedIn ? HomePage() : Authenticate()
//       : Container(
//           child: Center(
//             child: Authenticate(),
//           ),
//         ),
//       );
//   }
// }

//neeraj code..


import 'dart:io';

import 'package:sikka/pages/home.dart';
// import 'package:sikka/pages/home_page.dart';
import 'package:sikka/view/helper/authnicate.dart';
import 'package:sikka/view/helper/helperfunction.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

// import '../home.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
    primaryColor: Color(0xff145C9E),
    scaffoldBackgroundColor: Color(0xff1F1F1F),
    accentColor: Color(0xff007EF4),
    fontFamily: "OverpassRegular",
    visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: userIsLoggedIn != null
      ? userIsLoggedIn ? Body() : Authenticate()
      : Container(
          child: Center(
            child: Authenticate(),
          ),
        ),
      );
  }
}