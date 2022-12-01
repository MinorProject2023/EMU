import 'package:demo_app/authentication/authentication.dart';
import 'package:demo_app/provider/base_view.dart';
import 'package:demo_app/utils/get_user_data.dart';
import 'package:demo_app/view/profile_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BaseView<ProfileViewModel>(
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) => Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade900,
          leading: const Image(
            image: AssetImage('assets/nitp.png'),
          ),
          title: const Text('EMU NITP'),
          actions: [
            IconButton(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
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
        drawer: Container(
          width: width * 0.75,
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.deepOrange.shade900),
                ),
                ListTile(
                  title: const Text(
                    'Add consumer',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/addConsumer');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Update meter reading',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/updateReading');
                  },
                ),
              ],
            ),
          ),
        ),
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
          child: Center(
            child: FirebaseAuth.instance.currentUser == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Successfully Signed Out',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
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
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image:
                              const AssetImage('assets/emu_logo-removebg.png'),
                          height: height * 0.2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   height: 60,
                        //   width: 60,
                        //   decoration: const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //         image: AssetImage('assets/profile.png'),
                        //         fit: BoxFit.cover),
                        //   ),
                        // ),
                        Row(
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
                            Container(
                              width: width * 0.7,
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.blue),
                                  bottom: BorderSide(color: Colors.blue),
                                ),
                              ),
                              child: GetUserName(
                                model.uid,
                                'name',
                                const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, right: 5),
                          child: Table(
                            border: TableBorder.all(color: Colors.white),
                            children: [
                              table_row(
                                  model.uid, 'Consumer ID', 'consumer_id'),
                              table_row(model.uid, 'Address', 'address'),
                              table_row(model.uid, 'Category', 'category'),
                              table_row(model.uid, 'Bill No.', 'bill_no'),
                              table_row(model.uid, 'Bill Date', 'bill_date'),
                              table_row(model.uid, 'Due Date', 'due_date'),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/generate_bill');
                          },
                          child: const Text('Generate Bill'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange.shade900),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Direct Pay'),
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

class profile_row extends StatelessWidget {
  final String s1;
  final String s2;
  final String uid;
  const profile_row({
    required this.s1,
    required this.s2,
    required this.uid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(
        top: 3,
        bottom: 3,
      ),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.white),
          top: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            s1,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.white,
          ),
          GetUserName(
            uid,
            s2,
            const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

TableRow table_row(String uid, String s1, String s2) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          s1,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetUserName(
          uid,
          s2,
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}
