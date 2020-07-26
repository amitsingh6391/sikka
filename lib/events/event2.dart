import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sikka/result/event1result.dart';

class Event2 extends StatefulWidget {
  @override
  _Event2State createState() => _Event2State();
}

class _Event2State extends State<Event2> {

  String userid;
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
String x;
  storeuser() async {
    var rng = new Random();
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("event2").document(documentID).setData({
      "color": x,
      "userid": userid,
      'time': DateTime.now().millisecondsSinceEpoch,
      "documentID": documentID
    }).then((result) {
     
      // print("store");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // floatingActionButton: FloatingActionButton(onPressed: (){

  //    Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1result()));
          
         
  // }),
      body:SafeArea(
        child:Container(
            child: Column(children: [
          Card(child: Text("Event No:-2", style: TextStyle(fontSize: 30))),
           Row(
            children: <Widget>[
              Text("Event time: 1 P.M to 3 P.M")
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text("Select Your one Color:-", style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  x="red";
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
               onTap: (){
                setState(() {
                  x="yellow";
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
               onTap: (){
                setState(() {
                  x="blue";
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
               onTap: (){
                setState(() {
                  x="green";
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
              onTap: (){
                setState(() {
                  x="orange";
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
              onTap: (){
                setState(() {
                  x="black";
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
          Row(
            children: <Widget>[
              Card(
                elevation: 10,
                shadowColor: Colors.black12,
                child: Column(
                  children: <Widget>[
                    Text("Time remaining in live event:",
                        style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 10,
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
           Text(userid),
          RaisedButton(
            onPressed: () {
              storeuser();
            },
            child: Text("submmit"),
          ),

          

        ]))
      )
      
    );
  }
}