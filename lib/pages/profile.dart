import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sikka/events/event1.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sikka/view/helper/theme.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userid;
  @override
  void initState() {
    // TODO: implement initState

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: Firestore.instance
                    .collection("coin")
                    .document(userid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print("loading");
                  }

                  var coindata = snapshot.data;
                  print(coindata["coins"]);
                  return Container(
                      child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      CircleAvatar(
                          radius: 50,
                          child: Image(
                            image: AssetImage("assets/profile.png"),
                          )),
                      SizedBox(height: 20),
                      Row(children: [
                        Text("your account balance:",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                         Text(coindata["coins"].toString(),style: TextStyle(fontSize:20,))
                      ])
                    ],
                  ));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("userinformation")
                      .document(userid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("loading");
                    }
                    var userdata = snapshot.data;

                    print(userdata["username"]);
                    return Container(
                        child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Your name: ",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            Icon(Icons.person),
                            Text(userdata["username"],
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text("Your Email: ",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            Icon(Icons.mail),
                            Text(userdata["useremail"],
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text("Your Phone number: ",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            Icon(Icons.phone),
                            Text(userdata["userphone"],
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          ],
                        )
                      ],
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
