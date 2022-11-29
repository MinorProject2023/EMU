import 'package:demo_app/utils/my_textfield.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication.dart';
import '../provider/base_view.dart';
import '../view/addconsumer_viewmodel.dart';

class UpdateReading extends StatelessWidget {
  const UpdateReading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AddConsumerViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/nitp.png'),
                fit: BoxFit.fitWidth,
                opacity: 0.8),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange.shade900,
              title: const Text('Update Reading'),
              actions: [
                IconButton(
                  splashRadius: 30,
                  onPressed: () {
                    AuthenticationHelper().signOut();
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  MyCustomTextField(
                    controller: model.emailController,
                    hint: "Email ID of consumer",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyCustomTextField(
                    controller: model.presentreadingController,
                    hint: "Present Reading",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      model.updateReading(
                        email: model.emailController.text,
                        present_reading: model.presentreadingController.text,
                      );
                    },
                    child: const Text('Create bill'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange.shade900),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
