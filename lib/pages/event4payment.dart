import 'package:admob_flutter/admob_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sikka/events/event1.dart';

import 'package:sikka/pages/home.dart';
import 'package:sikka/pages/payment.dart';
import 'package:sikka/services/admob_service.dart';

class Payment4 extends StatefulWidget {
  final String color;
  Payment4({Key key, @required this.color}) : super(key: key);
  @override
  _Payment4State createState() => _Payment4State();
}

class _Payment4State extends State<Payment4> {
  TextEditingController coinEditingController = new TextEditingController();
  String userid;
  Stream usercoinstream;
  int z;
  var s;

  int redfinal, bluefinal, yellowfinal;

  var redamount, blueamount, yellowamount;
  Stream bluestream;

  final ams = AdMobService();

  void initState() {

     Admob.initialize(ams.getAdMobAppId());

   
    super.initState();


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

  Uploadcoin3() async {
    //z=m+x;
    z = s - num.parse(coinEditingController.text);
    print("hiii");
    print(z);
    await Firestore.instance.collection("coin").document(userid).setData({
      //'coins' :z.toString(),
      "coins": z,
      "userid": userid
    }).then((result) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Event1(x:coinEditingController.text),
//           ));
      print("store");
    });

     usertrancition();
  }


  DateTime now = DateTime.now();
  
  usertrancition() async {
    var money = num.parse(coinEditingController.text);
    
    await Firestore.instance
        .collection(userid).add({
      

      "money":money,
      "color":widget.color,
      'time': DateTime.now().millisecondsSinceEpoch,
       "betttime": DateFormat("MM-dd - kk:mm").format(now),
    });
   
  }



//for red color.......

  redcoloramount() async {
    redfinal = redamount + num.parse(coinEditingController.text);
    print(redfinal);
    await Firestore.instance
        .collection("Event4")
        .document("redammount")
        .setData({
      

      "money": redfinal
    });
   
  }

  storevent4red() async {
    
    await Firestore.instance
        .collection("Event4")
        .document(widget.color)
        .collection("user")
        .document(userid)
        .setData({
      "color": widget.color,
      "userid": userid,
      "coin": coinEditingController.text,
      'time': DateTime.now(),
      //"documentID": documentID
    });
  }



//yellow color data  




yellowcoloramount() async { 
    yellowfinal = yellowamount + num.parse(coinEditingController.text);
    print(redfinal);
    await Firestore.instance
        .collection("Event4")
        .document("yellowammount")
        .setData({
      

      "money": yellowfinal
    });
   
  }

  storevent4yellow() async {
    
    await Firestore.instance
        .collection("Event4")
        .document(widget.color)
        .collection("user")
        .document(userid)
        .setData({
      "color": widget.color,
      "userid": userid,
      "coin": coinEditingController.text,
      'time': DateTime.now(),
      //"documentID": documentID
    });
  }

  //bluecolor data......



  bluecoloramount() async {
    bluefinal = blueamount + num.parse(coinEditingController.text);
    print(redfinal);
    await Firestore.instance
        .collection("Event4")
        .document("blueammount")
        .setData({
      

      "money": bluefinal
    });
   
  }

  storevent4blue() async {
    
    await Firestore.instance
        .collection("Event4")
        .document(widget.color)
        .collection("user")
        .document(userid)
        .setData({
      "color": widget.color,
      "userid": userid,
      "coin": coinEditingController.text,
      'time': DateTime.now(),
      //"documentID": documentID
    });
  }


  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("You have successfully placed your bet"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Body()));
              },
            ),
          ],
        );
      },
    );
  }

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
      backgroundColor: Colors.lightBlue,

        body: SingleChildScrollView(
                  child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue[200], Colors.white, Colors.blue[200]]),
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1), BlendMode.dstATop),
                      image: new AssetImage("assets/premium-roulette.gif"))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Column(
                      children: <Widget>[
                        StreamBuilder(
                            stream: Firestore.instance
                                .collection("Event4")
                                .document("redammount")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                print("loading");
                              }
                              var redtotal = snapshot.data;

                              redamount = redtotal["money"];
                              print(redamount);
                              return Container();
                            }),

                         StreamBuilder(

                            stream:Firestore.instance.collection("Event4").document("blueammount").snapshots(),
                            builder:(context,snapshot){
                              if(!snapshot.hasData){
                                print("loading");
                              }
                              var bluetotal = snapshot.data;
                              blueamount = bluetotal["money"];
                              print(blueamount);
                              return Container();
                            }

                          ),

                          StreamBuilder(

                            stream:Firestore.instance.collection("Event4").document("yellowammount").snapshots(),
                            builder:(context,snapshot){
                              if(!snapshot.hasData){
                                print("loading");
                              }
                              var yellowtotal = snapshot.data;
                              yellowamount = yellowtotal["money"];
                              print(yellowamount);
                              return Container();
                            }

                          ),
                        Container(
                            child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.keyboard_backspace,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            )),
//                      ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(45, 15, 0, 0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 45,
                                        child: Image(
                                          image: AssetImage("assets/icon.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ColorizeAnimatedTextKit(
                                    onTap: () {
                                      print("Tap Event");
                                    },
                                    text: ["SIKKA"],
                                    textStyle: GoogleFonts.lora(
                                      fontSize: 30.0,
                                    ),
                                    colors: [
                                      Color(0xff00759c),
                                      Colors.yellow,
                                      Colors.orange,
                                      Colors.red,
                                      Colors.blue[600]
                                    ],
                                    repeatForever: true,
                                    totalRepeatCount: 300,
                                    textAlign: TextAlign.center,
                                    alignment: AlignmentDirectional
                                        .bottomEnd // or Alignment.topLeft
                                    ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 40),
                              child: Row(
                                children: <Widget>[
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
                                              "Your Coins💰:",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              s.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: coinEditingController,
                              decoration: InputDecoration(
                                hintText: " Enter amount to bet",
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 50),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            RaisedButton(
                              color: Color(0xff00759c),
                              child: Text(
                                "Pay Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (int.parse(coinEditingController.text) < s) {
                                  Uploadcoin3();
                                  // storeuser();

                                  if (widget.color == "red") {
                                    storevent4red();
                                    redcoloramount();
                                  }
                                  if (widget.color == "blue") {

                                    storevent4blue();
                                    bluecoloramount();

                                  }
                                  if (widget.color == "yellow") {

                                    storevent4yellow();
                                    yellowcoloramount();

                                  }

                                  _showDialog();
                                } else {
                                  _showDialog2();
                                }

                                // setState(() {
                                //   m=m+int.parse(coinEditingController.text);
                                // });
                              },
                            ),

                          ],
                        )),
                      ],
                    ),
                  ),

            AdmobBanner(
            adUnitId:"ca-app-pub-5023637575934146/5580321160",
             adSize: AdmobBannerSize.MEDIUM_RECTANGLE
             ),
                ],
              )
              ),
        ));
  }
}
