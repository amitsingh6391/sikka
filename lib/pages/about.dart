import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
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
              Container(padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(width: 50,),

              Container(
                  padding:EdgeInsets.fromLTRB(10, 50, 10, 0),child: Image(image: AssetImage("assets/icon.png"),height: 130,)),
            ],
          ),
          SizedBox(height: 20,),
          Row(

            children: <Widget>[

              SizedBox(height: 100),
              Container(padding: EdgeInsets.fromLTRB(10, 30, 10, 10),

                child: Center(
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "   Created in 2020 Sikka provides you an amazing platform to earn money ",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      SizedBox(height: 10,),

                      SizedBox(
                        width: 300,
                        child: Text(
                          "Your chance to become a billionaire is here "
                          "\n Just few steps and you can live your dreams.",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Recommended by professionals."

                         "\n SIKKA offers a realtime gambling platform in your phone ."
                        "\n100% real and trustworthy. ",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "JUST BELIEVE IN YOUR LUCK "
                          "\n HAPPY BETTING",
                          maxLines: 11,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
SizedBox(
  height: 10,
),
Container(
  padding: EdgeInsets.fromLTRB(60, 30, 0, 0),
  child: Text("~ Team SIKKA",style: TextStyle(color: Colors.black,fontSize: 30),),
)


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