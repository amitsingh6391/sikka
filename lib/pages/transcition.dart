import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
class Transc extends StatefulWidget {
  @override
  _TranscState createState() => _TranscState();
}

class _TranscState extends State<Transc> {

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
        backgroundColor: Colors.black,
        onPressed:(){
        Navigator.pop(context);
      },
      child:Icon(Icons.arrow_back)),

      backgroundColor: Colors.lightBlue,

      body:SafeArea(
              child: Column(
          
          children:[

            Text('Your Transaction :',style: TextStyle(fontSize:30,color:Colors.white),),

            SizedBox(height:20),
          
          Container(
                      child: StreamBuilder(
                    stream:
                        Firestore.instance.collection(userid).snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("loading");
                      }
                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Transctitiondetail(
                                  money: snapshot.data.documents[index].data["money"],
                                  color:
                                      snapshot.data.documents[index].data["color"],

                                      bettime:
                                      snapshot.data.documents[index].data["bettime"],
                                ),
                              ],
                            );
                          });
                    },
                  ))]),
      )
      
    );
  }
}



class Transctitiondetail extends StatefulWidget {
  final String  color,bettime;
  int money;
  Transctitiondetail({@required this.money, @required this.color, @required this.bettime});

  @override
  _TransctitiondetailState createState() => _TransctitiondetailState();
}

class _TransctitiondetailState extends State<Transctitiondetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
              child: Container(

          color: Colors.green,

          child:Column(children: <Widget>[
          Row(
            children: <Widget>[
              Text("Bet time   "),
              Text(widget.bettime)
            ],
          ),
           Row(
            children: <Widget>[
              Text("your color:    "),
              Text(widget.color)
            ],
          ),
           Row(
            children: <Widget>[
              Text("your ammount:   "),
             Text(widget.money.toString())
            ],
          )
          ],)

        ),
      ),
    );
  }
}
