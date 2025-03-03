import 'package:flutter/material.dart';

class AdvisorResult extends StatelessWidget {
  const AdvisorResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This would be fetched from an API in a real app
    final Map<String, dynamic> resultData = {
      'studentName': 'Ahmed Ali',
      'studentId': 'ST12345',
      'gpa': 3.75,
      'level': 3,
      'department': 'Computer Science',
      'semester': 'Fall 2025',
      'courses': [
        {
          'code': 'CS101',
          'name': 'Intro to Computer Science',
          'grade': 'A',
          'points': 4.0,
          'credits': 3,
        },
        {
          'code': 'MATH201',
          'name': 'Calculus I',
          'grade': 'B+',
          'points': 3.5,
          'credits': 3,
        },
        {
          'code': 'ENG101',
          'name': 'English Language 1',
          'grade': 'A-',
          'points': 3.7,
          'credits': 2,
        },
        {
          'code': 'PHY101',
          'name': 'Physics I',
          'grade': 'B',
          'points': 3.0,
          'credits': 4,
        },
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Results'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStudentInfo(resultData),
            const SizedBox(height: 20),
            _buildResultsTable(resultData),
            const SizedBox(height: 20),
            _buildGPASummary(resultData),
            const SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfo(Map<String, dynamic> data) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Name', data['studentName']),
            _buildInfoRow('ID', data['studentId']),
            _buildInfoRow('Department', data['department']),
            _buildInfoRow('Level', 'Level ${data['level']}'),
            _buildInfoRow('Semester', data['semester']),
            _buildInfoRow('GPA', data['gpa'].toString()),
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
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildResultsTable(Map<String, dynamic> data) {
    final courses = data['courses'] as List;
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Results',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                columns: const [
                  DataColumn(label: Text('Code')),
                  DataColumn(label: Text('Course Name')),
                  DataColumn(label: Text('Credits')),
                  DataColumn(label: Text('Grade')),
                  DataColumn(label: Text('Points')),
                ],
                rows: courses.map<DataRow>((course) {
                  return DataRow(
                    cells: [
                      DataCell(Text(course['code'])),
                      DataCell(Text(course['name'])),
                      DataCell(Text(course['credits'].toString())),
                      DataCell(Text(course['grade'])),
                      DataCell(Text(course['points'].toString())),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGPASummary(Map<String, dynamic> data) {
    final courses = data['courses'] as List;
    double totalCredits = 0;
    double totalPoints = 0;
    
    for (var course in courses) {
      totalCredits += course['credits'] as double;
      totalPoints += (course['points'] as double) * (course['credits'] as double);
    }
    
    final gpa = totalPoints / totalCredits;
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GPA Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Total Credits', totalCredits.toString()),
            _buildInfoRow('Total Points', totalPoints.toStringAsFixed(2)),
            _buildInfoRow('Semester GPA', gpa.toStringAsFixed(2)),
            _buildInfoRow('Cumulative GPA', data['gpa'].toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Download results functionality
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Downloading results...')),
            );
          },
          icon: const Icon(Icons.download),
          label: const Text('Download Results'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Share results functionality
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sharing results...')),
            );
          },
          icon: const Icon(Icons.share),
          label: const Text('Share Results'),
        ),
      ],
    );
  }
}