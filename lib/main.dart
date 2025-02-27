import 'package:adaa/presentation/views/home/homescreen.dart';
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
      // Set the theme to light
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
