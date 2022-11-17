import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String uid;
  final TextStyle style;
  final String para;
  const GetUserName(this.uid, this.para, this.style, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(uid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "Something went wrong",
            style: style,
          );
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text(
            "Document does not exist",
            style: style,
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          int present = int.parse(data['present_reading']);
          int past = int.parse(data['past_reading']);
          int x = present - past;
          double ut = 6.66 * x;
          double dg = ut * 0.06;
          int sanction_load = int.parse(data['sanction_load']);
          int fix_charge = 300 * sanction_load;
          double total = ut + dg + fix_charge + 50;
          double due = double.parse(data['due']);
          double penalty = 0.016 * due;
          double e = total + due + penalty;
          switch (para) {
            case 'name':
              return Text(
                "${data['name']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'address':
              return Text(
                "${data['address']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'bill_no':
              return Text(
                "${data['bill_no']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'mob':
              return Text(
                "${data['mob']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'email':
              return Text(
                "${data['email']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'category':
              return Text(
                "${data['category']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'phase':
              return Text(
                "${data['phase']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'sanction_load':
              return Text(
                "${data['sanction_load']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'bill_date':
              DateTime dt = (data['bill_date'] as Timestamp).toDate();
              String dateSlug =
                  "${dt.year.toString()}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
              return Text(
                dateSlug.toString(),
                textAlign: TextAlign.center,
                style: style,
              );
            case 'due_date':
              DateTime dt = (data['due_date'] as Timestamp).toDate();
              String dateSlug =
                  "${dt.year.toString()}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
              return Text(
                dateSlug.toString(),
                textAlign: TextAlign.center,
                style: style,
              );
            case 'meter_no':
              return Text(
                "${data['meter_no']}",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'present_reading':
              return Text(
                "$present",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'past_reading':
              return Text(
                "$past",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'unit_consumption':
              // int present = int.parse(data['present_reading']);
              // int past = int.parse(data['past_reading']);
              // int x = present - past;
              return Text(
                '$x',
                textAlign: TextAlign.center,
                style: style,
              );
            case 'ut_charge':
              // int present = int.parse(data['present_reading']);
              // int past = int.parse(data['past_reading']);
              // int x = present - past;
              // double ut = 6.66 * x;
              return Text(
                "$ut",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'dg_charge':
              // int present = int.parse(data['present_reading']);
              // int past = int.parse(data['past_reading']);
              // int x = present - past;
              // double ut = 6.66 * x * 0.06;
              return Text(
                "$dg",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'fix_charge':
              return Text(
                "$fix_charge",
                textAlign: TextAlign.center,
                style: style,
              );
            case '50':
              return Text(
                "50",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'total':
              return Text(
                "$total",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'due':
              return Text(
                "$due",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'penalty':
              return Text(
                "$penalty",
                textAlign: TextAlign.center,
                style: style,
              );
            case 'e':
              return Text(
                "$e",
                textAlign: TextAlign.center,
                style: style,
              );
            default:
              return Text(
                "Invalid",
                textAlign: TextAlign.center,
                style: style,
              );
          }
        }
        return const Text('loading');
      },
    );
  }
}
