import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sikka/result/event1result.dart';

import '../payment.dart';
import '../payment2.dart';

class Event4 extends StatefulWidget {
  @override
  _Event4State createState() => _Event4State();
}

class _Event4State extends State<Event4> {

  String userid;
  var moneyadded3;
  @override
  void initState() {
    getCurrentUser();

    super.initState();

    //Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1result()));
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
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("event4").document(documentID).setData({
      "color": x,
      "userid": userid,
      'time': DateTime.now().millisecondsSinceEpoch,
      //"documentID": documentID
//    }).then((result) {
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Homes(),
//          ));
//      // print("store");
    });
  }
  String x = "none";
  Color red =Colors.red;
  Color yellow = Colors.yellow;
  Color blue = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: (){

      //    Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1result()));


      // }),
      body:SafeArea(
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
                  Text("  Event No:-4", style: GoogleFonts.almendra(color: Colors.white,fontSize: 50)),
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
                children: <Widget>[Text("Event time: 6 P.M to 9 P.M",style: GoogleFonts.averiaLibre(color: Colors.white),)],
              ),
            ])),
      ),
    );
  }
}
