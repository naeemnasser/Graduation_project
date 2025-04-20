import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/widgets/reusable_timetable.dart';
import 'package:flutter/material.dart';

class TeachingAssistantTimetable extends StatelessWidget {
  final List<TimetableEntry> taTimetable = [
    TimetableEntry(
      day: "Sunday",
      courseCode: "CS 432",
      courseName: "Software Engineering II",
      type: "EX",
      place: "S01",
      Time: "13:00 - 14:15",
    ),
    TimetableEntry(
      day: "Sunday",
      courseCode: "CS 432",
      courseName: "Software Engineering II",
      type: "EX/Lab",
      place: "S02",
      Time: "14:20 - 15:35",
    ),
    TimetableEntry(
      day: "Monday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "EX",
      place: "S03",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Monday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "EX/Lab",
      place: "S04",
      Time: "10:15 - 11:35",
    ),
    TimetableEntry(
      day: "Tuesday",
      courseCode: "CS 421",
      courseName: "Distributed Systems",
      type: "EX",
      place: "S05",
      Time: "09:00 - 10:15",
    ),
    TimetableEntry(
      day: "Tuesday",
      courseCode: "CS 321",
      courseName: "Computer Architecture",
      type: "EX/Lab",
      place: "S06",
      Time: "10:15 - 11:35",
    ),
    TimetableEntry(
      day: "Tuesday",
      courseCode: "CS 421",
      courseName: "AI",
      type: "EX",
      place: "Lab",
      Time: "11:35 - 12:50",
    ),
    TimetableEntry(
      day: "Wednesday",
      courseCode: "CS 421",
      courseName: "AI",
      type: "EX/Lab",
      place: "S07",
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
