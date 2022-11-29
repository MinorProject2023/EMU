import 'package:demo_app/provider/base_view.dart';
import 'package:demo_app/view/addconsumer_viewmodel.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication.dart';
import '../utils/my_textfield.dart';

class AddConsumer extends StatelessWidget {
  const AddConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AddConsumerViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(149, 161, 157, 157),
            image: DecorationImage(
                image: AssetImage('assets/nitp.png'),
                fit: BoxFit.fitWidth,
                opacity: 0.8),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange.shade900,
              title: const Text('Add consumer'),
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
                    controller: model.consumeridController,
                    hint: 'Consumer Id',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                      controller: model.nameController, hint: 'Consumer Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  // TextField(
                  //   controller: model.emailController,
                  //   decoration: InputDecoration(
                  //     fillColor: const Color.fromARGB(150, 245, 245, 245),
                  //     filled: true,
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: const BorderSide(color: Colors.black),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: const BorderSide(color: Colors.white),
                  //     ),
                  //     hintText: 'Email',
                  //     // hintStyle: const TextStyle(color: Colors.white),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // ),
                  MyCustomTextField(
                    controller: model.emailController,
                    hint: 'Email ID',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.passController,
                    hint: 'Password',
                    obscuretext: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.addressController,
                    hint: 'Address',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.categoryController,
                    hint: 'Category',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.mobController,
                    hint: 'Mobile No.',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.meterphaseController,
                    hint: 'Meter Phase',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.sanctionloadController,
                    hint: 'Sanction Load',
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.meterstatusControoler,
                    hint: 'Meter Status',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.meternoController,
                    hint: 'Meter Number',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyCustomTextField(
                    controller: model.pastreadingController,
                    hint: 'Past Reading',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => model.createConsumer(context),
                    child: const Text('Save Consumer'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange.shade900),
                  ),
                  const SizedBox(
                    height: 20,
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
