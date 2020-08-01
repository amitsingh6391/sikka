


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sikka/view/helper/helperfunction.dart';
import 'package:sikka/view/viewservices/auth.dart';
import 'package:sikka/view/viewservices/database.dart';
import 'package:sikka/pages/home.dart';
import "dart:io";

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
          emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot =
          await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["userEmail"]);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Body()));
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },



      child:Scaffold(

        floatingActionButton: FloatingActionButton(

                  onPressed:(){

                    exit(0);

                  },
                  child:Icon(Icons.cancel,color:Colors.red),
                  backgroundColor:Colors.black


                ),

      backgroundColor:Colors.teal[100],
      body: isLoading
          ? Container(
          color: Colors.white,
        child: Center(child: Container(
            child: CircularProgressIndicator())),
      )
          : SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Container(
                height: MediaQuery.of(context).size.height,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color:Colors.black,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))

                ),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [

                    SizedBox(height:40),
                    Text("Login",
                    style: TextStyle(
                      color: Colors.teal[300],
                      fontSize: 30,
                    ),),
                    SizedBox(height:60),

                    Form(
                        key: formKey,
                        child: Column(
                            children: [
                              Column(
                                children: <Widget>[
                                  TextFormField(

                                    validator: (val) {
                                      return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                          ? null
                                          : "Please Enter Correct Email";
                                    },
                                    controller: emailEditingController,
                                    decoration: InputDecoration(hintText:"Email"),

                                  ),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    obscureText: true,
                                    validator: (val) {
                                      return val.length > 6
                                          ? null
                                          : "Enter Password 6+ characters";
                                    },
                                    controller: passwordEditingController,
                                    decoration: InputDecoration(hintText:"Password"),
                                  ),
                                ],
                              ),
                            ])),
                    SizedBox(
                      height: 30,
                    ),


                    GestureDetector(
                      onTap: () {
                        signIn();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                // const Color(0xff007EF4),
                                // const Color(0xff2A75BC)
                                Colors.teal[100],
                                Colors.white
                              ],
                            )),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                   
                    
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Don't have account? ",style:TextStyle(fontSize:12)
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text("SIKKA",style: GoogleFonts.berkshireSwash(fontSize:40,color: Colors.teal[300]),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
