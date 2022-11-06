import 'package:demo_app/provider/base_view.dart';
import 'package:demo_app/view/home_viewmodel.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.handleStatrtUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 100,
                child: Image.asset('assets/icon_large.png'),
              ),
              const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Color(0xff19c7c1)),
              ),
              TextButton(
                onPressed: () {
                  AuthenticationHelper().signOut();
                  Navigator.popAndPushNamed(context, '/login');
                },
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
