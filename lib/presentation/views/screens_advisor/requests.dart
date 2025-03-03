import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:adaa/presentation/views/screens_advisor/dashboard.dart';
import 'package:adaa/presentation/views/screens_advisor/pages/petition_requests.dart';
import 'package:adaa/presentation/views/screens_advisor/semester_info.dart';
import 'package:flutter/material.dart';

import '../profile/personal_profile.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SemesterInfoPage()),
            );
          },
        ),
        elevation: 1,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png",
                height: 40), // Replace with your logo
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SemesterInfoPage()),
                );
              },
              child: Text("Semester Info", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                // Already on requests page
              },
              child: Text("Requests", 
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text("Dashboard", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Logout", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: const PetitionRequests(),
    );
  }
}