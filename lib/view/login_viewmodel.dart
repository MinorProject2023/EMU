import 'package:demo_app/provider/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseModel {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.pushNamed(context, '/profile');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found');
      } else if (e.code == 'wrong-answer') {
        print('Wrong Passworng');
      } else {
        print("Errot");
      }
    }
  }
}
