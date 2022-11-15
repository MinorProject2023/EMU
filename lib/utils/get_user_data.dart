import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String uid;
  final TextStyle style;
  const GetUserName(this.uid, this.style, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(uid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "Something went wrong",
            style: style,
          );
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text(
            "Document does not exist",
            style: style,
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "Name: ${data['name']}",
            style: style,
          );
        }
        return const Text('loading');
      },
    );
  }
}
