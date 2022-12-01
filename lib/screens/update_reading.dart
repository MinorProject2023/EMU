import 'package:demo_app/utils/my_textfield.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication.dart';
import '../provider/base_view.dart';
import '../view/addconsumer_viewmodel.dart';

class UpdateReading extends StatelessWidget {
  const UpdateReading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BaseView<AddConsumerViewModel>(
      builder: (context, model, child) => Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/emu_logo-removebg_small.png'),
                alignment: Alignment.topCenter,
              ),
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white,
                Colors.yellow,
                Colors.red,
                Colors.blue
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
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
    );
  }
}
