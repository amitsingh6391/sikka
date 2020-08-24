

import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/pages/payment.dart';
import 'package:sikka/pages/event4payment.dart';
import 'package:sikka/services/admob_service.dart';

import 'package:sikka/services/aunthication.dart';
import 'package:random_string/random_string.dart';

class Event4 extends StatefulWidget {
//  final String x;
//  Event4({Key key, @required this.x}) : super(key: key);

  @override
  _Event4State createState() => _Event4State();
}

class _Event4State extends State<Event4> {
  String userid;
  var moneyadds;
  var s;
  bool ans = false;
   final ams = AdMobService();
  @override
  void initState() {
     Admob.initialize(ams.getAdMobAppId());
    getCurrentUser();
    super.initState();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  storeuser() async {
    var rng = new Random();
    var coin;
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("Event4").document(userid).setData({
      "color": x,
      "userid": userid,
      "coin": 0,
      'time': DateTime.now(),
      //"documentID": documentID
    });
  }

  //

  storevent4() async {
    var rng = new Random();
    var coin;
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("Event4").document(x).collection("user").document(userid).setData({
      "color": x,
      "userid": userid,
      "coin": 0,
      'time': DateTime.now(),
      //"documentID": documentID
    });
  }

  redamount() async {
    var rng = new Random();
    var coin;
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("Event4").document("amount").setData({
      
      "money": 0,
      
    });
  }

  String x = "none";
  Color red = Colors.red;
  Color yellow = Colors.yellow;
  Color blue = Colors.blue;
  Color pink = Colors.pink;
  Color green = Colors.green;
  Color black = Colors.blueAccent;
  Color purple = Colors.purple;
  Color brown = Colors.brown;
  Color orange = Colors.orange;
  Color black12 = Colors.deepOrange;

  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content:
              new Text("You have not Suffcient coin to  participant in bet"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("add"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Homes()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Text("     Event No:-4",
                  style:
                      GoogleFonts.almendra(color: Colors.white, fontSize: 50)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Select your Color:-",
                style:
                    GoogleFonts.averiaLibre(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
          Container(
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection("coin")
                  .document(userid)
                  .snapshots(), //
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print("loading");
                }
                var coindata = snapshot.data;
                s = coindata["coins"];
                print(s);

                return Row(
                  children: <Widget>[
                    Text(
                      "Your account balance:  ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      s.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 60),
          Row(children: [
            Text("        "),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "red";
                });
              },
              child: Container(
                height: 80,
                width: 50,
                child: Card(
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "yellow";
                });
              },
              child: Container(
                height: 80,
                width: 50,
                child: Card(
                  color: Colors.yellow,
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "blue";
                });
              },
              child: Container(
                height: 80,
                width: 50,
                child: Card(
                  color: Colors.blue,
                ),
              ),
            ),
          
           
            SizedBox(width: 30),
          ]),
          SizedBox(height: 20, width: 20),
          FlatButton(
            color:Colors.white,
            onPressed:(){

if (s > 0) {
               // storeuser();

                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment4(color: x),
                  ));
              } else {
                _showDialog2();
              }
            },
            child:Text(
              "submit",
            ),


          ),
           SizedBox(
            height: 40,
          ),
          Row(children: <Widget>[
            Text(
              "Event time: x:46 min. to x:60 min.",
              style: GoogleFonts.averiaLibre(color: Colors.white),
            )
          ]),

           AdmobBanner(
            adUnitId:"ca-app-pub-5023637575934146/1902938212",
             adSize: AdmobBannerSize.MEDIUM_RECTANGLE
             ),

        ]),
      )),
    );
  }
}
