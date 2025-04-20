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
        backgroundColor: Colors.grey[400],
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
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(60.0),
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
                      labelText: 'Course Name',
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
                      labelText: 'Credit hour',
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
                      labelText: 'Number of Sections',
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
                      labelText: 'Number of Lectures',
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
                  DropdownButtonFormField<int>(
                    value: 1,
                    decoration: InputDecoration(
                      labelText: 'Level',
                      border: OutlineInputBorder(),
                    ),
                    items: [1, 2, 3, 4].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      _courseLevelController.text = newValue.toString();
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a level';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: 'AI',
                    decoration: InputDecoration(
                      labelText: 'Department',
                      border: OutlineInputBorder(),
                    ),
                    items: ['AI', 'CS', 'IS'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      _departmentController.text = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a department';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: 'computer & AI',
                    decoration: InputDecoration(
                      labelText: 'College',
                      border: OutlineInputBorder(),
                    ),
                    items: ['computer & AI', 'PHArmacy', 'engineer']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      _departmentController.text = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a department';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.blue[900]!),
                    ),
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
                        print('New Course: $newCourse');

                        // Navigate back
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add Course',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
