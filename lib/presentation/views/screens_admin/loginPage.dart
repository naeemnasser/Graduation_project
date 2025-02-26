import 'package:adaa/presentation/views/home/homescreen.dart';
import 'package:adaa/presentation/views/instructor_screens/instructor_table.dart';
import 'package:adaa/presentation/views/financial_ffairs/financial_ffairs_view.dart';
import 'package:adaa/presentation/views/screens_admin/adminpage.dart';
import 'package:adaa/presentation/views/screens_student/scheduled_classes_screen.dart';
import 'package:adaa/presentation/views/student_affairs/Aplications.dart';

import 'package:flutter/material.dart';

import '../screens_advisor/semester_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String email = "admin";
  final String password = "1234";

  void login() {
    if (_emailController.text == email &&
        _passwordController.text == password) {
      // Navigate to Admin Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminDashboard()),
      );
    } else if (_emailController.text == "advisor" &&
        _passwordController.text == "1234") {
      // Navigate to Advisor Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SemesterInfoPage()),
      );
    } else if (_emailController.text == "saffirs" &&
        _passwordController.text == "1234") {
      // Navigate to Advisor Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ApplicationsPage()),
      );
    } else if (_emailController.text == "instructor" &&
        _passwordController.text == "1234") {
      // Navigate to Instructor Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InstructorTimetable()),
      );
    } else if (_emailController.text == "student" &&
        _passwordController.text == "1234") {
      // Navigate to Student Home Screen
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
    } else if (_emailController.text == "fi" &&
        _passwordController.text == "1234") {
      // Navigate to Advisor Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FinancialAffairsView()),
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
               backgroundColor: const Color.fromARGB(255, 128, 128, 128),
        elevation: 0.5,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png", height: 50),
            SizedBox(width: 10),
            Text(
              'ADAAP',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications, color: Colors.black54), onPressed: () {}),
          IconButton(icon: Icon(Icons.person, color: Colors.black54), onPressed: () {}),
          IconButton(icon: Icon(Icons.help_outline, color: Colors.black54), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/advisorylogostroke.png', // Replace with your MTI logo asset
                height: 100,
              ),
              SizedBox(height: 20),
              Container(
                width: 300, // Adjust the width as needed
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
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
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
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
                  // Function for forgot password
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
