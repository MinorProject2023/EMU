import 'package:demo_app/authentication/authentication.dart';
import 'package:demo_app/provider/base_view.dart';
import 'package:demo_app/utils/get_user_data.dart';
import 'package:demo_app/view/profile_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade900,
          title: Text('EMU NITP'),
          actions: [
            // TextButton(
            //   onPressed: () {
            //     AuthenticationHelper().signOut();
            //     Navigator.popAndPushNamed(context, '/login');
            //   },
            //   child: const Text(
            //     'Sign Out',
            //     style: TextStyle(fontSize: 25, color: Colors.white),
            //   ),
            // ),
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Drawer header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: FirebaseAuth.instance.currentUser == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Successfully Signed Out',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
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
                    // Text(
                    //   'Welcome ' + model.name,
                    //   style: const TextStyle(
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
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
                    GetUserName(
                      model.uid,
                      'name',
                      const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: <Widget>[
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         "Current Bill",
                    //         style: TextStyle(color: Colors.white, fontSize: 20),
                    //       ),
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         "Past Bill",
                    //         style: TextStyle(color: Colors.white, fontSize: 20),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/generate_bill');
                      },
                      child: Text('Generate Bill'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange.shade900),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Pay'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange.shade900),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
