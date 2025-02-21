import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title:
              Text("MTI Academic App", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: LoginScreen(),
      ),
    );
  }
}
