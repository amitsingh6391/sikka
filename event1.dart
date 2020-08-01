import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/payment.dart';
import 'package:sikka/payment2.dart';
import 'package:sikka/result/event1result.dart';
import 'package:sikka/services/aunthication.dart';
import 'package:random_string/random_string.dart';

class Event1 extends StatefulWidget {

//  final String x;
//  Event1({Key key, @required this.x}) : super(key: key);

  @override
  _Event1State createState() => _Event1State();
}

class _Event1State extends State<Event1> {
  String userid;
  var moneyadds;
  @override
  void initState() {
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
//  updateresult() async {
//    var rng = new Random();
//    var coin;
//    String documentID = rng.nextInt(1000000).toString();
//
//    await Firestore.instance.collection("event1").document(documentID).setData({
//      "color": x,
//      "moneyadd":0,
//      "userid": userid,
//      //"coin" : coin,
//      'time': DateTime.now(),
//      //"documentID": documentID
//    });/*.then((result) {
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Event1(),
//          ));*/
//    // print("store");
//    //});
//  }
  storeuser() async {
    var rng = new Random();
    var coin;
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("event1").document(userid).setData({
      "color": x,
      "userid": userid,
      "coin" : 0,
      'time': DateTime.now(),
      //"documentID": documentID
    });/*.then((result) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Event1(),
          ));*/
      // print("store");
    //});
  }

  String x = "none";
  Color red =Colors.red;
  Color yellow = Colors.yellow;
  Color blue = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: [
              SizedBox(height: 60,),
          Row(
            children: <Widget>[
              GestureDetector(onTap:(){
                Navigator.pop(
                    context);
              },
                child: Icon(Icons.arrow_back,color: Colors.white,),),
              Text("     Event No:-1", style: GoogleFonts.almendra(color: Colors.white,fontSize: 50)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text("Select your Color:-", style: GoogleFonts.averiaLibre(color: Colors.white,fontSize: 30),),
            ],
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
                width: 80,
                child: Card(
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "yellow";
                });
              },
              child: Container(
                height: 80,
                width: 80,
                child: Card(
                  color: Colors.yellow,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "blue";
                });
              },
              child: Container(
                height: 80,
                width: 80,
                child: Card(
                  color: Colors.blue,
                ),
              ),
            )
          ]),
          SizedBox(height: 80),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => payment(color:x),
                  ));
              storeuser();
            },
            child: Text("submmit"),
          ),
              SizedBox(height: 40,),
              Row(
                children: <Widget>[Text("Event time: 9 A.M to 12 A.M",style: GoogleFonts.averiaLibre(color: Colors.white),)],
              ),
        ])),
      ),
    );
  }
}
