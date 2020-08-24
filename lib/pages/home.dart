import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event1.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/events/event3.dart';
import 'package:sikka/events/event4.dart';
import 'package:sikka/events/whennoevent.dart';
import 'package:sikka/pages/about.dart';
import 'package:sikka/pages/instruction.dart';
//import 'package:sikka/pages/home_page.dart';
import 'package:sikka/pages/payment2.dart';

import 'package:sikka/pages/profile.dart';
import "package:flutter/material.dart";
import "dart:async";
import 'package:sikka/pages/payment.dart';
import 'package:sikka/pages/transcition.dart';
import 'package:sikka/result/event1result.dart';
import 'package:sikka/result/result.dart';
import 'package:sikka/services/admob_service.dart';
//import 'package:sikka/pages/home_page.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'package:sikka/services/aunthication.dart';
import 'package:sikka/view/helper/authnicate.dart';
import 'package:sikka/view/viewservices/auth.dart';
import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

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

  final ams = AdMobService();

  @override
  void initState() {
    Admob.initialize(ams.getAdMobAppId());
    getCurrentUser();
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'SIKKA',
        text: 'Share SIKKA',
        linkUrl:
            'https://play.google.com/store/apps/details?id=com.sikka.amitapps',
        chooserTitle: 'SHARE SIKKA');
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

  showAlertDialog(BuildContext context) {
    // set up the button

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Contact us at:",
      ),
      content: Text(
        "Email: 'sikkaapp88@gmail.com'",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    InterstitialAd newTripAd =
        ams.getnewTripInterstitial(); //first save in the variablesto use adds

    newTripAd.load();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "",
        home: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blue[900], Colors.blue, Colors.blue[900]]),
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    image: new AssetImage("assets/unnamed.jpg"))),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: new AppBar(
                    actions: [
                      GestureDetector(
                        onTap: () {
                          exit(0);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                                Text(
                                  "EXIT",
                                  style: TextStyle(color: Colors.yellow),
                                )
                              ],
                            )),
//                      ),
                      ),
//                      GestureDetector(
//                        onTap: () {
//                          AuthService().signOut();
//                          Navigator.pushReplacement(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => Authenticate()));
//                        },
//
                    ],
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 4, color: Colors.yellow[500])),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.blue[900], Colors.blue[200]]),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 50.0,
                            color: Colors.brown.withOpacity(1),
                            offset: Offset(6.0, 7.0),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
