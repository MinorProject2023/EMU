import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/consumer.dart';
import 'package:demo_app/provider/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant/appconstant.dart';
import '../provider/getit.dart';
import '../services/firestore_service.dart';

class AddConsumerViewModel extends BaseModel {
  final _auth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = getIt<FireStoreService>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController mobController = TextEditingController();
  final TextEditingController consumeridController = TextEditingController();
  final TextEditingController meterphaseController = TextEditingController();
  final TextEditingController sanctionloadController = TextEditingController();
  final TextEditingController meterstatusControoler = TextEditingController();
  final TextEditingController meternoController = TextEditingController();
  final TextEditingController pastreadingController = TextEditingController();
  final TextEditingController presentreadingController =
      TextEditingController();

  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  void createConsumer(BuildContext context) {
    addConsumer(
      consumer_id: consumeridController.text,
      name: nameController.text,
      email: emailController.text,
      password: passController.text,
      address: addressController.text,
      category: categoryController.text,
      mob: mobController.text,
      meter_phase: meterphaseController.text,
      sanction_load: sanctionloadController.text,
      meter_status: meterstatusControoler.text,
      meter_no: meternoController.text,
      past_reading: pastreadingController.text,
    );
    Navigator.pop(context);
  }

  Future addConsumer(
      {required String consumer_id,
      required String name,
      required String email,
      required String password,
      required String address,
      required String category,
      required String mob,
      required String meter_phase,
      required String sanction_load,
      required String meter_status,
      required String meter_no,
      required String past_reading}) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fireStoreService.addConsumer(
        ConsumerModel(
            name: name,
            id: authResult.user?.uid,
            email: email,
            consumer_id: consumer_id,
            address: address,
            category: category,
            mob: mob,
            meter_no: meter_no,
            meter_phase: meter_phase,
            sanction_load: sanction_load,
            bill_date: Timestamp.now(),
            bill_no: "5002",
            due: "0",
            past_reading: "0",
            phase: "1",
            present_reading: "0",
            reading_date: Timestamp.now(),
            status: meter_status == "active"),
      );
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      AppConstant.showFailToast(e.message.toString());
      return e.message;
    }
  }

  void updateReading(
      {required String email, required final String present_reading}) {
    final userRef = FirebaseFirestore.instance.collection("users");
    final x = userRef.snapshots();
    x.forEach((element) {
      element.docs.forEach((e) {
        String mail = e.get("email");
        if (mail.compareTo(email) == 0) {
          String uid = e.get("id");
          final past_reading = e.get("present_reading");
          _usersCollectionReference.doc(uid).update({
            'present_reading': present_reading,
            'past_reading': past_reading,
          });
          print(past_reading);
          AppConstant.showSuccessToast("Reading Updated");
          // print(uid);
          return;
        }
      });
    });
  }
}
