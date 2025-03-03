import 'package:flutter/material.dart';

class InstructorSchedule extends StatefulWidget {
  const InstructorSchedule({Key? key}) : super(key: key);

  @override
  State<InstructorSchedule> createState() => _InstructorScheduleState();
}

class _InstructorScheduleState extends State<InstructorSchedule> {
  final List<String> days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
  ];

  final List<String> timeSlots = [
    '09:00 - 10:15',
    '10:20 - 11:35',
    '11:40 - 12:55',
    '13:00 - 14:15',
    '14:20 - 15:35',
  ];
  
  final List<String> instructors = [
    'Dr. Ahmed Mohamed',
    'Dr. Sarah Johnson',
    'Dr. Mohamed Ali',
    'Dr. Fatima Hassan',
    'Dr. John Smith',
    'Dr. Laila Omar',
    'Dr. Mark Wilson',
    'Dr. Aisha Mahmoud',
  ];
  
  String selectedInstructor = 'Dr. Ahmed Mohamed';

  // Sample schedule data for instructors
  Map<String, Map<String, List<Map<String, String>>>> instructorSchedules = {
    'Dr. Ahmed Mohamed': {
      'Monday': [
        {
          'code': 'CS101',
          'course': 'Intro to CS',
          'room': 'CS-101',
          'time': '09:00 - 10:15',
          'type': 'Lecture',
        }
      ],
      'Wednesday': [
        {
          'code': 'CS201',
          'course': 'Data Structures',
          'room': 'CS-201',
          'time': '11:40 - 12:55',
          'type': 'Lab',
        }
      ],
    },
    'Dr. Sarah Johnson': {
      'Tuesday': [
        {
          'code': 'ENG101',
          'course': 'English Language',
          'room': 'E-102',
          'time': '10:20 - 11:35',
          'type': 'Lecture',
        }
      ],
      'Thursday': [
        {
          'code': 'ENG201',
          'course': 'Academic Writing',
          'room': 'E-201',
          'time': '13:00 - 14:15',
          'type': 'Tutorial',
        }
      ],
    },
    'Dr. Mohamed Ali': {
      'Monday': [
        {
          'code': 'MATH101',
          'course': 'Calculus I',
          'room': 'M-101',
          'time': '10:20 - 11:35',
          'type': 'Lecture',
        }
      ],
      'Thursday': [
        {
          'code': 'MATH201',
          'course': 'Advanced Calculus',
          'room': 'M-301',
          'time': '13:00 - 14:15',
          'type': 'Tutorial',
        }
      ],
    },
    'Dr. Fatima Hassan': {
      'Sunday': [
        {
          'code': 'PHY101',
          'course': 'Physics I',
          'room': 'P-101',
          'time': '09:00 - 10:15',
          'type': 'Lecture',
        }
      ],
      'Wednesday': [
        {
          'code': 'PHY201',
          'course': 'Physics Lab',
          'room': 'P-Lab',
          'time': '14:20 - 15:35',
          'type': 'Lab',
        }
      ],
    },
    'Dr. John Smith': {
      'Monday': [
        {
          'code': 'CS102',
          'course': 'Programming I',
          'room': 'CS-102',
          'time': '13:00 - 14:15',
          'type': 'Lecture',
        }
      ],
      'Thursday': [
        {
          'code': 'CS202',
          'course': 'Algorithms',
          'room': 'CS-202',
          'time': '10:20 - 11:35',
          'type': 'Lab',
        }
      ],
    },
    'Dr. Laila Omar': {
      'Tuesday': [
        {
          'code': 'ENG102',
          'course': 'Technical Writing',
          'room': 'E-103',
          'time': '11:40 - 12:55',
          'type': 'Tutorial',
        }
      ],
      'Saturday': [
        {
          'code': 'ENG202',
          'course': 'Professional Communication',
          'room': 'E-202',
          'time': '09:00 - 10:15',
          'type': 'Lecture',
        }
      ],
    },
    'Dr. Mark Wilson': {
      'Sunday': [
        {
          'code': 'CS301',
          'course': 'Software Engineering',
          'room': 'CS-301',
          'time': '11:40 - 12:55',
          'type': 'Lecture',
        }
      ],
      'Wednesday': [
        {
          'code': 'CS401',
          'course': 'Project Management',
          'room': 'CS-401',
          'time': '09:00 - 10:15',
          'type': 'Tutorial',
        }
      ],
    },
    'Dr. Aisha Mahmoud': {
      'Saturday': [
        {
          'code': 'MATH102',
          'course': 'Statistics',
          'room': 'M-102',
          'time': '14:20 - 15:35',
          'type': 'Lecture',
        }
      ],
      'Tuesday': [
        {
          'code': 'MATH202',
          'course': 'Linear Algebra',
          'room': 'M-202',
          'time': '13:00 - 14:15',
          'type': 'Lab',
        }
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 2,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png", height: 40),
            SizedBox(width: 10),
            Text("MTI", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.blue),
            onPressed: () {
              // Show help dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Instructor Schedule Help'),
                  content: Text('This page shows the weekly schedule for the selected instructor. '
                      'You can select different instructors from the dropdown menu.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1000), // Limit width for larger screens
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Instructor Schedule',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInstructorSelector(),
                const SizedBox(height: 25),
                _buildInstructorInfo(),
                const SizedBox(height: 30),
                _buildScheduleTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructorSelector() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: Colors.blue.shade700),
            SizedBox(width: 10),
            Text(
              'Select Instructor:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
                color: Colors.blue.shade50,
              ),
              child: DropdownButton<String>(
                value: selectedInstructor,
                underline: SizedBox(),
                icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade700),
                style: TextStyle(color: Colors.blue.shade800, fontSize: 16),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedInstructor = newValue;
                    });
                  }
                },
                items: instructors.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructorInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700),
                SizedBox(width: 8),
                Text(
                  'Instructor Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildInfoRow('Name', selectedInstructor),
            _buildInfoRow('Department', 'Computer Science'),
            _buildInfoRow('Office', 'CS-203'),
            _buildInfoRow('Email', '${selectedInstructor.toLowerCase().replaceAll(' ', '.')}@example.com'),
            _buildInfoRow('Office Hours', 'Sunday & Tuesday: 12:00 - 14:00'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleTable() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, color: Colors.blue.shade700),
                const SizedBox(width: 10),
                Text(
                  'Weekly Schedule',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  border: TableBorder.all(
                    color: Colors.blue.shade100,
                    width: 1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: FixedColumnWidth(120), // First column width
                    for (int i = 0; i < timeSlots.length; i++)
                      i + 1: FixedColumnWidth(180), // Other columns
                  },
                  children: [
                    // Header row with time slots
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      children: [
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Day/Time',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ...timeSlots.map((time) => TableCell(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            alignment: Alignment.center,
                            child: Text(
                              time,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                    // Day rows
                    ...days.map((day) => TableRow(
                      decoration: BoxDecoration(
                        color: days.indexOf(day) % 2 == 0
                            ? Colors.grey.shade50
                            : Colors.white,
                      ),
                      children: [
                        // Day name cell
                        TableCell(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            alignment: Alignment.centerLeft,
                            color: Colors.blue.shade50,
                            child: Text(
                              day,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ),
                        ),
                        // Time slot cells for this day
                        ...timeSlots.map((time) => TableCell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            height: 120,
                            child: _buildScheduleCell(day, time),
                          ),
                        )),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.blue.withOpacity(0.1), 'Lecture'),
                const SizedBox(width: 20),
                _buildLegendItem(Colors.green.withOpacity(0.1), 'Lab'),
                const SizedBox(width: 20),
                _buildLegendItem(Colors.orange.withOpacity(0.1), 'Tutorial'),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Print the schedule
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.print, color: Colors.white),
                            SizedBox(width: 10),
                            Text('Printing instructor schedule...'),
                          ],
                        ),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.print),
                  label: Text('Print Schedule'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: color.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  Widget _buildScheduleCell(String day, String time) {
    // Get the instructor's schedule
    final instructorData = instructorSchedules[selectedInstructor];
    if (instructorData == null) {
      return Container(); // No data for this instructor
    }
    
    // Get schedule for this day
    final daySchedule = instructorData[day] ?? [];
    
    // Find if there's a course at this time
    final course = daySchedule.firstWhere(
      (c) => c['time'] == time,
      orElse: () => {},
    );
    
    if (course.isNotEmpty) {
      // Determine color based on course type
      Color bgColor;
      Color borderColor;
      IconData typeIcon;
      
      switch(course['type']?.toLowerCase() ?? '') {
        case 'lab':
          bgColor = Colors.green.withOpacity(0.1);
          borderColor = Colors.green.withOpacity(0.3);
          typeIcon = Icons.science;
          break;
        case 'tutorial':
          bgColor = Colors.orange.withOpacity(0.1);
          borderColor = Colors.orange.withOpacity(0.3);
          typeIcon = Icons.groups;
          break;
        case 'lecture':
        default:
          bgColor = Colors.blue.withOpacity(0.1);
          borderColor = Colors.blue.withOpacity(0.3);
          typeIcon = Icons.menu_book;
      }
      
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: borderColor),
                  ),
                  child: Text(
                    course['code'] ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Spacer(),
                Icon(typeIcon, size: 16, color: borderColor.withOpacity(0.8)),
              ],
            ),
            SizedBox(height: 6),
            Text(
              course['course'] ?? '',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey.shade700),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Room: ${course['room'] ?? ''}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor),
                ),
                child: Text(
                  course['type'] ?? '',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: borderColor.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.03),
        borderRadius: BorderRadius.circular(4),
      ),
    ); // Empty cell with subtle background
  }
}