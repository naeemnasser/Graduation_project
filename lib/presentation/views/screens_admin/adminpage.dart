import 'package:adaa/presentation/views/screens_admin/addDepartment.dart';
import 'package:flutter/material.dart';

import '../profile/personal_profile.dart';
import 'addCoursepage.dart';
import 'loginPage.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300], // Changed to grey background
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.black), // Black icon for contrast
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          elevation: 1,
          title: Row(
            children: [
              Image.asset("assets/advisorylogostroke.png",
                  height: 40), // Replace with your logo
              SizedBox(width: 10),
              Text("Dashboard",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              SizedBox(width: 20),
              Container(
                height: 20,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              SizedBox(width: 20),
              Text("Requests",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Text("Logout",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {}),
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            IconButton(
                icon: Icon(Icons.help_outline, color: Colors.black),
                onPressed: () {}),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Courses',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Code',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Level',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('No of Lectures',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('No of Sections',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('No of Hours',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Department',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Status',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('CS101')),
                      DataCell(Text('Intro to Computer Science')),
                      DataCell(Text('1')),
                      DataCell(Text('30')),
                      DataCell(Text('10')),
                      DataCell(Text('3')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('Active')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('MATH202')),
                      DataCell(Text('Calculus II')),
                      DataCell(Text('2')),
                      DataCell(Text('25')),
                      DataCell(Text('8')),
                      DataCell(Text('3')),
                      DataCell(Text('Mathematics')),
                      DataCell(Text('Active')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('ENG101')),
                      DataCell(Text('English Language 1')),
                      DataCell(Text('1')),
                      DataCell(Text('20')),
                      DataCell(Text('5')),
                      DataCell(Text('2')),
                      DataCell(Text('Languages')),
                      DataCell(Text('Inactive')),
                    ]),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCourseScreen()),
                      );
                      // Add your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0d6efd), // Button color
                      padding: EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 12), // Increased width by 10 px
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Sharp corners
                      ),
                    ),
                    child: Text(
                      'Add Course',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text('Departments',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Code',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Status',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('CS')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('Active')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('MATH')),
                      DataCell(Text('Mathematics')),
                      DataCell(Text('Active')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('ENG')),
                      DataCell(Text('Languages')),
                      DataCell(Text('Inactive')),
                    ]),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddDepartmentScreen()),
                      );
                      // Add your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0d6efd), // Button color
                      padding: EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 12), // Increased width by 10 px
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Sharp corners
                      ),
                    ),
                    child: Text(
                      'Add Department',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
