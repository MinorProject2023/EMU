import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/provider/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseModel {
  final auth = FirebaseAuth.instance;
  String name = "";
  String address = "";
  String bill_no = "";
  String mob = "";
  String email = "";
  String category = "";
  String meter_phase = "";
  String sanction_load = "";
  String status = "";
  String bill_date = "";
  String due_date = "";
  String reading_date = "";
  String pre_reading = "";
  String curr_reading = "";
  var uid;

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
    uid = auth.currentUser?.uid;
    var data = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .listen((event) {
      name = event.data()!['name'];
      address = event.data()!['address'];
    });
    print("........." + name + "..........");
    notifyListeners();
  }
}
