import 'package:adaa/presentation/views/screens_advisor/semester_info.dart';
import 'package:flutter/material.dart';

class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SemesterInfoPage()),
            );
          },
        ),
        title: Text('Requests'),
      ),
      body: Center(
        child: Text('Requests'),
      ),
    );
  }
}
