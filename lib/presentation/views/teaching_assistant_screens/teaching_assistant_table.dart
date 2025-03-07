import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/widgets/reusable_timetable.dart';
import 'package:flutter/material.dart';

class TeachingAssistantTimetable extends StatelessWidget {
  final List<TimetableEntry> taTimetable = [
    TimetableEntry(
      day: "Sunday",
      courseCode: "CS 432",
      courseName: "Software Engineering II",
      type: "T",
      place: "S",
      Time: "13:00 - 14:15",
    ),
    TimetableEntry(
      day: "Sunday",
      courseCode: "CS 432",
      courseName: "Software Engineering II",
      type: "T",
      place: "S",
      Time: "14:20 - 15:35",
    ),
    TimetableEntry(
      day: "Monday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "T",
      place: "S",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Tuesday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "T",
      place: "S",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Wednesday",
      courseCode: "CS 413",
      courseName: "Computer Graphics",
      type: "T",
      place: "S",
      Time: "09:00 - 10:15",
    ),
  ];

  TeachingAssistantTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Teaching Assistant Timetable',
        imagePath: 'assets/advisorylogostroke.png',
      ),
      body: ReusableTimetable(
        timetable: taTimetable,
        title: "Teaching Assistant Timetable",
        personRole: "T.A",
        personName: "Eng. Amr Hassan",
      ),
    );
  }
}
