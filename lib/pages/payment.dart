





import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sikka/pages/home.dart';
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
   


    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }



  

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
      "key" : "rzp_live_LpFZPQfU200cbM",
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

      backgroundColor: Colors.lightBlue,

       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Body()));
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child:Container( decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue[200], Colors.white,Colors.blue[200]]),
            image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0.1),
                    BlendMode.dstATop),
                image: new AssetImage("assets/premium-roulette.gif")
            )),
          padding: const EdgeInsets.all(30.0),
          child: Column(

             
            children: [
              SizedBox(height: 100,),
                Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 2)
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30,),
                      CircleAvatar(
                          radius: 50,
                          child: Image(
                            image: AssetImage("assets/images (7).png"),
                          )),
                      SizedBox(height: 32,),
                      TextField(
                        controller: coinEditingController,
                        decoration: InputDecoration(
                            hintText: "amount to add",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                        ),
                      ),
                      SizedBox(height: 42,),
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
                      SizedBox(height: 40,),
                      ColorizeAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [
                            "SIKKA"
                          ],
                          textStyle: GoogleFonts.lora(
                            fontSize: 30.0,
                          ),
                          colors: [
                            Color(0xff00759c),
                            Colors.yellow,
                            Colors.black,
                            Colors.red,
                            Colors.blue[600]

                          ],
                          repeatForever: true,
                          totalRepeatCount: 300,
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.bottomEnd // or Alignment.topLeft
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
                    ],
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
      ),
    );
  }
}