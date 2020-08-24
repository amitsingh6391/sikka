import 'package:admob_flutter/admob_flutter.dart';
import "package:flutter/material.dart";
import 'package:sikka/services/admob_service.dart';
import 'package:sikka/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import "dart:math";
import "dart:async";

class Event1result extends StatefulWidget {

 final  String winnercolor;
  Event1result({@required this.winnercolor});
  @override
  _Event1resultState createState() => _Event1resultState();
}

class _Event1resultState extends State<Event1result> {
  //var redamount, blueamount, yellowamount, wincoloramount;
  //wincolor;
   final ams = AdMobService();

  @override
  void initState() {

      Admob.initialize(ams.getAdMobAppId());
   // getCurrentUser();
    

    super.initState();
  //  getwinnercolor();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
              child: Card(
           child: Text("Event 1 Wineers",style:TextStyle(fontSize:30,color:Colors.red),)),
            ),

            SizedBox(height:20),
        
       StreamBuilder(
              stream: Firestore.instance
           .collection("Event1")
           .document(widget.winnercolor)
           .collection("user").snapshots(),
              builder: (context, snapshot) {
         if (!snapshot.hasData) {
           print("loading");
         }

        
         print(widget.winnercolor);

         print("okk");

         return ListView.builder(
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  itemCount: snapshot.data.documents.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    
                                    return Column(
                                      children: <Widget>[
                                      Event1tile(
                                          
                                      
                                          userid: snapshot.data.documents[index]
                                              .data["userid"],
                                              coin: snapshot.data.documents[index]
                                              .data["coin"],
                                             
                                            color: snapshot.data.documents[index]
                                              .data["color"],
                                          
                                            
                                        ),
                                      ],
                                    );
                                  });
              },
            )
          ]))));
  }
}


class Event1tile extends StatefulWidget {

  String userid,color,coin;
  Event1tile({@required this.userid,
  @required this.coin,
  @required this.color
  });


  @override
  _Event1tileState createState() => _Event1tileState();
}

class _Event1tileState extends State<Event1tile> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child:Column(
        children: <Widget>[
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child:Column(children:[
            Text("User id",style:TextStyle(fontSize: 20,color:Colors.white)),
            SizedBox(height:10),
             Text(widget.userid,style:TextStyle(fontSize: 20,color:Colors.white)
             )
             ]
             )
             ),
          ),
          
          Container(
            color:Colors.black,
            child:Row(

              children: <Widget>[

                Text("Color : ",style:TextStyle(fontSize: 20,color:Colors.white)),SizedBox(width:20),

                Text(widget.color,style:TextStyle(fontSize: 20,color:Colors.white)
            )
              ],

            
          ))
        ],
      )
      
    );
  }
}