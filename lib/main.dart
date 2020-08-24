

import "package:flutter/material.dart";


import "dart:async";

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sikka/view/viewmain.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp(TheMitian());
}

class TheMitian extends StatefulWidget {
  @override
  _TheMitianState createState() => _TheMitianState();
}

class _TheMitianState extends State<TheMitian> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Sikka",
      //home:Homescreen(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds:5),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>MyApp(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 100,
                                    child: Image(
                    image: AssetImage("assets/icon.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 40),
               

                 Center(
                   child:Row(

                     children:
                     [
                       SizedBox(width:140),
                       RotateAnimatedTextKit(
                             onTap: () {
                               print("Tap Event");
                             },
                             repeatForever: true,
                             text: ["SIKKA", "SIKKA", "SIKKA"],
                             textStyle: GoogleFonts.fredokaOne(fontSize: 27.0, color: Colors.red),
                        //  textAlign: TextAlign.center,
                        //  alignment: AlignmentDirectional.center // or Alignment.topLeft
                           ),
                     ]

                   )
                 ),

                 Text("A name of Trust....",style:TextStyle(fontSize: 20,color:Colors.green,fontWeight:FontWeight.bold)),
               
               
                SizedBox(height: 10),
              ],
            ))));
  }
}