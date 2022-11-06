import 'package:demo_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../provider/getit.dart';
import '../services/firestore_service.dart';

class AuthenticationHelper {
  final _auth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = getIt<FireStoreService>();
  late UserProfileModel _currentUser;
  UserProfileModel get currentUser => _currentUser;

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _fireStoreService.getUser(user.uid);
    }
  }

  //Sign Up Method
  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fireStoreService.createUser(
        UserProfileModel(name: name, id: authResult.user?.uid, email: email),
      );
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Sign In Method
  Future signIn({required String email, required String password}) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user!);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser!;
    await _populateCurrentUser(user);
    print("-------isLogggedIn------" + user.uid);
    return user != null;
  }

  Future signOut() async {
    await _auth.signOut();
    print('SignOut');
  }
}
