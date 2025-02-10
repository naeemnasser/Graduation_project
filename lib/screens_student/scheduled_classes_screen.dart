import 'package:flutter/material.dart';

import '../screens_admin/loginPage.dart';

class ScheduledClassesScreen extends StatelessWidget {
  const ScheduledClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to Home
            },
          ),
          IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
              // Navigate to Dashboard
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to Our System
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to Notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to Profile
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Choose Level Dropdown
            Text(
              'Choose Level',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: ['Level 1', 'Level 2', 'Level 3', 'Level 4']
                  .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle level selection
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Level',
              ),
            ),
            SizedBox(height: 20),

            // Schedule Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Course Title')),
                    DataColumn(label: Text('Instructor')),
                    DataColumn(label: Text('Place')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Time')),
                  ],
                  rows: const [
                    // Sunday
                    DataRow(cells: [
                      DataCell(Text('Project')),
                      DataCell(Text('Supervisor')),
                      DataCell(Text('S/L')),
                      DataCell(Text('S/L')),
                      DataCell(Text('09:00-15:35')),
                    ]),
                    // Tuesday
                    DataRow(cells: [
                      DataCell(Text('Linear Algebra')),
                      DataCell(Text('Walid Basiony')),
                      DataCell(Text('L2')),
                      DataCell(Text('L')),
                      DataCell(Text('10:20-11:35')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('English')),
                      DataCell(Text('Rasha Saad')),
                      DataCell(Text('L1')),
                      DataCell(Text('L')),
                      DataCell(Text('11:40-12:55')),
                    ]),
                    // Wednesday
                    DataRow(cells: [
                      DataCell(Text('Logic Design')),
                      DataCell(Text('Esraa Ashraf')),
                      DataCell(Text('S8')),
                      DataCell(Text('Ex')),
                      DataCell(Text('09:00-10:15')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Intro to Programming')),
                      DataCell(Text('Dr. Hafez')),
                      DataCell(Text('L1')),
                      DataCell(Text('L')),
                      DataCell(Text('10:20-11:35')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Object Oriented I')),
                      DataCell(Text('Salma Elawady')),
                      DataCell(Text('S2')),
                      DataCell(Text('Ex')),
                      DataCell(Text('11:40-12:55')),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
