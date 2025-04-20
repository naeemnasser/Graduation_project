import 'package:flutter/material.dart';

import '../../../item/app_bar_items_updated.dart';
import '../profile/personal_profile.dart';

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
      appBar: AppBarWidget(
        title: 'Student Timetable',
        imagePath: 'assets/advisorylogostroke.png',
        onProfileIconPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Semeter Of Spring 2025',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: Image.asset(
                    'assets/mticslogo.jpg', // Path to the image
                    height: 80,
                    width: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Choose Level Dropdown
                  Center(
                    child: Text(
                      'schedule of classes \n  Level 1 General',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  buildDaySection('Sunday', [
                    [
                      'Linear Algebra 1',
                      'Dr. Ahmed',
                      'S01',
                      'Lecture',
                      '10:00-12:00'
                    ],
                    ['Math 1', 'Dr. Salma', 'S02', 'Lecture', '12:00-2:00'],
                    [
                      'Linear Algebra 1',
                      'Dr. Alaa',
                      'Lab',
                      'Lab',
                      '12:00-2:00'
                    ],
                  ]),
                  buildDaySection('Monday', [
                    ['DSP', 'Dr. Said', 'S03', 'Lecture', '1:00-2:15'],
                    ['Math 1', 'Dr. Salma', 'S04', 'Section', '10:00-12:00'],
                    ['Math 1', 'Dr. Salma', 'S05', 'Section', '12:00-2:00'],
                  ]),
                  buildDaySection('Tuesday', [
                    ['Math 1', 'Dr. Salma', 'S06', 'Section', '10:00-12:00'],
                  ]),
                  buildDaySection('Wednesday', [
                    ['AI', 'Dr. Mohamed', 'S07', 'Lecture', '10:00-12:00'],
                    [
                      'Operating Systems',
                      'Dr. Sarah',
                      'S08',
                      'Lecture',
                      '12:00-2:00'
                    ],
                    ['Networks', 'Dr. John', 'S09', 'Lecture', '2:00-4:00'],
                  ]),
                  buildDaySection('Thursday', [
                    [
                      'Databases 1',
                      'Dr. Mohamed',
                      'S10',
                      'Lecture',
                      '10:00-12:00'
                    ],
                  ]),
                  buildNotesAndDeanSign(),
                ],
              ),
            ),
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildNotesAndDeanSign() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notes:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Please adhere to the schedule and timings.',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '- Attendance is mandatory for all lectures and labs.',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '- Contact your instructor for any clarifications.',
                style: TextStyle(fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Dean\'s Signature:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Prof. Dr. Mohamed Taher Elmayah',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                'Dean of Computer Science and AI',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
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
