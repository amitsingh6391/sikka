import "package:flutter/material.dart";

class NoEvent extends StatefulWidget {
  @override
  _NoEventState createState() => _NoEventState();
}

class _NoEventState extends State<NoEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Column(children: [
          SizedBox(
            height: 100,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 100,
            child: Image(
              image: AssetImage(
                  "assets/money-exchange-currency-conversion-indian-rupee-dollar-2-5898.png"),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Card(
                  child: Text(
            " All events are closed",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ))),
          SizedBox(
            height: 40,
          ),
          Icon(Icons.nature_people, size: 100, color: Colors.white)
        ])));
  }
}
