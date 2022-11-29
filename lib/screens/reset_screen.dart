import 'package:flutter/material.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Message'),
        backgroundColor: Colors.deepOrange.shade900,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Text(
            'Reset mail sent to your mail. Please check your inbox or spam.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.deepOrange.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
