import 'package:flutter/material.dart';

// Data class for timetable entries
class TimetableEntry {
  final String day;
  final String courseCode;
  final String courseName;
  final String type;
  final String place;
  final String oddTime;
  final String evenTime;

  TimetableEntry({
    required this.day,
    required this.courseCode,
    required this.courseName,
    required this.type,
    required this.place,
    required this.oddTime,
    required this.evenTime,
  });
}

class InstructorTimetable extends StatelessWidget {
  final List<TimetableEntry> timetable = [
    TimetableEntry(
        day: "Sunday",
        courseCode: "CS 432",
        courseName: "Software Engineering II",
        type: "L",
        place: "L3",
        oddTime: "13:00 - 14:15",
        evenTime: "13:00 - 14:15"),
    TimetableEntry(
        day: "Sunday",
        courseCode: "CS 432",
        courseName: "Software Engineering II",
        type: "L",
        place: "L3",
        oddTime: "14:20 - 15:35",
        evenTime: "14:20 - 15:35"),
    TimetableEntry(
        day: "Monday",
        courseCode: "CS 321",
        courseName: "Computer Architecture",
        type: "L",
        place: "L3",
        oddTime: "09:00 - 10:15",
        evenTime: "09:00 - 10:15"),
    TimetableEntry(
        day: "Tuesday",
        courseCode: "CS 321",
        courseName: "Computer Architecture",
        type: "L",
        place: "L3",
        oddTime: "09:00 - 10:15",
        evenTime: "09:00 - 10:15"),
    TimetableEntry(
        day: "Thursday",
        courseCode: "CS 413",
        courseName: "Computer Graphics",
        type: "L",
        place: "L3",
        oddTime: "09:00 - 10:15",
        evenTime: "09:00 - 10:15"),
    TimetableEntry(
        day: "Thursday",
        courseCode: "CS 413",
        courseName: "Computer Graphics",
        type: "L",
        place: "L3",
        oddTime: "10:20 - 11:35",
        evenTime: "10:20 - 11:35"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 233, 243),
        title: Text("Instructor Timetable"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instructor: Dr. Hesham ElDeeb",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: {
                0: FractionColumnWidth(0.15), // Day
                1: FractionColumnWidth(0.10), // Course Code
                2: FractionColumnWidth(0.25), // Course Name
                3: FractionColumnWidth(0.05), // Type
                4: FractionColumnWidth(0.10), // Place
                5: FractionColumnWidth(0.17), // Odd Time
                6: FractionColumnWidth(0.17), // Even Time
              },
              children: [
                // Table Header with Grey Background
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: [
                    _tableCell("Day", bold: true),
                    _tableCell("Course Code", bold: true),
                    _tableCell("Course", bold: true),
                    _tableCell("Type", bold: true),
                    _tableCell("Place", bold: true),
                    _tableCell("Odd Time", bold: true),
                    _tableCell("Even Time", bold: true),
                  ],
                ),
                // Table Data
                for (var entry in timetable)
                  TableRow(
                    children: [
                      _tableCell(entry.day),
                      _tableCell(entry.courseCode),
                      _tableCell(entry.courseName),
                      _tableCell(entry.type),
                      _tableCell(entry.place),
                      _tableCell(entry.oddTime),
                      _tableCell(entry.evenTime),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create table cells
  Widget _tableCell(String text, {bool bold = false}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style:
            TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}
