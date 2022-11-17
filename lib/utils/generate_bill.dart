import 'package:demo_app/utils/get_user_data.dart';
import 'package:flutter/material.dart';

import '../provider/base_view.dart';
import '../view/profile_viewmodel.dart';

class GenerateBill extends StatelessWidget {
  const GenerateBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            leading: Image.asset('assets/nitp.png'),
            title: const Text(
              "National Institute of Technology Patna",
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.deepOrange.shade900,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Co-PI(EMU)'),
                  Text('PI(EMU)'),
                  Text('Registrar'),
                ],
              ),
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
