//

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  //add likes

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

   getEvent1result() async {
    return await Firestore.instance.collection("event1result").orderBy("time").snapshots();
  }

   getEvent2result() async {
    return await Firestore.instance.collection("event2result").orderBy("time").snapshots();
  }

   getEvent3result() async {
    return await Firestore.instance.collection("event3result").orderBy("time").snapshots();
  }

   getEvent4result() async {
    return await Firestore.instance.collection("event4result").orderBy("time").snapshots();
  }

}
