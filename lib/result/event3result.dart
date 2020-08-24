import "package:flutter/material.dart";
import 'package:sikka/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import "dart:math";
import "dart:async";

class Event3result extends StatefulWidget {

 final  String winnercolor3;
  Event3result({@required this.winnercolor3});
  @override
  _Event3resultState createState() => _Event3resultState();
}

class _Event3resultState extends State<Event3result> {
  //var redamount, blueamount, yellowamount, wincoloramount;
  //wincolor;

  @override
  void initState() {
    

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
           child: Text("Event 3 Wineers",style:TextStyle(fontSize:30,color:Colors.red),)),
            ),

            SizedBox(height:20),
        
       StreamBuilder(
              stream: Firestore.instance
           .collection("Event3")
           .document(widget.winnercolor3)
           .collection("user").snapshots(),
              builder: (context, snapshot) {
         if (!snapshot.hasData) {
           print("loading");
         }

        
         print(widget.winnercolor3);

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