import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sikka/events/event1.dart';
import 'package:sikka/events/event2.dart';
import 'package:sikka/events/event3.dart';
import 'package:sikka/events/event4.dart';
import 'package:sikka/events/whennoevent.dart';
import 'package:sikka/result/event1result.dart';
import 'package:sikka/services/aunthication.dart';
import 'package:intl/intl.dart';
import 'package:sikka/view/helper/authnicate.dart';
import 'package:sikka/view/viewservices/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  String _timeString;
  String ctime;
  
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  event (){
       DateTime now = DateTime.now();
    ctime = DateFormat("kk:mm:ss").format(now);

    
    List l = ctime.split(":");
    print(l);
    var hour = int.parse(l[0]);

    if (hour > 6 && hour < 12) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Event1()));
    }
    if (hour > 11 && hour < 15) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Event2()));
    }

    if (hour > 14 && hour < 18) {
      print("event 3");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Event3()));
    }
    if (hour > 17 && hour < 21) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Event4()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NoEvent()));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('sika'),
          actions: [
      GestureDetector(
        onTap: () {
          AuthService().signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Authenticate()));
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.exit_to_app,color: Colors.brown,)),
      ),
    ],
        ),
        body: Container(
          color:Colors.white,
          child: FlatButton(onPressed: (){
            DateTime now = DateTime.now();
    ctime = DateFormat("kk:mm:ss").format(now);

    
    List l = ctime.split(":");
    print(l);
    var hour = int.parse(l[0]);
       if(hour>9 && hour<12){     
     Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1()));}
    else if(hour>11 && hour<14){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Event2()));
     }
     else if(hour>13 && hour<17){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Event3()));
     }
      else if(hour>17 && hour<21){
       Navigator.push(context,MaterialPageRoute(builder: (context)=>Event4()));
     }
     else{
              Navigator.push(context,MaterialPageRoute(builder: (context)=>NoEvent()));
     }
   // event();

    
          }
          , child: Center(child: Text("live event"))
          
          ),
        ));
  }
}
