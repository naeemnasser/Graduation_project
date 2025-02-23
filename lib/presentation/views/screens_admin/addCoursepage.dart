import 'package:adaa/models/course.dart';
import 'package:adaa/presentation/views/screens_admin/adminpage.dart';
import 'package:flutter/material.dart';

class AddCourseScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _courseCodeController = TextEditingController();
  final _courseTitleController = TextEditingController();
  final _courseLevelController = TextEditingController();
  final _noOfLecturesController = TextEditingController();
  final _noOfSectionsController = TextEditingController();
  final _noOfHoursController = TextEditingController();
  final _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminDashboard()),
            );
          },
        ),
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _courseCodeController,
                decoration: InputDecoration(
                  labelText: 'Course Code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter course code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _courseTitleController,
                decoration: InputDecoration(
                  labelText: 'Course Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter course title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _courseLevelController,
                decoration: InputDecoration(
                  labelText: 'Course Level',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter course level';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _noOfLecturesController,
                decoration: InputDecoration(
                  labelText: 'No of Lectures',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of lectures';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _noOfSectionsController,
                decoration: InputDecoration(
                  labelText: 'No of Sections',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of sections';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _noOfHoursController,
                decoration: InputDecoration(
                  labelText: 'No of Hours',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of hours';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _departmentController,
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter department';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create a new Course object
                    final newCourse = Course(
                      courseCode: _courseCodeController.text,
                      courseTitle: _courseTitleController.text,
                      courseLevel: _courseLevelController.text,
                      noOfLectures: int.parse(_noOfLecturesController.text),
                      noOfSections: int.parse(_noOfSectionsController.text),
                      noOfHours: int.parse(_noOfHoursController.text),
                      department: _departmentController.text,
                      status: 'Active',
                    );

                    // TODO: Save the course (e.g., to a database or state management)
                    print('New Course: $newCourse');

                    // Navigate back
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
