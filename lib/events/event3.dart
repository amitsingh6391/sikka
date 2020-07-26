import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Event3 extends StatefulWidget {
  @override
  _Event3State createState() => _Event3State();
}

class _Event3State extends State<Event3> {

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
      backgroundColor: Colors.white,

      body:SafeArea(child: 
      Container(
            child: Column(children: [
          Card(child: Text("Event No:-3", style: TextStyle(fontSize: 30))),
           Row(
            children: <Widget>[
              Text("Event time: 3 P.M to 6 P.M")
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text("Select Your one Color:-", style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(children: [
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.red,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.yellow,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.blue,
              ),
            )
          ]),
          SizedBox(height: 20),
          Row(children: [
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.green,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.orange,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.black,
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
          )
        ])),)
      
    );
  }
}