import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:sikka/result/event1result.dart';
import 'package:sikka/result/event2result.dart';
import 'package:sikka/result/event3result.dart';
import 'package:sikka/result/event4result.dart';
import 'package:sikka/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import "dart:math";
import "dart:async";

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var redamount, blueamount, yellowamount, wincoloramount, wincolor;

  var redamount2, blueamount2, yellowamount2, wincoloramount2, wincolor2;
  var redamount3, blueamount3, yellowamount3, wincoloramount3, wincolor3;
  var redamount4, blueamount4, yellowamount4, wincoloramount4, wincolor4;



  @override
  void initState() {
    super.initState();
    //  getwinnercolor();
  }

  getwinnercolor() {
    List l = [redamount, blueamount, yellowamount];

    l.sort();

    var x = l[0];

    wincoloramount = x;

    print(wincoloramount);

    if (redamount == l[0]) {
      setState(() {
        wincolor = "red";
      });
    }
    if (blueamount == l[0]) {
      // wincolor = "blue";
      setState(() {
        wincolor = "blue";
      });
    }
    if (yellowamount == l[0]) {
      //wincolor = "yellow";
      setState(() {
        wincolor = "yellow";
      });
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Event1result(winnercolor: wincolor)));
  }


   getwinnercolor2() {
    List l = [redamount2, blueamount2, yellowamount2];

    l.sort();

    var x = l[0];

    wincoloramount2 = x;

    print(wincoloramount2);

    if (redamount2 == l[0]) {
      setState(() {
        wincolor2 = "red";
      });
    }
    if (blueamount2 == l[0]) {
      // wincolor = "blue";
      setState(() {
        wincolor2 = "blue";
      });
    }
    if (yellowamount2 == l[0]) {
      //wincolor = "yellow";
      setState(() {
        wincolor2 = "yellow";
      });
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Event2result(winnercolor2: wincolor2)));
  }


  //evnt3color..


   getwinnercolor3() {
    List l = [redamount3, blueamount3, yellowamount3];

    l.sort();

    var x = l[0];

    wincoloramount3 = x;

    print(wincoloramount);

    if (redamount3 == l[0]) {
      setState(() {
        wincolor3 = "red";
      });
    }
    if (blueamount3 == l[0]) {
      // wincolor = "blue";
      setState(() {
        wincolor3 = "blue";
      });
    }
    if (yellowamount3 == l[0]) {
      //wincolor = "yellow";
      setState(() {
        wincolor3 = "yellow";
      });
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Event3result(winnercolor3: wincolor3)));
  }

  //eventcolor4..


   getwinnercolor4() {

    List l = [redamount4, blueamount4, yellowamount4];

    l.sort();

    var x = l[0];

    wincoloramount4 = x;

    print(wincoloramount4);

    if (redamount4 == l[0]) {
      setState(() {
        wincolor4 = "red";
      });
    }
    if (blueamount4 == l[0]) {
      // wincolor = "blue";
      setState(() {
        wincolor4 = "blue";
      });
    }
    if (yellowamount4 == l[0]) {
      //wincolor = "yellow";
      setState(() {
        wincolor4 = "yellow";
      });
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Event4result(winnercolor4: wincolor4)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            child: Card(child: Image(image: AssetImage("assets/results.png"))),
          ),
          Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event1")
                      .document("redammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var reddetail = snapshot.data;
                    redamount = reddetail["money"];
                    print(redamount);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),
          Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event1")
                      .document("blueammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var bluedetail = snapshot.data;
                    blueamount = bluedetail["money"];
                    print(blueamount);
                    return Container(
                        // child: Text(blueamount.toString())
                        );
                  })),
          Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event1")
                      .document("yellowammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var yellowdetail = snapshot.data;

                    yellowamount = yellowdetail["money"];
                    print(yellowamount);

                    return Container(
                        // child: Text(yellowamount.toString())
                        );
                  })),




          //for event 2..

          Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event2")
                      .document("redammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var reddetail = snapshot.data;
                    redamount2 = reddetail["money"];
                    print(redamount2);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),

                  Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event2")
                      .document("blueammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var bluedetail = snapshot.data;
                    blueamount2 = bluedetail["money"];
                    print(blueamount2);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),

                   Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event2")
                      .document("yellowammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var yellowdetail = snapshot.data;

                    yellowamount2 = yellowdetail["money"];
                    print(yellowamount2);

                    return Container(
                        // child: Text(yellowamount.toString())
                        );
                  })),


                  //for event 3.....

                   Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event3")
                      .document("yellowammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var yellowdetail = snapshot.data;

                    yellowamount3 = yellowdetail["money"];
                    print(yellowamount3);

                    return Container(
                        // child: Text(yellowamount.toString())
                        );
                  })),

                  

                    Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event3")
                      .document("blueammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var bluedetail = snapshot.data;
                    blueamount3 = bluedetail["money"];
                    print(blueamount3);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),


                  Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event3")
                      .document("redammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var reddetail = snapshot.data;
                    redamount3 = reddetail["money"];
                    print(redamount3);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),




