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
        onPressed: (){
          
        }),

      body:Container(
        child:Center(

          child:Text("event closed")

        )
      )
      
    );
  }
}