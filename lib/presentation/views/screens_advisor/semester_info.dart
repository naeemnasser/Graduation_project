import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:adaa/presentation/views/screens_advisor/dashboard.dart';
import 'package:adaa/presentation/views/screens_advisor/requests.dart';
import 'package:flutter/material.dart';

import '../profile/personal_profile.dart';

class SemesterInfoPage extends StatefulWidget {
  const SemesterInfoPage({Key? key}) : super(key: key);

  @override
  State<SemesterInfoPage> createState() => _SemesterInfoPageState();
}

class _SemesterInfoPageState extends State<SemesterInfoPage> {
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController timeSlotController = TextEditingController();

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
              child: Text("Semester Info",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome at the top and centered
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: Center(
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // The rest of the screen as a Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'We are now in ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Spring 2025!',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            Text('Enter number of students for each level',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            // 6 input fields instead of labels
                            SizedBox(height: 12),
                            // For each input, wrap with Container for width and background
                            Container(
                              width: double.infinity,
                              constraints:
                                  BoxConstraints(minWidth: 150, maxWidth: 700),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2), // reduced vertical padding
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Level 1',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal:
                                          12), // reduced vertical content padding
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                  minWidth: 150,
                                  maxWidth: 700), // Increased width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2), // reduced vertical padding
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Level 2',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal:
                                          12), // reduced vertical content padding
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                  minWidth: 150,
                                  maxWidth: 700), // Increased width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2), // reduced vertical padding
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Level 3 CS',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal:
                                          12), // reduced vertical content padding
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                  minWidth: 150,
                                  maxWidth: 700), // Increased width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2), // reduced vertical padding
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Level 3 IS',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal:
                                          12), // reduced vertical content padding
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              constraints: BoxConstraints(
                                  minWidth: 150,
                                  maxWidth: 700), // Increased width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2), // reduced vertical padding
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Level 4 CS',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal:
                                          12), // reduced vertical content padding
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                  minWidth: 150,
                                  maxWidth: 700), // Increased width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2), // reduced vertical padding
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Level 4 IS',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal:
                                          12), // reduced vertical content padding
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            // Add department button
                            SizedBox(
                              width: 200,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[700],
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                ),
                                child: const Text('Add department',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ),
                            ),
                            SizedBox(height: 2),
                            // Text field

                            // Time slot label
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Enter time slot for each department.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' e.g. 5 slots',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Time slot text field
                            TextField(
                              controller: timeSlotController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Time slot',
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'click to',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' Generate ',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'the student schedules and',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ' instructor/teaching Assistant schedules.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Generate Schedules button
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: SizedBox(
                                width: 200,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                  ),
                                  child: const Text('Generate Schedules',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right side: Big image
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Image.asset(
                          'assets/photostudent.jpg',
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
