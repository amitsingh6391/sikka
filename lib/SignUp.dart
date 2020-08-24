


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:sikka/pages/home.dart';

// import 'package:sikka/pages/home_page.dart';
import 'package:sikka/view/viewservices/auth.dart';
import 'package:sikka/view/viewservices/database.dart';
import 'package:url_launcher/url_launcher.dart';


import "package:flutter/material.dart";


import "package:sikka/view/helper/helperfunction.dart";
import 'package:sikka/view/widgets/widget.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController collegeEditingController = new TextEditingController();
  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController branchEditingController = new TextEditingController();
  TextEditingController yearEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String userid;

  singUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(
          emailEditingController.text, passwordEditingController.text)
          .then((result) {
        if (result != null) {
          Map<String, String> userDataMap = {
            "userName": usernameEditingController.text,
            "userEmail": emailEditingController.text,
            "userphonenumber": phoneEditingController.text,

          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);


          HelperFunctions.saveUserPhoneSharedPreference(
              emailEditingController.text);

              //get now current user id...

         

          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => Body()));
          getCurrentUser();
         
        }
      });
    }
  }
  getCurrentUser() async {
        final FirebaseAuth _auth = FirebaseAuth.instance;
       final FirebaseUser user = await _auth.currentUser();
       final uid = user.uid;
        print(uid);
       setState(() {
        userid = uid.toString();
       });

     addnewuserdata();
     addnewusercoin();
    }
addnewusercoin()async{

  await Firestore.instance.collection("coin").document(userid).setData({

  
    "userid":userid,
    "coins":0

  });

}

    //now we add users data to store firebase..

    addnewuserdata() async{

    await Firestore.instance.collection("userinformation").document(userid).setData({
      "username":usernameEditingController.text,
      "useremail":emailEditingController.text,
      "userphone":phoneEditingController.text,
    });

      Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Body()));

  }



        

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                color: Colors.white,
                child: Image.asset("assets/images (1).png"),
              ),
              //Spacer(),
              SizedBox(height:20),


              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(

                      controller: usernameEditingController,
                      validator: (val) {
                        return val.isEmpty || val.length < 3
                            ? "Enter Username 3+ characters"
                            : null;
                      },
                      decoration: textFieldInputDecoration("username"),
                    ),



                    TextFormField(
                      style: simpleTextStyle(),
                      controller: phoneEditingController,
                      validator: (val) {
                        return val.isEmpty || val.length < 10
                            ? "enter valid phone number"
                            : null;
                      },
                      decoration:
                      textFieldInputDecoration("Phone number"),
                    ),
                    TextFormField(
                      controller: emailEditingController,
                      style: simpleTextStyle(),
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                            ? null
                            : "Enter correct email";
                      },
                      decoration: textFieldInputDecoration("email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("password"),
                      controller: passwordEditingController,
                      validator: (val) {
                        return val.length < 6
                            ? "Enter Password 6+ characters"
                            : null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text("By clicking Sign Up,you agree to our TERMS and that you have read our DATA POLICY",style: TextStyle(color: Colors.blueAccent),),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  singUp();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff71b4ce),
                          Colors.white,
                        ],
                      )),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Sign Up",
                    style: biggerTextStyle(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: simpleTextStyle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: Text(
                      "SignIn now",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children:[
                  FlatButton(
                   onPressed: (){
                     terms();
                   },
                    child:Text("Terms & condition")
                  ),
                  FlatButton(
                    onPressed: (){
                      urllauncher();
                    },
                    child:Text("Privacy policy")
                  )
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

urllauncher() async {
  const url = 'https://sikka-0.flycricket.io/privacy.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
terms() async {
  const url = 'https://sikka-0.flycricket.io/terms.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

