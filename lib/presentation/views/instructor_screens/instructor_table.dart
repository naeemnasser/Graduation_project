import 'package:adaa/presentation/widgets/reusable_timetable.dart';
import 'package:flutter/material.dart';

class InstructorTimetable extends StatelessWidget {
  final List<TimetableEntry> instructorTimetable = [
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

  InstructorTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableTimetable(
      timetable: instructorTimetable,
      title: "Instructor Timetable",
      personRole: "Instructor",
      personName: "Dr. Hesham ElDeeb",
    );
  }
}
