import "package:flutter/material.dart";
import 'package:sikka/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  DatabaseMethods databaseMethods = DatabaseMethods();

  Stream event1;

  @override
  void initState() {
    // TODO: implement initState

    databaseMethods.getEvent1result().then((result) {
      setState(() {
        event1 = result;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: (){

            Navigator.pop(context);

        },
        child:Icon(Icons.arrow_back),
        backgroundColor: Colors.black,),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            Container(
              child:
                  Card(child: Image(image: AssetImage("assets/results.png"))),
            ),

            Container(
                child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "Event 1 Winners",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.people)
                  ],
                ),
                StreamBuilder(
                    stream: Firestore.instance
                        .collection("event1result")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("loading");
                      }
                      var userdata = snapshot.data;

                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Event1tile(
                              winner:
                                  snapshot.data.documents[index].data["winner"],

                                   email:
                                  snapshot.data.documents[index].data["email"],
                            );
                          });
                    }),
              ],
            )),

            //event2 result..

            Container(
                child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "Event 2 Winners",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.people)
                  ],
                ),
                StreamBuilder(
                    stream: Firestore.instance
                        .collection("event2result")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("loading");
                      }
                      var userdata = snapshot.data;

                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Event2tile(
                              winner:
                                  snapshot.data.documents[index].data["winner"],

                                   email:
                                  snapshot.data.documents[index].data["email"],
                            );

                          });
                    }),
              ],
            )),

            Container(
                child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "Event 3 Winners",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.people)
                  ],
                ),
                StreamBuilder(
                    stream: Firestore.instance
                        .collection("event3result")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("loading");
                      }
                      var userdata = snapshot.data;

                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Event3tile(
                              winner:
                                  snapshot.data.documents[index].data["winner"],
                                   email:
                                  snapshot.data.documents[index].data["email"],
                            );
                          });
                    }),
              ],
            )),
            Container(
                child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "Event 4 Winners",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.people)
                  ],
                ),
                StreamBuilder(
                    stream: Firestore.instance
                        .collection("event4result")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("loading");
                      }
                      var userdata = snapshot.data;

                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Event4tile(
                              winner:
                                  snapshot.data.documents[index].data["winner"],
                                   email:
                                  snapshot.data.documents[index].data["email"],
                            );
                          });
                    }),
              ],
            ))
          ],
        ))));
  }
}

//event1 tile..

class Event1tile extends StatefulWidget {
  String winner,email;
  Event1tile({@required this.winner,@required this.email});

  @override
  _Event1tileState createState() => _Event1tileState();
}

class _Event1tileState extends State<Event1tile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(widget.winner,
                  style: TextStyle(fontSize: 40, color: Colors.red)),
                  Text(widget.email),
            ],
          ),
              
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class Event2tile extends StatefulWidget {
  String winner,email;
  Event2tile({@required this.winner,@required this.email});

  @override
  _Event2tileState createState() => _Event2tileState();
}

class _Event2tileState extends State<Event2tile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Row(
        children: <Widget>[
          Text(widget.winner,
              style: TextStyle(fontSize: 30, color: Colors.red)),
              Text(widget.email),
        ],
      ),
              
      SizedBox(
        height: 30,
      )
    ]));
  }
}

class Event3tile extends StatefulWidget {
  String winner,email;
  Event3tile({@required this.winner,@required this.email});

  @override
  _Event3tileState createState() => _Event3tileState();
}

class _Event3tileState extends State<Event3tile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Column(
        children:[ 
          Row(
            children: <Widget>[
              Text(
                widget.winner,
              style: TextStyle(fontSize: 30, color: Colors.red)),
               Text(widget.email),
            ],
          ),

             

               SizedBox(height: 30,)
              
              ])
    );
  }
}

//event 4

class Event4tile extends StatefulWidget {
  String winner;
  String email;
  Event4tile({@required this.winner,@required this.email});

  @override
  _Event4tileState createState() => _Event4tileState();
}

class _Event4tileState extends State<Event4tile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Text(widget.winner,
              style: TextStyle(fontSize: 30, color: Colors.redAccent)),
          Text(widget.email)
        ],
      ),
    );
  }
}
