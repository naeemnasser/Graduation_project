import 'package:flutter/material.dart';

class DefaultScheduleScreen extends StatefulWidget {
  final int level;
  final int semester;

  const DefaultScheduleScreen({
    Key? key,
    required this.level,
    required this.semester,
  }) : super(key: key);

  @override
  _DefaultScheduleScreenState createState() => _DefaultScheduleScreenState();
}

class _DefaultScheduleScreenState extends State<DefaultScheduleScreen> {
  // List of days
  final List<String> days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday'
  ];

  // Map to store courses by day
  final Map<String, List<CourseEntry>> coursesByDay = {};

  // Sample course codes (replace with your actual data)
  final List<String> courseCodes = [
    'CS101',
    'CS102',
    'MATH101',
    'PHYS101',
    'ENG101'
  ];

  // Sample course titles (replace with your actual data)
  final Map<String, String> courseTitles = {
    'CS101': 'Introduction to Computer Science',
    'CS102': 'Programming Fundamentals',
    'MATH101': 'Calculus I',
    'PHYS101': 'Physics I',
    'ENG101': 'English Composition',
  };

  // Sample course types
  final List<String> courseTypes = ['Lecture', 'Lab', 'Tutorial'];
  
  // Predefined time slots
  final List<String> timeSlots = [
    '9:00 to 10:15',
    '10:20 to 11:35',
    '11:40 to 12:55',
    '13:00 to 14:15',
    '14:20 to 15:35',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize each day with one empty course entry
    for (String day in days) {
      coursesByDay[day] = [CourseEntry()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Enter Default Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveSchedule,
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          width: MediaQuery.of(context).size.width * 0.9, // Takes 90% of screen width
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Level and Semester information
              _buildLevelSemesterInfo(),
              const SizedBox(height: 20),

              // Days of the week with their courses
              ...days.map((day) => _buildDaySection(day)).toList(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelSemesterInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            'Level: ${widget.level}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 40),
          Text(
            'Semester: ${widget.semester}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySection(String day) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day header
            Text(
              day,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),

            // Course entries for this day
            ...coursesByDay[day]!.asMap().entries.map((entry) {
              int index = entry.key;
              CourseEntry courseEntry = entry.value;
              return _buildCourseEntryRow(day, courseEntry, index);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseEntryRow(String day, CourseEntry courseEntry, int index) {
    // Single row layout for all fields to make it responsive
    return Container(
      margin: EdgeInsets.only(bottom: index < coursesByDay[day]!.length - 1 ? 12.0 : 0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: index > 0 ? Border(top: BorderSide(color: Colors.grey.shade300)) : null,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Course Code dropdown
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Code', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                    ),
                    value: courseEntry.courseCode.isNotEmpty ? courseEntry.courseCode : null,
                    hint: const Text('Select'),
                    items: courseCodes.map((code) {
                      return DropdownMenuItem<String>(value: code, child: Text(code));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        courseEntry.courseCode = value ?? '';
                        if (courseTitles.containsKey(value)) {
                          courseEntry.courseTitle = courseTitles[value]!;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Course Title dropdown
            SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Title', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                    ),
                    value: courseEntry.courseTitle.isNotEmpty ? courseEntry.courseTitle : null,
                    hint: const Text('Select'),
                    items: courseTitles.values.map((title) {
                      return DropdownMenuItem<String>(
                        value: title,
                        child: Text(title, overflow: TextOverflow.ellipsis),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        courseEntry.courseTitle = value ?? '';
                        courseTitles.forEach((code, title) {
                          if (title == value) {
                            courseEntry.courseCode = code;
                          }
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Instructor field
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Instructor', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  TextFormField(
                    initialValue: courseEntry.instructor,
                    onChanged: (value) => courseEntry.instructor = value,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Place field
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Place', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  TextFormField(
                    initialValue: courseEntry.place,
                    onChanged: (value) => courseEntry.place = value,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Type dropdown
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Type', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                    ),
                    value: courseEntry.type.isNotEmpty ? courseEntry.type : null,
                    hint: const Text('Select'),
                    items: courseTypes.map((type) {
                      return DropdownMenuItem<String>(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        courseEntry.type = value ?? '';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Time dropdown
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Time', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      isDense: true,
                    ),
                    value: courseEntry.timeSlot.isNotEmpty ? courseEntry.timeSlot : null,
                    hint: const Text('Select Time'),
                    items: timeSlots.map((time) {
                      return DropdownMenuItem<String>(value: time, child: Text(time));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        courseEntry.timeSlot = value ?? '';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Add/Remove button
            IconButton(
              icon: Icon(
                index == coursesByDay[day]!.length - 1 ? Icons.add_circle : Icons.remove_circle,
                color: index == coursesByDay[day]!.length - 1 ? Colors.green : Colors.red,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  if (index == coursesByDay[day]!.length - 1) {
                    // Add new entry
                    coursesByDay[day]!.add(CourseEntry());
                  } else {
                    // Remove this entry
                    coursesByDay[day]!.removeAt(index);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _saveSchedule() {
    // Implement save functionality here
    // This would typically involve validating the data and sending it to a backend

    // For now, just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Schedule saved successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

// Class to hold course entry data
class CourseEntry {
  String courseCode = '';
  String courseTitle = '';
  String instructor = '';
  String place = '';
  String type = '';
  String timeSlot = '';

  CourseEntry({
    this.courseCode = '',
    this.courseTitle = '',
    this.instructor = '',
    this.place = '',
    this.type = '',
    this.timeSlot = '',
  });
}