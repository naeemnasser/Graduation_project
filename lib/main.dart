import 'package:adaa/screens/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("MTI Academic Website",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: LoginScreen(),
      ),
    );
  }
}
