import 'package:demo_app/authentication/authentication.dart';
import 'package:demo_app/provider/base_model.dart';
import 'package:demo_app/provider/base_view.dart';
import 'package:demo_app/provider/getit.dart';
import 'package:demo_app/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationHelper _authService = getIt<AuthenticationHelper>();
  final NavigationService _navigationService = getIt<NavigationService>();

  Future handleStatrtUpLogic() async {
    // var hasLoggedInUser = await _authService.isUserLoggedIn();
    // if (hasLoggedInUser) {
    //   _navigationService.navigateTo('/home');
    // } else {
    //   _navigationService.navigateTo('/login');
    // }

    if (FirebaseAuth.instance.currentUser == null) {
      _navigationService.navigateTo('/login');
    } else {
      print("Sumit " + FirebaseAuth.instance.currentUser!.uid + " Sumit");
      _navigationService.navigateTo('/home');
    }
  }
}
