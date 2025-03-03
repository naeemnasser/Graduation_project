import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:adaa/presentation/views/screens_advisor/dashboard.dart';
import 'package:adaa/presentation/views/screens_advisor/pages/default_schedule_screen.dart';
import 'package:adaa/presentation/views/screens_advisor/requests.dart';
import 'package:flutter/material.dart';

import '../profile/personal_profile.dart';

class SemesterInfoPage extends StatefulWidget {
  const SemesterInfoPage({Key? key}) : super(key: key);

  @override
  State<SemesterInfoPage> createState() => _SemesterInfoPageState();
}

class _SemesterInfoPageState extends State<SemesterInfoPage> {
  String? selectedList;
  String? selectedSemester;
  String? selectedLevel;

  final Map<String, bool> courseSelections = {
    'English Language 1': false,
    'English Language 2': false,
    'Intro to Computer Science': false,
    'Physics': false,
    'Mathematics 1': false,
    'Programming 1': false,
    'Ethics & Human Rights': false,
    'Academic English': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
        elevation: 1,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png",
                height: 40), // Replace with your logo
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SemesterInfoPage()),
                );
              },
              child: Text("Semester Info",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Requests()),
                );
              },
              child: Text("Requests", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text("Dashboard", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Logout", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome!',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Choose List',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                        ),
                        value: selectedList,
                        items: ['2013', '2016', '2020'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedList = value;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Choose Semester',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                        ),
                        value: selectedSemester,
                        items: ['Fall', 'Spring', 'Summer'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedSemester = value;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Choose Level',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                        ),
                        value: selectedLevel,
                        items: ['1', '2', '3', '4'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLevel = value;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      Text('Choose Course',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Expanded(
                        child: ListView(
                          children: courseSelections.keys.map((String course) {
                            return CheckboxListTile(
                              title: Text(course),
                              value: courseSelections[course],
                              onChanged: (bool? value) {
                                setState(() {
                                  courseSelections[course] = value ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Color(0xFF0d6efd),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: _anyCoursesSelected()
                              ? _navigateToSchedule
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF0d6efd), // Custom blue color
                            padding: EdgeInsets.symmetric(
                                horizontal: 44,
                                vertical: 16), // Custom padding for button
                            disabledBackgroundColor: Colors.grey,
                          ),
                          child: Text('Next',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/advisorylogostroke.png',
                      height: 300,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Academic Advising System',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0d6efd),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Select your preferences to create a semester schedule',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _anyCoursesSelected() {
    return courseSelections.values.any((selected) => selected);
  }

  void _navigateToSchedule() {
    List<String> selectedCourses = [];
    courseSelections.forEach((course, selected) {
      if (selected) {
        selectedCourses.add(course);
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DefaultScheduleScreen(
          level: 4, semester: 2,
          // selectedCourses: selectedCourses,
          // selectedList: selectedList,
          // selectedLevel: selectedLevel,
          // selectedSemester: selectedSemester,
        ),
      ),
    );
  }
}
