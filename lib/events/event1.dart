//neeraj code

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:sikka/events/event2.dart';
// import 'package:sikka/pages/payment.dart';
// import 'package:sikka/pages/payment2.dart';

// import 'package:sikka/services/aunthication.dart';
// import 'package:random_string/random_string.dart';

// class Event1 extends StatefulWidget {
// //  final String x;
// //  Event1({Key key, @required this.x}) : super(key: key);

//   @override
//   _Event1State createState() => _Event1State();
// }

// class _Event1State extends State<Event1> {
//   String userid;
//   var moneyadds;
//   var s;
//   bool ans = false;
//   @override
//   void initState() {
//     getCurrentUser();
//     super.initState();
//   }

//   getCurrentUser() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final FirebaseUser user = await _auth.currentUser();
//     final uid = user.uid;
//     print(uid);
//     setState(() {
//       userid = uid.toString();
//     });

    
//   }

  

//   storeuser() async {
//     var rng = new Random();
//     var coin;
//     String documentID = rng.nextInt(1000000).toString();

//     await Firestore.instance.collection("event1").document(userid).setData({
//       "color": x,
//       "userid": userid,
//       "coin": 0,
//       'time': DateTime.now(),
//       //"documentID": documentID
//     });
//   }

//   String x = "none";
//   Color red = Colors.red;
//   Color yellow = Colors.yellow;
//   Color blue = Colors.blue;
//   Color pink = Colors.pink;
//   Color green = Colors.green;
//   Color black =Colors.black;
//   Color purple = Colors.purple;
//   Color brown =Colors.brown;
//   Color orange = Colors.orange;
//   Color black12 = Colors.black12;

//   void _showDialog2() {
//     // flutter defined function
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: new Text("Success"),
//           content:
//               new Text("You have not Suffcient coin to  participant in bet"),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
//             new FlatButton(
//               child: new Text("add"),
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Homes()));
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//             child: Column(children: [
//           SizedBox(
//             height: 60,
//           ),
//           Row(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 ),
//               ),
//               Text("     Event No:-1",
//                   style:
//                       GoogleFonts.almendra(color: Colors.white, fontSize: 50)),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: <Widget>[
//               Text(
//                 "Select your Color:-",
//                 style:
//                     GoogleFonts.averiaLibre(color: Colors.white, fontSize: 30),
//               ),
//             ],
//           ),
//           Container(
//             child: StreamBuilder(
//               stream: Firestore.instance
//                   .collection("coin")
//                   .document(userid)
//                   .snapshots(), //
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   print("loading");
//                 }
//                 var coindata = snapshot.data;
//                 s = coindata["coins"];
//                 print(s);

//                 return Row(
//                   children: <Widget>[
//                     Text(
//                       "Your account balance:  ",
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                     Text(
//                       s.toString(),
//                       style: TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 60),
//           Row(children: [
//             Text("        "),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "red";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "yellow";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.yellow,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "blue";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//              GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "pink";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.pink,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),

//              GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "green";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.green,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),



//             Row(children: [
//             Text("        "),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x ="brown";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.brown,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "black";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "purple";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.purple,
//                 ),
//               ),
//             ),
//              GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "orange";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.orange,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),

//              GestureDetector(
//               onTap: () {
//                 setState(() {
//                   x = "black12";
//                 });
//               },
//               child: Container(
//                 height: 80,
//                 width: 50,
//                 child: Card(
//                   color: Colors.black12,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),



//           ]),
//           SizedBox(height: 80),
//           RaisedButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => payment(color: x),
//                   ));
//               if (s > 0) {
//                 storeuser();
//               } else {
//                 _showDialog2();
//               }
//             },
//             child: Text("submmit"),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Row(
//             children: <Widget>[
//               Text(
//                 "Event time: 8 A.M to 11 A.M",
//                 style: GoogleFonts.averiaLibre(color: Colors.white),
//               )
//             ],
//           ),
//         ]
//         )
//             ]))
//     ));
//   }
// }


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/pages/payment.dart';
import 'package:sikka/pages/payment2.dart';

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
  var s;
  bool ans = false;
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
    var coin;
    String documentID = rng.nextInt(1000000).toString();

    await Firestore.instance.collection("Event1").document(userid).setData({
      "color": x,
      "userid": userid,
      "coin": 0,
      'time': DateTime.now(),
      //"documentID": documentID
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
              Text("     Event No:-1",
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
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "pink";
                });
              },
              child: Container(
                height: 80,
                width: 50,
                child: Card(
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  x = "green";
                });
              },
              child: Container(
                height: 80,
                width: 50,
                child: Card(
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(width: 30),
          ]),
          SizedBox(height: 20, width: 20),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    x = "brown";
                  });
                },
                child: Container(
                  height: 80,
                  width: 50,
                  child: Card(
                    color: Colors.brown,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    x = "orange";
                  });
                },
                child: Container(
                  height: 80,
                  width: 50,
                  child: Card(
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    x = "purple";
                  });
                },
                child: Container(
                  height: 80,
                  width: 50,
                  child: Card(
                    color: Colors.purple,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    x = "blueAccent";
                  });
                },
                child: Container(
                  height: 80,
                  width: 50,
                  child: Card(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    x = "deepOrange";
                  });
                },
                child: Container(
                  height: 80,
                  width: 50,
                  child: Card(color: Colors.deepOrange),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => payment(color: x),
                  ));
              if (s > 0) {
                storeuser();
              } else {
                _showDialog2();
              }
            },
            child: Text("submmit"),
          ),
          SizedBox(
            height: 40,
          ),
          Row(children: <Widget>[
            Text(
              "Event time: 8 A.M to 11 P.M",
              style: GoogleFonts.averiaLibre(color: Colors.white),
            )
          ]),
        ]),
      )),
    );
  }
}
