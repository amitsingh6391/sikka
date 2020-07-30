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
    return Scaffold(body:

    Container(decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white,Colors.blueAccent[100]]
        )
    ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(width: 0,),
              Text("SIKKA",style: GoogleFonts.berkshireSwash(fontSize:40,color: Colors.black),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              Container(padding: EdgeInsets.fromLTRB(30, 0, 10, 10),
                  child: Text("How to Use SIKKA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)))
            ],
          ),
          Row(

            children: <Widget>[

              SizedBox(height: 100),
              Container(padding: EdgeInsets.fromLTRB(10, 50, 10, 10),

                child: Center(
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 10,),
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
                             "Payment Management for managing your SIKKA coin wallet and on further sliding you will reach at Result. "
                              "In the LIVE EVENT of SIkKA there are numerous events acording to time, every event will be of 3 hours",
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
                          "*WE the team of SIKKA had worked hard on the mechanism of events in order to provide you a fair platform "
                    "winner will get twice of the betting amount placed within 10 hours ",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "*all the participants who had selected the winning color will be awarded "
                             "and the winner list will be declared in the result page within 10 hours  ",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 19.0),
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
    ));
  }
}
