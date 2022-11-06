import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/provider/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseModel {
  final auth = FirebaseAuth.instance;
  String name = "";

  // void setName() async {
  //   uid = auth.currentUser?.uid;

  //   if (uid != null) {}

  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .snapshots()
  //       .listen((event) {
  //     name = event.data()!['name'];
  //   });
  // }

  void init() {
    var uid = auth.currentUser?.uid;
    var data = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .listen((event) {
      name = event.data()!['name'];
    });
    print("........." + name + "..........");
    notifyListeners();
  }
}
