import 'package:flutter/material.dart';

import 'loginPage.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
            IconButton(icon: Icon(Icons.help_outline), onPressed: () {}),
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
                    // Add your DataRow items here
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
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
                    // Add your DataRow items here
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
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
