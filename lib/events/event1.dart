import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/result/event1result.dart';
import 'package:sikka/services/aunthication.dart';
import 'package:random_string/random_string.dart';

class Event1 extends StatefulWidget {
  @override
  _Event1State createState() => _Event1State();
}

class _Event1State extends State<Event1> {
  String userid;
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

  storeuser() async {
    var rng = new Random();
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("event1").document(documentID).setData({
      "color": x,
      "userid": userid,
      'time': DateTime.now().millisecondsSinceEpoch,
      "documentID": documentID
    }).then((result) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Event1result(),
          ));
      // print("store");
    });
  }

  String x = "none";

  Color yellow = Colors.yellow;
  Color blue = Colors.blue;
  Color black = Colors.black;
  Color green = Colors.green;
  Color orange = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: [
          Card(child: Text("Event No:-1", style: TextStyle(fontSize: 30))),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[Text("Event time: 9 A.M to 12 A.M")],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text("Select Your one Color:-", style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 30),
          Row(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "red";
                });
              },
              child: Container(
                height: 100,
                width: 100,
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
                height: 100,
                width: 100,
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
                height: 100,
                width: 100,
                child: Card(
                  color: Colors.blue,
                ),
              ),
            )
          ]),
          SizedBox(height: 20),
          Row(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "green";
                });
              },
              child: Container(
                height: 100,
                width: 100,
                child: Card(
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "orange";
                });
              },
              child: Container(
                height: 100,
                width: 100,
                child: Card(
                  color: Colors.orange,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "black";
                });
              },
              child: Container(
                height: 100,
                width: 100,
                child: Card(
                  color: Colors.black,
                ),
              ),
            )
          ]),
          SizedBox(height: 30),
          Text(userid),
          RaisedButton(
            onPressed: () {
              storeuser();
            },
            child: Text("submmit"),
          ),
        ])),
      ),
    );
  }
}