//for event 4.....


Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event4")
                      .document("redammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var reddetail = snapshot.data;
                    redamount4 = reddetail["money"];
                    print(redamount4);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),


                  Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event4")
                      .document("blueammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var bluedetail = snapshot.data;
                    blueamount4 = bluedetail["money"];
                    print(blueamount4);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),

Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Event4")
                      .document("yellowammount")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var yellowdetail = snapshot.data;
                    yellowamount4 = yellowdetail["money"];
                    print(yellowamount4);
                    return Container(
                        //child: Text(redamount.toString())
                        );
                  })),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                DateTime now = DateTime.now();
                var ctime = DateFormat("kk:mm:ss").format(now);

                List l = ctime.split(":");
                print(l);
                var hour = int.parse(l[0]);
                var minute = int.parse(l[1]);

                if (minute >16 && minute <46) {

                  getwinnercolor();
                }else
                {
                  print("event is ongoing");
                }
              },
              child: Card(
                elevation: 10,
                child: Container(
                    color: Colors.amber,
                    height: 50,
                    child: Text(
                      "Event 1 Result",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {

                DateTime now = DateTime.now();
                var ctime = DateFormat("kk:mm:ss").format(now);

                List l = ctime.split(":");
                print(l);
                var hour = int.parse(l[0]);
                var minute = int.parse(l[1]);

                if (minute >31 && minute <60) {

                  getwinnercolor2();
                }else
                {
                  print("event is ongoing");
                }
                
              },
              child: Card(
                elevation: 10,
                child: Container(
                    color: Colors.amber,
                    height: 50,
                    child: Text(
                      "Event 2 Result",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
              DateTime now = DateTime.now();
                var ctime = DateFormat("kk:mm:ss").format(now);

                List l = ctime.split(":");
                print(l);
                var hour = int.parse(l[0]);
                var minute = int.parse(l[1]);

                if ((minute >45 && minute <60) || (minute >0 && minute<16)) {

                  getwinnercolor3();
                }else
                {
                  print("event is ongoing");
                }
              },
              child: Card(
                elevation: 10,
                child: Container(
                    color: Colors.amber,
                    height: 50,
                    child: Text(
                      "Event 3 Result",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
              DateTime now = DateTime.now();
                var ctime = DateFormat("kk:mm:ss").format(now);

                List l = ctime.split(":");
                print(l);
                var hour = int.parse(l[0]);
                var minute = int.parse(l[1]);

                if (minute >0 && minute <31) {

                  getwinnercolor4();
                }else
                {
                  print("event is ongoing");
                }
              },
              child: Card(
                elevation: 10,
                child: Container(
                    color: Colors.amber,
                    height: 50,
                    child: Text(
                      "Event 4 Result",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ),
            ),
          ),
        ]))));
  }
}