//                       SizedBox(
//                       width: 150.0,
//                       child: TextLiquidFill(
//                         text: 'SIKKA',
//                         waveColor: Colors.blueAccent,
//                         boxBackgroundColor: Colors.redAccent,
//                         textStyle: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         boxHeight: 80.0,
//                       ),

                          RotateAnimatedTextKit(
                            onTap: () {
                              print("Tap Event");
                            },
                            repeatForever: true,
                            text: ["SIKKA", "SIKKA", "SIKKA"],
                            textStyle: GoogleFonts.fredokaOne(
                                fontSize: 27.0, color: Colors.white),
//                        textAlign: TextAlign.center,
//                        alignment: AlignmentDirectional.center // or Alignment.topLeft
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            newTripAd.show(
                              //show the full screen adds when second year pressed
                              anchorType: AnchorType.bottom,
                              anchorOffset: 0.0,
                              horizontalCenterOffset: 0.0,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => instruction()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              border:
                                  Border.all(width: 1, color: Colors.red[600]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                border: Border.all(
                                    width: 3, color: Colors.yellow[400]),
//                                        color: Color(0xff3a556f),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff012293),
                                      Colors.blue[200]
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.0,
                                    color: Colors.yellow[900].withOpacity(1),
                                    offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 45,
                                width: 45,
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.subtitles,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      "Rules",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            border:
                                Border.all(width: 1, color: Colors.red[600]),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              border: Border.all(
                                  width: 3, color: Colors.yellow[400]),
//                                  color: Color(0xff3a556f),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff012293),
                                    Colors.blue[200]
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 30.0,
                                  color: Colors.yellow[900].withOpacity(1),
                                  offset: Offset(6.0, 7.0),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                newTripAd.show(
                                  //show the full screen adds when second year pressed
                                  anchorType: AnchorType.bottom,
                                  anchorOffset: 0.0,
                                  horizontalCenterOffset: 0.0,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                              child: Container(
                                height: 44,
                                width: 44,
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: new AssetImage(
                                        'assets/profile.png',
                                      ),
                                      radius: 14.0,
                                    ),
                                    Text(
                                      "Profile",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(130, 10, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            AuthService().signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Authenticate()));
                          },
                          child: Container(
                            child: Column(children: <Widget>[
                              Container(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.red[400],
                                  size: 30,
                                ),
                              ),
                              Text(
                                "LOGOUT",
                                style: TextStyle(
                                    color: Colors.yellow[600], fontSize: 15),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],

//                    ),
//                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
                    Container(
                      width: 250.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.brown[400],
                            blurRadius:
                                40.0, // soften the shadow//extend the shadow
                            offset: Offset(
                              15.0, // Move to right 10  horizontally
                              10.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.yellow[500],
                        border: Border.all(color: Colors.brown, width: 1),
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1()));
                          // },
                          DateTime now = DateTime.now();
                          var ctime = DateFormat("kk:mm:ss").format(now);

                          List l = ctime.split(":");
                          print(l);
                          var hour = int.parse(l[0]);
                          var minute = int.parse(l[1]);
                          if (hour > 5 &&
                              hour < 23 &&
                              minute > 0 &&
                              minute < 16) {
                            Firestore.instance
                                .collection("Event2")
                                .document("blue")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk blue");
                            });

                            Firestore.instance
                                .collection("Event2")
                                .document("red")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("ok red");
                            });

                            Firestore.instance
                                .collection("Event2")
                                .document("yellow")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk yellow");
                            });

                            Firestore.instance
                                .collection("Event2")
                                .document("redammount")
                                .setData({"money": 0});
                            Firestore.instance
                                .collection("Event2")
                                .document("blueammount")
                                .setData({"money": 0});
                            Firestore.instance
                                .collection("Event2")
                                .document("yellowammount")
                                .setData({"money": 0});

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event1()));
                          } else if (hour > 5 &&
                              hour < 23 &&
                              minute > 15 &&
                              minute < 31) {
                            Firestore.instance
                                .collection("Event3")
                                .document("blue")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk blue");
                            });

                            Firestore.instance
                                .collection("Event3")
                                .document("red")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("ok red");
                            });

                            Firestore.instance
                                .collection("Event3")
                                .document("yellow")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk yellow");
                            });

                            //  Firestore.instance.collection("Event3").getDocuments().then((snapshot){
                            //   for(DocumentSnapshot ds in snapshot.documents){
                            //     ds.reference.delete();
                            //   }
                            //   print("okk ammount");
                            // }
                            // );

                            Firestore.instance
                                .collection("Event3")
                                .document("redammount")
                                .setData({"money": 0});

                            Firestore.instance
                                .collection("Event3")
                                .document("redammount")
                                .setData({"money": 0});

                            Firestore.instance
                                .collection("Event3")
                                .document("redammount")
                                .setData({"money": 0});

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event2()));
                          } else if (hour > 5 &&
                              hour < 23 &&
                              minute > 30 &&
                              minute < 46) {
                            Firestore.instance
                                .collection("Event4")
                                .document("blue")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk blue");
                            });

                            Firestore.instance
                                .collection("Event4")
                                .document("red")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("ok red");
                            });

                            Firestore.instance
                                .collection("Event4")
                                .document("yellow")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk yellow");
                            });

                            Firestore.instance
                                .collection("Event4")
                                .document("redammount")
                                .setData({"money": 0});

                            Firestore.instance
                                .collection("Event4")
                                .document("redammount")
                                .setData({"money": 0});

                            Firestore.instance
                                .collection("Event4")
                                .document("redammount")
                                .setData({"money": 0});

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event3()));
                          } else if (hour > 5 &&
                              hour < 23 &&
                              minute > 46 &&
                              minute < 60) {
                            Firestore.instance
                                .collection("Event1")
                                .document("blue")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk blue");
                            });

                            Firestore.instance
                                .collection("Event1")
                                .document("red")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("ok red");
                            });

                            Firestore.instance
                                .collection("Event1")
                                .document("yellow")
                                .collection("user")
                                .getDocuments()
                                .then((snapshot) {
                              for (DocumentSnapshot ds in snapshot.documents) {
                                ds.reference.delete();
                              }
                              print("okk yellow");
                            });

                            //  Firestore.instance.collection("Event1").getDocuments().then((snapshot){
                            //   for(DocumentSnapshot ds in snapshot.documents){
                            //     ds.reference.delete();
                            //   }
                            //   print("okk ammount");
                            // }
                            // );
                            Firestore.instance
                                .collection("Event1")
                                .document("redammount")
                                .setData({"money": 0});
                            Firestore.instance
                                .collection("Event1")
                                .document("blueammount")
                                .setData({"money": 0});
                            Firestore.instance
                                .collection("Event1")
                                .document("yellowammount")
                                .setData({"money": 0});

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event4()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Result()));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(3, 2, 2, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 80,
                                      width: 241,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff012293),
                                              Colors.blue[200]
                                            ]),
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 250,
                                        height: 100,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/playsikka.png"),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: BorderedText(
                                    strokeWidth: 4.0,
                                    child: Text(
                                      "LIVE EVENT",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.kalam(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        decorationColor: Colors.black,
                                        fontSize: 19,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
                    Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.brown[400],
                            blurRadius:
                                40.0, // soften the shadow//extend the shadow
                            offset: Offset(
                              15.0, // Move to right 10  horizontally
                              10.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.yellow[500],
                        border: Border.all(color: Colors.brown, width: 1),
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Homes()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(3, 2, 2, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 50,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff012293),
                                              Colors.blue[200]
                                            ]),
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images(7).png"),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                                child: BorderedText(
                                    strokeWidth: 4.0,
                                    child: Text(
                                      "Payment Management",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.kalam(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        decorationColor: Colors.black,
                                        fontSize: 19,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.brown[400],
                            blurRadius:
                                40.0, // soften the shadow//extend the shadow
                            offset: Offset(
                              15.0, // Move to right 10  horizontally
                              10.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.yellow[500],
                        border: Border.all(color: Colors.brown, width: 1),
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Result()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(3, 2, 2, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 80,
                                      width: 93,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff012293),
                                              Colors.blue[200]
                                            ]),
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: Image(
                                          image:
                                              AssetImage("assets/results.png"),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                                child: BorderedText(
                                    strokeWidth: 4.0,
                                    child: Text(
                                      "Results",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.kalam(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        decorationColor: Colors.black,
                                        fontSize: 19,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            //            newTripAd.show(
                            // //show the full screen adds when second year pressed
                            // anchorType: AnchorType.bottom,
                            // anchorOffset: 0.0,
                            // horizontalCenterOffset: 0.0,
                            // );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => about()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              border:
                                  Border.all(width: 1, color: Colors.red[600]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                border: Border.all(
                                    width: 4, color: Colors.yellow[400]),
//                                        color: Color(0xff3a556f),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff012293),
                                      Colors.blue[200]
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.0,
                                    color: Colors.yellow[900].withOpacity(1),
                                    offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.info,
                                  color: Colors.yellow[600],
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            newTripAd.show(
                              //show the full screen adds when second year pressed
                              anchorType: AnchorType.bottom,
                              anchorOffset: 0.0,
                              horizontalCenterOffset: 0.0,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transc()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              border:
                                  Border.all(width: 1, color: Colors.red[600]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                border: Border.all(
                                    width: 4, color: Colors.yellow[400]),
//                                        color: Color(0xff3a556f),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff012293),
                                      Colors.blue[200]
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.0,
                                    color: Colors.yellow[900].withOpacity(1),
                                    offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.history,
                                  color: Colors.yellow[600],
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: GestureDetector(
                          onTap: share,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              border:
                                  Border.all(width: 1, color: Colors.red[600]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                border: Border.all(
                                    width: 4, color: Colors.yellow[400]),
//                                        color: Color(0xff3a556f),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff012293),
                                      Colors.blue[200]
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.0,
                                    color: Colors.yellow[900].withOpacity(1),
                                    offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.share,
                                  color: Colors.yellow[600],
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              border:
                                  Border.all(width: 1, color: Colors.red[600]),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                border: Border.all(
                                    width: 4, color: Colors.yellow[400]),
//                                        color: Color(0xff3a556f),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff012293),
                                      Colors.blue[200]
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.0,
                                    color: Colors.yellow[900].withOpacity(1),
                                    offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.phone_iphone,
                                  color: Colors.yellow[600],
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                                   AdmobBanner(
                  adUnitId:"ca-app-pub-5023637575934146/1902938212",
                   adSize: AdmobBannerSize.LEADERBOARD
                   ),
                ]))));
  }
}
