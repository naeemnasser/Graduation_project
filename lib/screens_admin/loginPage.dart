import 'package:adaa/screens_admin/adminpage.dart';
import 'package:adaa/screens_advisor/Advisor_home.dart';
import 'package:flutter/material.dart';

import '../screens_student/scheduled_classes_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String email = "admin";
  final String pasword = "admin";

  void login() {
    if (_emailController.text == email && _passwordController.text == pasword) {
      // Navigate to Admin Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminScreen()),
      );
    } else if (_emailController.text == "advisor" &&
        _passwordController.text == "advisor") {
      // Navigate to Advisor Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdvisorScreen()),
      );
    } else if (_emailController.text == "student" &&
        _passwordController.text == "student") {
      // Navigate to Advisor Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ScheduledClassesScreen(
                courseTitle: '',
                instructor: '',
                place: '',
                type: '',
                time: '')),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image.png', // Replace with your MTI logo asset
                height: 100,
              ),
              SizedBox(height: 20),
              Container(
                width: 300, // Adjust the width as needed
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your mail',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300, // Adjust the width as needed
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Text("Save Password"),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue[900]),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                onPressed: login,
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // الفانكشن تبع نسيت الباس
                },
                child: Text("Forgot Password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
