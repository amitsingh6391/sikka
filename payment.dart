
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sikka/events/event1.dart';
import 'package:firebase_storage/firebase_storage.dart';

//import 'home.dart';
class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  //var m;

  int y=0,z;
  var s;
  var username,useremail,usernumber;

  Razorpay razorpay;
  TextEditingController coinEditingController = new TextEditingController();
  var a=TextEditingController;


  String userid;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getData().then((result) {
    //   setState(() {

    //     coinsdata = result;




    //   });

    // });


    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }



  // getData() async {

  //   return await Firestore.instance.collection("coin").document(userid).snapshots();


  // }

  @override

  void dispose() {
// TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
    createnewuser();
  }

  createnewuser() async{

    await Firestore.instance.collection("coin").document(userid).setData({
      "coins":0,
      'userid':userid
    });

  }



  Updatecoin({String Id}) async {

    await Firestore.instance.collection("coinstore").document(userid).setData({
      "paymentid" :Id,
      "userid": userid,
      "money":num.parse(coinEditingController.text),
      'time': DateTime.now().millisecondsSinceEpoch,
    })
        .then((result) {
      //Calculate();
      //Uploadcoin2();


      print("store");
    });
    Uploadcoin2();
  }

  Calculate(){
    //  z=num.parse(coinEditingController.text)+x;
    Uploadcoin2();//m aara hoon abhi tu kr//thik hi //kha hi gya ki hi//hua kuch//y x m tcontroller hi?
  }

  Uploadcoin2()async{
    //z=m+x;
    z=num.parse(coinEditingController.text)+s;
    print("hiii");
    print(z);
    await Firestore.instance.collection("coin").document(userid).setData({
      //'coins' :z.toString(),
      "coins":z,
      "userid":userid
    }).then((result) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => Body(),
      //     ));
      print("store");
    });

  }
  void openCheckout(){
    var options = {
      "key" : "rzp_test_IKDYVKNRdBLc67",
      "amount" : num.parse(coinEditingController.text)*100,
      "description" : "Add Money",
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaymentSuccess(PaymentSuccessResponse response){

    Fluttertoast.showToast(msg: "coins successfully added to your sikka account........"+response.paymentId);
    Updatecoin(Id:response.paymentId);
    print("Pamyent successful");
    //Uploadcoin2();
// success();
  }

  void handlerErrorFailure(PaymentFailureResponse response){
    print("Payment error");
    Fluttertoast.showToast(msg: "error"+response.code.toString()+"."+response.message);
  }

  void handlerExternalWallet(ExternalWalletResponse response){
    print("External Wallet");
    Fluttertoast.showToast(msg: "External Wallet"+response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sikka"),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: coinEditingController,
              decoration: InputDecoration(
                  hintText: "amount to add"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Pay Now", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
                // setState(() {
                //   m=m+int.parse(coinEditingController.text);
                // });
              },
            ),
            Container(
              child: StreamBuilder(
                stream: Firestore.instance.collection("coin").document(userid).snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    print("loading");
                  }
                  var coindata = snapshot.data;
                  s= coindata["coins"];
                  print(s);
                  return SizedBox(
                    //coindata["coins"]
                    height: 5,
                  );
                },


              ),
            ),
//            Container(
//              child: StreamBuilder(
//                stream: Firestore.instance.collection("users").document(userid).snapshots(),
//                builder: (context, snapshot) {
//                  if(!snapshot.hasData){
//                    print("loading");
//                  }
//                  var userdetails = snapshot.data;
//                 // s= coindata["coins"];
//                 // print(s);
////                  username = userdetails["userName"];
////                  useremail = userdetails["userEmail"];
////                  usernumber = userdetails["userphonenumber"];
//                  return Text(
//
//                    userdetails["userName"]
//
//                  );
//                },
//
//
//              ),
//            )
          ],
        ),
      ),
    );
  }
}
