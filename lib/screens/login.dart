import 'package:demo_app/provider/base_view.dart';
import 'package:demo_app/screens/profile.dart';
import 'package:demo_app/view/login_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BaseView<LoginViewModel>(
      builder: (ctx, model, child) => FirebaseAuth.instance.currentUser == null
          ? Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.white,
                    Colors.yellow,
                    Colors.red,
                    Colors.blue
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      // Container(
                      //   padding: const EdgeInsets.only(left: 50, top: 40),
                      //   child: Text(
                      //     'Welcome to EMU\n NITP',
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(
                      //       color: Colors.deepOrange.shade900,
                      //       fontSize: 33,
                      //     ),
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     Image(
                      //       image: AssetImage('assets/nitp.png'),
                      //       ,
                      //     ),
                      //   ],
                      // ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: height * 0.2,
                            left: 35,
                            right: 35,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/profile.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Image(
                                image: const AssetImage(
                                    'assets/emu_logo-removebg.png'),
                                height: height * 0.3,
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              TextField(
                                controller: model.emailController,
                                decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(150, 245, 245, 245),
                                  filled: true,
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // MyCustomTextField(
                              //   controller: model.emailController,
                              //   hint: 'Email',
                              // ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: model.passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(150, 245, 245, 245),
                                  filled: true,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // MyCustomTextField(
                              //   controller: model.passController,
                              //   hint: 'Password',
                              // ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.yellow.shade200,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.deepOrange.shade900,
                                    child: IconButton(
                                      onPressed: () => model
                                          .signInWithEmailAndPassword(context),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.yellow.shade200,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () => model.resetPass(
                                    context: context,
                                    email: model.emailController.text),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.yellow.shade200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : const Profile(),
    );
  }
}
