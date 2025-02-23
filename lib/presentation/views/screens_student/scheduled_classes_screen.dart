import 'package:adaa/presentation/views/profile/personal_profile.dart';
import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:flutter/material.dart';

class ScheduledClassesScreen extends StatelessWidget {
  const ScheduledClassesScreen(
      {super.key,
      required this.courseTitle,
      required this.instructor,
      required this.place,
      required this.type,
      required this.time});
  final String courseTitle;
  final String instructor;
  final String place;
  final String type;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MTI Academic Website'),
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
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Choose Level Dropdown
            Center(
              child: Text(
                'Level...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            buildDaySection('Sunday', [
              [
                'Linear Algebra 1',
                'Dr. Ahmed',
                'C2.1',
                'Lecture',
                '10:00-12:00'
              ],
              ['Math 1', 'Dr. Salma', 'C2.2', 'Lecture', '12:00-2:00'],
              ['Linear Algebra 1', 'Dr. Alaa', 'L1', 'L', '12:00-2:00'],
            ]),
            buildDaySection('Monday', [
              ['dsp', 'Dr. said', 'L3', 'Lecture', '1:00-2:15'],
              ['Math1', 'Dr. Salma', 'Sec 1', 'S', '10:00-12:00'],
              ['Math1', 'Dr. Salma', 'Sec 5', 'S', '12:00-2:00'],
            ]),
            buildDaySection('Tuesday', [
              ['Math1', 'Dr. Salma', 'Sec 1', 'S', '10:00-12:00'],
            ]),
            buildDaySection('Wednesday', [
              ['AI', 'Dr. Mohamed', 'L3', 'Lecture', '10:00-12:00'],
              ['Operating Systems', 'Dr. Sarah', 'L2', 'Lecture', '12:00-2:00'],
              ['Networks', 'Dr. John', 'L1', 'Lecture', '2:00-4:00'],
            ]),
            buildDaySection('Thursday', [
              ['Databases 1', 'Dr. Mohamed', 'L3', 'Lecture', '10:00-12:00'],
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildDaySection(String day, List<List<String>> courses) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              day,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 800,
            height: 150,
            child: Center(
              child: Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(180.0),
                  1: FixedColumnWidth(180.0),
                  2: FixedColumnWidth(180.0),
                  3: FixedColumnWidth(180.0),
                  4: FixedColumnWidth(180.0),
                  5: FixedColumnWidth(180.0),
                },
                children: [
                  TableRow(
                    children: [
                      buildTableCell('Course Title', isHeader: true),
                      buildTableCell('Instructor', isHeader: true),
                      buildTableCell('Place', isHeader: true),
                      buildTableCell('Type', isHeader: true),
                      buildTableCell('Time', isHeader: true),
                    ],
                  ),
                  ...courses.map((course) {
                    return TableRow(
                      children:
                          course.map((data) => buildTableCell(data)).toList(),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTableCell(String text, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isHeader
            ? Colors.grey[400]
            : Colors.transparent, // Apply color only to headers
        border: Border.all(color: Colors.black), // Ensure border consistency
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
