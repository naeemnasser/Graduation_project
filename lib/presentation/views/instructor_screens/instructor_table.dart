import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:adaa/presentation/widgets/reusable_timetable.dart';
import 'package:flutter/material.dart';

class InstructorTimetable extends StatelessWidget {
  final List<TimetableEntry> instructorTimetable = [
    TimetableEntry(
      day: "Sunday",
      courseCode: "CS 432",
      courseName: "Software Engineering II",
      type: "L",
      place: "L1",
      Time: "13:00 - 14:15",
    ),
    TimetableEntry(
      day: "Sunday",
      courseCode: "CS 432",
      courseName: "Software Engineering II",
      type: "L",
      place: "L2",
      Time: "14:20 - 15:35",
    ),
    TimetableEntry(
      day: "Monday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "L",
      place: "L3",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Tuesday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "L",
      place: "L1",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Thursday",
      courseCode: "CS 421",
      courseName: "Distributed Systems",
      type: "L",
      place: "L2",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Thursday",
      courseCode: "CS 422",
      courseName: "AI",
      type: "L",
      place: "L3",
      Time: "10:30 - 11:45",
    ),
    TimetableEntry(
      day: "Wednesday",
      courseCode: "CS 421",
      courseName: "Distributed Systems",
      type: "L",
      place: "L2",
      Time: "11:00 - 12:15",
    ),
    TimetableEntry(
      day: "Wednesday",
      courseCode: "CS 422",
      courseName: "AI",
      type: "L",
      place: "L3",
      Time: "12:30 - 13:45",
    ),
    TimetableEntry(
      day: "Thursday",
      courseCode: "CS 313",
      courseName: "Computer Graphics",
      type: "L",
      place: "L2",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Thursday",
      courseCode: "CS 313",
      courseName: "Computer Graphics",
      type: "L",
      place: "L3",
      Time: "10:20 - 11:35",
    ),
  ];

  InstructorTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Instructor Timetable"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: ReusableTimetable(
          timetable: instructorTimetable,
          title: "Instructor Timetable",
          personRole: "Instructor",
          personName: "Dr. Hesham ElDeeb",
        ),
      ),
    );
  }
}
