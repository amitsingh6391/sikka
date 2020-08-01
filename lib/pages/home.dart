

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event1.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/events/event3.dart';
import 'package:sikka/events/event4.dart';
import 'package:sikka/events/whennoevent.dart';
import 'package:sikka/pages/instruction.dart';
//import 'package:sikka/pages/home_page.dart';
import 'package:sikka/pages/payment2.dart';

import 'package:sikka/pages/profile.dart';
import "package:flutter/material.dart";
import "dart:async";
import 'package:sikka/pages/payment.dart';
import 'package:sikka/result/result.dart';
//import 'package:sikka/pages/home_page.dart';
import 'package:sikka/services/aunthication.dart';
import 'package:sikka/view/helper/authnicate.dart';
import 'package:sikka/view/viewservices/auth.dart';
import 'dart:io';

class Body extends StatefulWidget {
  Body({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  String userId;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int coin;
  String userid;

  @override
  void initState() {
    getCurrentUser();
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

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "",
        home: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/kxUyuPUh.png",
                ),
              ),
            ),
   

  
            
             

                

              
              child: Scaffold(
                floatingActionButton: FloatingActionButton(

                  onPressed:(){

                    exit(0);

                  },
                  child:Icon(Icons.cancel,color:Colors.red),
                  backgroundColor:Colors.black


                ),
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(160.0),
                  child: new AppBar(
                    actions: [
                      GestureDetector(
                        onTap: () {
                          AuthService().signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Authenticate()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            )),
                      ),
                    ],
                    flexibleSpace: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 110, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => instruction()));
                              },
                              child: Icon(
                                Icons.subtitles,
                                color: Colors.white,
                                size: 55,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(180, 110, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                              child: CircleAvatar(
                                backgroundImage: new AssetImage(
                                  'assets/profile.png',
                                ),
                                radius: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                body: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 400,
                        padding: EdgeInsets.fromLTRB(10, 100, 10, 30),
                        child: ListView(
                          scrollDirection: Axis.horizontal, // <-- Like so
                          children: <Widget>[
                            Container(
                              width: 210.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 25.0, // soften the shadow
                                    spreadRadius: 5.0, //extend the shadow
                                    offset: Offset(
                                      15.0, // Move to right 10  horizontally
                                      15.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Color(0xff7ccbea),
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                        
                                         DateTime now = DateTime.now();
    var ctime = DateFormat("kk:mm:ss").format(now);

    
    List l = ctime.split(":");
    print(l);
    var hour = int.parse(l[0]);
       if(hour>7 && hour<11){     
     Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1()));}
    else if(hour>11 && hour<15){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Event2()));
     }
     else if(hour>15 && hour<19){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Event3()));
     }
      else if(hour>19 && hour<22){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Event4()));
     }
     else{
              Navigator.push(context,MaterialPageRoute(builder: (context)=>NoEvent()));
     }

                                 
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
//                                            decoration: BoxDecoration(
//                                                i  image: DecorationImage(
//                                            mage: AssetImage("assets/Play Now.png"),
//                                                  fit: BoxFit.cover,
//                                              )
//                                            ),
                                              width: 160,
                                              height: 140,
                                              child: CircleAvatar(
                                                backgroundImage: new AssetImage(
                                                    "assets/Play Now.png"),
                                                radius: 80.0,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 20),
                                        child: Text(
                                          "LIVE EVENT",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 210.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 25.0, // soften the shadow
                                    spreadRadius: 5.0, //extend the shadow
                                    offset: Offset(
                                      15.0, // Move to right 10  horizontally
                                      15.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Color(0xff7ccbea),
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homes()));
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                          ),
                                          Container(
                                              width: 160,
                                              height: 150,
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/images (7).png"),
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 20),
                                        child: Text(
                                          "Payment Management",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 210.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 25.0, // soften the shadow
                                    spreadRadius: 5.0, //extend the shadow
                                    offset: Offset(
                                      15.0, // Move to right 10  horizontally
                                      15.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Color(0xff7ccbea),
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Results()));
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
//
                                              width: 160,
                                              height: 150,
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/results.png"),
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 20),
                                        child: Text(
                                          "Results",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )

                )

               )
    );
  }}


