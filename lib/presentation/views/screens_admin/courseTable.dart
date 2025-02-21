import 'package:adaa/models/course.dart';
import 'package:flutter/material.dart';



class CourseTableScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(
      courseCode: 'CSC101',
      courseTitle: 'Introduction to Programming',
      courseLevel: 'Level 1',
      noOfLectures: 10,
      noOfSections: 5,
      noOfHours: 20,
      department: 'Computer Science',
      status: 'Active',
    ),
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Level')),
            DataColumn(label: Text('No. of Lectures')),
            DataColumn(label: Text('No. of Hours')),
            DataColumn(label: Text('No. of Sections')),
            DataColumn(label: Text('Department')),
            DataColumn(label: Text('Status')),
          ],
          rows: courses.map((course) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(course.courseTitle)),
                DataCell(Text(course.courseLevel)),
                DataCell(Text(course.noOfLectures.toString())),
                DataCell(Text(course.noOfHours.toString())),
                DataCell(Text(course.noOfSections.toString())),
                DataCell(Text(course.department)),
                DataCell(Text(course.status)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
