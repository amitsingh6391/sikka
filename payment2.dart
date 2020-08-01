import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sikka/events/event1.dart';
import 'package:sikka/home.dart';
class payment extends StatefulWidget {

  final String color;
 payment({Key key, @required this.color}) : super(key: key);
  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  TextEditingController coinEditingController = new TextEditingController();
  String userid;
  Stream usercoinstream;
  int z;
  var s;
  void initState() {
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
  Uploadcoin3()async{
    //z=m+x;
    z=s-num.parse(coinEditingController.text);
    print("hiii");
    print(z);
    await Firestore.instance.collection("coin").document(userid).setData({
      //'coins' :z.toString(),
      "coins":z,
      "userid":userid
    }).then((result) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Event1(x:coinEditingController.text),
//           ));
      print("store");
    });

  }


  storeuser() async {


    await Firestore.instance.collection("event1").document(userid).setData({
      "color": widget.color,
      "userid": userid,
      "coin" : num.parse(coinEditingController.text),
      'time': DateTime.now(),
      //"documentID": documentID
    });/*.then((result) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Event1(),
          ));*/
    // print("store");
    //});
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
                Navigator.of(context).pop();
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
      backgroundColor: Colors.white,
    appBar: AppBar(
        title:Text("Select Your Amount",style: TextStyle(color: Colors.black),),
      flexibleSpace: Container(
        color: Colors.teal[100],
      ),
    ),
      body:
      Container(
        child:  Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 190,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[100],
                          borderRadius:new BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    child:Icon(Icons.monetization_on,color: Colors.white,size: 50,)
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: StreamBuilder(
                                    stream: Firestore.instance.collection("coin").document(userid).snapshots(),  //
                                    builder: (context, snapshot) {
                                      if(!snapshot.hasData){
                                        print("loading");
                                      }
                                      var coindata = snapshot.data;
                                      s= coindata["coins"];
                                      print(s);
                                      return Text(s.toString(),style: TextStyle(color: Colors.black,fontSize: 30),);
                                    },


                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 100,),
            TextField(
                  controller: coinEditingController,
                  decoration: InputDecoration(
                      hintText: "amount to add"
                  ),
                ),
                SizedBox(height: 12,),
                RaisedButton(
                  color: Colors.teal,
                  child: Text("Pay Now", style: TextStyle(
                      color: Colors.white
                  ),),
                  onPressed: (){
                    Uploadcoin3();
                    storeuser();
                    _showDialog();

                    // setState(() {
                    //   m=m+int.parse(coinEditingController.text);
                    // });
                  },
                ),
          ],
        ),
      ),
    );

  }
}