import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/provider/base_model.dart';
import 'package:demo_app/provider/getit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication.dart';

class RegisterViewModel extends BaseModel {
  final _auth = FirebaseAuth.instance;
  final _userDb = FirebaseFirestore.instance;

  final AuthenticationHelper _authService = getIt<AuthenticationHelper>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void signUp(BuildContext context) async {
    // try {
    //   UserCredential userCredential =
    //       await _auth.createUserWithEmailAndPassword(
    //     email: emailController.text,
    //     password: passController.text,
    //   );
    //   User? user = userCredential.user;
    //   if (user != null) {
    //     DocumentSnapshot userCheck =
    //         await _userDb.collection("users").doc(user.uid).get();
    //     if (userCheck.exists) {
    //       print("User exits............");
    //     } else {
    //       _userDb.collection('users').doc(user.uid).set({
    //         "id": user.uid,
    //         "name": nameController.text,
    //         "email": user.email,
    //       }).then((value) => Navigator.popAndPushNamed(context, "/profile"));
    //     }
    //   }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('Account already exists for this mail.');
    //   }
    // } catch (e) {
    //   print(e);
    // }
    var result = _authService.signUp(
      email: emailController.text,
      password: passController.text,
      name: nameController.text,
    );
    Navigator.popAndPushNamed(context, '/login');
  }
}
