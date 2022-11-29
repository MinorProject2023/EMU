import 'package:demo_app/utils/get_user_data.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication.dart';
import '../provider/base_view.dart';
import '../view/profile_viewmodel.dart';

class GenerateBill extends StatelessWidget {
  const GenerateBill({Key? key}) : super(key: key);

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
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(60.0),
        //   child: AppBar(
        //     leading: Image.asset('assets/nitp.png'),
        //     title: const Text(
        //       "National Institute of Technology Patna",
        //       style: TextStyle(fontSize: 16),
        //     ),
        //     backgroundColor: Colors.deepOrange.shade900,
        //   ),
        // ),
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
                    'Drawer header',
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
        body: SingleChildScrollView(
          child: Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Image(
                //   image: const AssetImage('assets/emu_logo-removebg.png'),
                //   height: height * 0.2,
                // ),
                const Text(
                  'Electricity Bill',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 5,
                ),
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    table_row(model, 'Consumer Name', 'name'),
                    table_row(model, 'Address', 'address'),
                    table_row(model, 'Bill No.', 'bill_no'),
                    table_row(model, 'Mobile No.', 'mob'),
                    table_row(model, 'Email ID', 'email'),
                    table_row(model, 'Category of Connection', 'category'),
                    table_row(model, 'Meter Phase', 'phase'),
                    table_row(model, 'Sanction Load', 'sanction_load'),
                    table_row(model, 'Bill Date', 'bill_date'),
                    table_row(model, 'Due Date', 'due_date'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Meter Reading Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 5,
                ),
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    table_row(model, 'Meter No.', 'meter_no'),
                    table_row(model, "Present Reading", 'present_reading'),
                    table_row(model, 'Past Reading', 'past_reading'),
                    table_row(model, 'Unit Consumption', 'unit_consumption'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Energy Bill Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 5,
                ),
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    table_row(
                        model, 'Utility Charge @Rs. 6.66/unit(A)', 'ut_charge'),
                    table_row(model, 'DG Charge @Rs. 6% of energy charge(B)',
                        'dg_charge'),
                    table_row(
                        model,
                        'Fixed Demand Charge @Rs. 300/KW per month(C)',
                        'fix_charge'),
                    table_row(
                        model, 'Govt. Duty, Maintenance Charge, etc.(D)', '50'),
                    table_row(model, 'Total Amount(A+B+C+D)', 'total'),
                    table_row(
                        model, 'Outstanding Amount of Previous Bill(E)', 'due'),
                    table_row(model, 'Penalty @ 1.5% on E', 'penalty'),
                    table_row(model, 'Payable Amount till due date', 'e'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Important Instructions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 10,
                ),
                const listRow(
                  s1: '(i)',
                  s2: 'Total Bill Amount must be paid till due date, otherwise Penalty@1.5% of outstanding amount will be charged per month.',
                ),
                const listRow(
                    s1: '(ii)',
                    s2: 'The Amount of Energy Bill will be deducted from salary of concern employees each month.'),
                const listRow(
                    s1: '(iii)',
                    s2: 'Commercial Customers have required to make payment in below mentioned Institute Bank Account & submit the payment receipt'),
                const SizedBox(
                  height: 30,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: const [
                //     Text('Co-PI(EMU)'),
                //     Text('PI(EMU)'),
                //     Text('Registrar'),
                //   ],
                // ),
                const SizedBox(
                  height: 10,
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
      ),
    );
  }

  TableRow table_row(ProfileViewModel model, String s1, String s2) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(s1),
        ),
        GetUserName(
          model.uid,
          s2,
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class listRow extends StatelessWidget {
  final String s1;
  final String s2;
  const listRow({
    required this.s1,
    required this.s2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(s1),
        Expanded(
          child: Text(s2),
        ),
      ],
    );
  }
}
