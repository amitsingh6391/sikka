import "package:flutter/material.dart";


import "dart:async";

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
      Duration(seconds: 100000),
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
      backgroundColor: Colors.transparent,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 100,
                                    child: Image(
                    image: AssetImage("assets/money-exchange-currency-conversion-indian-rupee-dollar-2-5898.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Sikka",
                  style: TextStyle(
                      fontSize: 40, fontFamily: "Dancing", color: Colors.white),
                ),
                SizedBox(height: 30),
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ))));
  }
}
