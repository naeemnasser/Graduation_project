import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:adaa/presentation/views/screens_advisor/dashboard.dart';
import 'package:adaa/presentation/views/screens_advisor/requests.dart';
import 'package:flutter/material.dart';

class SemesterInfoPage extends StatelessWidget {
  const SemesterInfoPage({super.key});

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
              MaterialPageRoute(builder: (context) => DashboardPage()),
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
              child:
                  Text("Semester Info", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Requests()),
                );
              },
              child: Text("Requests", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text("Dashboard",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome!',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Choose List'),
                    items: ['2013', '2016', '2020'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Choose Semester'),
                    items: ['Fall', 'Spring', 'Summer'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Choose Level'),
                    items: ['1', '2', '3', '4'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  SizedBox(height: 10),
                  Text('Choose Course', style: TextStyle(fontSize: 16)),
                  CheckboxListTile(
                    title: Text('English Language 1'),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: Text('English Language 2'),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: Text('Intro to Computer Science'),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: Text('Physics'),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0d6efd), // Custom blue color
                        padding: EdgeInsets.symmetric(
                            horizontal: 44,
                            vertical: 22), // Custom padding for button
                      ),
                      child: Text('Next',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/advisorylogostroke.png', // Replace with your image file
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
