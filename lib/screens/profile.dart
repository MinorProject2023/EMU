import 'package:demo_app/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FirebaseAuth.instance.currentUser == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Successfully Signed Out',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, '/login'),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Successfully Signed In',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      AuthenticationHelper().signOut();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
