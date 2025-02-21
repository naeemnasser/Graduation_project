import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/presentation/views/screens_student/scheduled_classes_screen.dart
import '../../../model/tableitem.dart';
=======
>>>>>>> 36108923e79747e9297a74dbdb28f1b6216c3944:lib/screens_student/scheduled_classes_screen.dart
import '../screens_admin/loginPage.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Choose Level Dropdown
            Text(
              'Level...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            buildDaySection('Tuesday', [
              ['Math1', 'Dr. Salma', 'Sec 1', 'S', '10:00-12:00'],
            ]),
            buildDaySection('Wednesday', [
              ['AI', 'Dr. Mohamed', 'L3', 'Lecture', '10:00-12:00'],
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
          Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FixedColumnWidth(220.0),
              1: FixedColumnWidth(220.0),
              2: FixedColumnWidth(220.0),
              3: FixedColumnWidth(220.0),
              4: FixedColumnWidth(220.0),
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
                  children: course.map((data) => buildTableCell(data)).toList(),
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
