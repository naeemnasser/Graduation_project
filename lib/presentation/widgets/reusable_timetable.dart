import 'package:flutter/material.dart';

// Data class for timetable entries
class TimetableEntry {
  final String day;
  final String courseCode;
  final String courseName;
  final String type;
  final String place;
  final String Time;

  TimetableEntry({
    required this.day,
    required this.courseCode,
    required this.courseName,
    required this.type,
    required this.place,
    required this.Time,
  });
}

/// A reusable timetable widget that can be used for both instructors and teaching assistants
class ReusableTimetable extends StatelessWidget {
  final List<TimetableEntry> timetable;
  final String title;
  final String personRole; // "Instructor" or "T.A"
  final String personName;

  const ReusableTimetable({
    super.key,
    required this.timetable,
    required this.title,
    required this.personRole,
    required this.personName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 233, 243),
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$personRole: $personName",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FractionColumnWidth(0.15), // Day
                1: FractionColumnWidth(0.10), // Course Code
                2: FractionColumnWidth(0.25), // Course Name
                3: FractionColumnWidth(0.05), // Type
                4: FractionColumnWidth(0.10), // Place
                5: FractionColumnWidth(0.17), // Odd Time
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
                    _tableCell("Time", bold: true),
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
                      _tableCell(entry.Time),
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
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style:
            TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}
