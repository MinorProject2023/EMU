import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/consumer.dart';
import 'package:demo_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final userRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserProfileModel>(
        fromFirestore: (snapshot, _) =>
            UserProfileModel.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  Future createUser(UserProfileModel user) async {
    DocumentSnapshot userCheck =
        await _usersCollectionReference.doc(user.id).get();
    if (userCheck.exists) {
      print("------User exists------");
    } else {
      _usersCollectionReference.doc(user.id).set(user.toJson());
    }
  }

  Future getUser(String uid) async {
    UserProfileModel userData =
        await userRef.doc(uid).get().then((value) => value.data()!);
    return userData;
  }

  Future addConsumer(ConsumerModel consumerModel) async {
    DocumentSnapshot userCheck =
        await _usersCollectionReference.doc(consumerModel.id).get();
    if (userCheck.exists) {
      print("-----consumer exists------");
    } else {
      _usersCollectionReference
          .doc(consumerModel.id)
          .set(consumerModel.toJson());
    }
  }
}
