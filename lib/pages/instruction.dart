// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// class instruction extends StatefulWidget {
//   @override
//   _instructionState createState() => _instructionState();
// }

// class _instructionState extends State<instruction> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:

//     Container(decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [Colors.white,Colors.blueAccent[100]]
//         )
//     ),
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
//                 child: GestureDetector(
//                   onTap: (){
//                     Navigator.of(context).pop();
//                   },
//                   child: Icon(Icons.arrow_back),
//                 ),
//               ),
//               SizedBox(width: 0,),
              
//               Text("SIKKA",style: GoogleFonts.berkshireSwash(fontSize:40,color: Colors.black),)
//             ],
//           ),
//           SizedBox(height: 20,),
//           Row(
//             children: <Widget>[
//               Container(padding: EdgeInsets.fromLTRB(30, 0, 10, 10),
//                   child: Text("How to Use SIKKA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)))
//             ],
//           ),
//           Row(

//             children: <Widget>[

//               SizedBox(height: 100),
//               Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 10),

//                 child: Center(
//                   child: Column(
//                     children: <Widget>[

//                       SizedBox(height: 10,),
//                       SizedBox(
//                         width: 300,
//                         child: Text(
//                           "*   After successfully registration or login you will be navigated to Home page ....And now the fun begins!!",
//                           maxLines: 11,
//                           overflow: TextOverflow.visible,
//                           softWrap: true,
//                           style: TextStyle(color: Colors.black, fontSize: 17.0),
//                         ),
//                       ),
//                       SizedBox(height: 10,),

