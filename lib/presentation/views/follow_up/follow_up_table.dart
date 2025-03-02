import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Ensures a light theme
      home: FollowUpTableScreen(),
    );
  }
}

class FollowUpTableScreen extends StatelessWidget {
  const FollowUpTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Folow up',
        imagePath: 'assets/advisorylogostroke.png',
      ),
      body: Column(
        children: [
          HeaderSection(),
          SizedBox(height: 10),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FollowUpTable(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Thursday Follow Up ',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Even Weeks',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class FollowUpTable extends StatelessWidget {
  final List<Map<String, String>> tableData = [
    {
      'Code': 'CS 362',
      'Course Title': 'Internet Technologies',
      'Instructor': 'Dr. Tarek Soliman',
      'Place': 'L3',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'CS 312',
      'Course Title': 'Algorithms and Data Structures',
      'Instructor': 'Abdel Rahim El Nageh',
      'Place': 'S2',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'BS 154',
      'Course Title': 'Mathematical Analysis II',
      'Instructor': 'Monira Abdel Fattah',
      'Place': 'S1',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'IS 442',
      'Course Title': 'Linear & Integer Programming',
      'Instructor': 'Dr. Walid Basiony',
      'Place': 'S7',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'CS 362',
      'Course Title': 'Internet Technologies',
      'Instructor': 'Dr. Tarek Soliman',
      'Place': 'L3',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'CS 312',
      'Course Title': 'Algorithms and Data Structures',
      'Instructor': 'Abdel Rahim El Nageh',
      'Place': 'S2',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'BS 154',
      'Course Title': 'Mathematical Analysis II',
      'Instructor': 'Monira Abdel Fattah',
      'Place': 'S1',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'IS 442',
      'Course Title': 'Linear & Integer Programming',
      'Instructor': 'Dr. Walid Basiony',
      'Place': 'S7',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'CS 362',
      'Course Title': 'Internet Technologies',
      'Instructor': 'Dr. Tarek Soliman',
      'Place': 'L3',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'BS 154',
      'Course Title': 'Mathematical Analysis II',
      'Instructor': 'Monira Abdel Fattah',
      'Place': 'S1',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'IS 442',
      'Course Title': 'Linear & Integer Programming',
      'Instructor': 'Dr. Walid Basiony',
      'Place': 'S7',
      'Time': '09:00 - 10:15'
    },
    {
      'Code': 'CS 362',
      'Course Title': 'Internet Technologies',
      'Instructor': 'Dr. Tarek Soliman',
      'Place': 'L3',
      'Time': '09:00 - 10:15'
    }
  ];

  @override
  Widget build(BuildContext context) {
    print('Building FollowUpTable');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Code',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Course Title',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Instructor',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Place',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Time',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('2', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('4', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('8', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('10', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('12', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label:
                    Text('14', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: tableData.asMap().entries.map(
            (entry) {
              print('Building row ${entry.key}');
              return DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (entry.key % 2 == 0) {
                      return Colors.grey.withOpacity(0.3); // even rows
                    }
                    return null; // odd rows
                  },
                ),
                cells: [
                  DataCell(Text(entry.value['Code']!)),
                  DataCell(Text(entry.value['Course Title']!)),
                  DataCell(Text(entry.value['Instructor']!)),
                  DataCell(Text(entry.value['Place']!)),
                  DataCell(Text(entry.value['Time']!)),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                ],
              );
            },
          ).toList(),
          border: TableBorder.all(color: Colors.black),
        ),
      ),
    );
  }
}