//                       SizedBox(
//                         width: 300,
//                         child: Text(
//                           "*  In the Home Page you will see some specified options for every step. There is LIVE EVENT for entering in the betting match, "
//                              "Payment Management for managing your SIKKA coin wallet and on further sliding you will reach at Result. "
//                               "In the LIVE EVENT of SIkKA there are numerous events acording to time, every event will be of 3 hours",
//                           maxLines: 11,
//                           overflow: TextOverflow.visible,
//                           softWrap: true,
//                           style: TextStyle(color: Colors.black, fontSize: 17.0),
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       SizedBox(
//                         width: 300,
//                         child: Text(
//                           "*WE the team of SIKKA had worked hard on the mechanism of events in order to provide you a fair platform "
//                     "winner will get twice of the betting amount placed within 10 hours ",
//                           maxLines: 11,
//                           overflow: TextOverflow.visible,
//                           softWrap: true,
//                           style: TextStyle(color: Colors.black, fontSize: 15.0),
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       SizedBox(
//                         width: 300,
//                         child: Text(
//                           "*all the participants who had selected the winning color will be awarded "
//                              "and the winner list will be declared in the result page within 10 hours  ",
//                           maxLines: 11,
//                           overflow: TextOverflow.visible,
//                           softWrap: true,
//                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 19.0),
//                         ),
//                       ),


// //                     Row(
// //                        children: <Widget>[
// //                          Text(" *
// //                              "WE the team of SIKKA had worked hard on the mechanism of events in order to provide you a fair platform"
// //                              "As to minimize the loopholes we neglected the numbers and invented  colors    "
// //                              "Choose the color in which you want to place the bet,And proceed to payment page"
// //                              "Next to the appbar you can see your SIKKA wallet coins if you found a zero navigate to the payment gateway through the HomePage"
// //                              "Enter the amount you want to bet and click on the pay now for initializing the payment process"
// //                              "After completing the payment you will recieve an confirmation popup"
// //                              "wait for the completion time of the  event "
// //                              "Within a short passage of time Results will be declared"
// //                              "winner will get twice of the betting amount placed within 10 hours"
// //                              ",textAlign: TextAlign.left,),
// //                        ],
// //                      )
//                     ],
//                   ),
//                 ),

//               ),
//             ],
//           ),
//         ],
//       ),
//     ));
//   }
// }





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class instruction extends StatefulWidget {
  @override
  _instructionState createState() => _instructionState();
}

class _instructionState extends State<instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue[100],
      body:
      SingleChildScrollView(
      child:Stack(
      children:<Widget>[
    Container(decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white,Colors.blueAccent[500]]
        )
    ),
     ),
       Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 30),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(width: 0,),
              
              Text("SIKKA  Guideline",style: GoogleFonts.berkshireSwash(fontSize:28,color: Colors.black),)
            ],
          ),
          Row(

            children: <Widget>[
              Container(padding: EdgeInsets.fromLTRB(10, 0, 10, 10),

                child: Center(
                  child: Column(
                    children: <Widget>[


                      SizedBox(
                        width: 300,
                        child: Text(
                          "*   After successfully registration or login you will be navigated to Home page ....And now the fun begins!!",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
                        ),
                      ),
                      SizedBox(height: 10,),

                      SizedBox(
                        width: 300,
                        child: Text(
                          "*  In the Home Page you will see some specified options for every step. There is LIVE EVENT for entering in the betting match, "
                              "\n *  In live event you are offered 5 colors .select your choice and enter in the live event"
                            " \n *   Pay from your sikka coin wallet and after that you will get a pop up message confirming your order."
                              "\n \n *  Every event will be of 10 minute after 10 minutes in the stopwatch result will be shown in the result section."
                              " all the participants of winning color will get the reward"
                              "\n \n *  Prize money will be triple the amount of the individual's betting amount and will be transferred in your account under 24 hours."
                              "\n \n *   any type of cheating is strictly prohibited and guilty will face a strict actions.",
                          maxLines: 100,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "*WE the team of SIKKA had worked hard on the mechanism of events in order to provide you a fair platform ",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text("SIKKA के दिशानिर्देश।।",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "*१)पूर्ण रूप से सुरक्षित एवम् विश्वशनीय sikka एक ऐसा प्लेटफॉर्म है जहाॅ‌ आप चंद घंटो के अंदर करोड़पति बन सकते है।"
    "\n २) sikka में भाग लेने के लिए सबसे पहले लॉगइन/साइनअप करें"
    "\n ३) लॉगइन करते ही आप हमारे होमपेज पे पहुंच जाएंगे जिसमें आपके सामने बहोत सारे ऑप्शन होंगे।इन्हीं ऑप्शन में होंगे जैसे live event , payment management, और result  ऊपर की तरफ प्रोफ़ाइल"
   " \n ४) live event में जाके आप खेल में भाग ले सकते है।sikka  आपको पांच कलर उपलब्ध कराता है जिसमें से आप अपनी इच्छा अनुसार कलर चुने और सिक्का के वॉलेट से भुगतान करें। वॉलेट में अगर शून्य सिक्के हों तो payment management में जाके एड करें।"
    "कालर में धनराशि लगते ही आपके सामने एक मेसेज आएगा"
    "जो की ये सिद्ध कराएगा की आपका बेट लग चुकी है।"
   "\n  ५)ध्यान रहे कि  एक इवेंट सिर्फ १० मिनट ही चलेगा और बाकी के दो मिनट बाद आप होमपेज में जाके रिजल्ट को चुन कर  अपने इवेंट का रिजल्ट देख सकते है।"
  " \n ६) जितने वाले कलर में पैसे लगने वाले सभी व्यक्तियों को उनके द्वारा लगाई गई धनराशि का तीन गुना मिलेगा।"
   "\n  ७) पैसे ट्रांसफर अगले 24 घंटे के भीतर आपके दिए गए न० पर पेटम या upi से कर दिए जाएंगे।",
                          maxLines: 110,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 19.0),
                        ),
                      ),


//                     Row(
//                        children: <Widget>[
//                          Text(" *
//                              "WE the team of SIKKA had worked hard on the mechanism of events in order to provide you a fair platform"
//                              "As to minimize the loopholes we neglected the numbers and invented  colors    "
//                              "Choose the color in which you want to place the bet,And proceed to payment page"
//                              "Next to the appbar you can see your SIKKA wallet coins if you found a zero navigate to the payment gateway through the HomePage"
//                              "Enter the amount you want to bet and click on the pay now for initializing the payment process"
//                              "After completing the payment you will recieve an confirmation popup"
//                              "wait for the completion time of the  event "
//                              "Within a short passage of time Results will be declared"
//                              "winner will get twice of the betting amount placed within 10 hours"
//                              ",textAlign: TextAlign.left,),
//                        ],
//                      )
                    ],
                  ),
                ),

              ),
            ],
          ),
        ],
      ),
    ])),
    );
  }
}