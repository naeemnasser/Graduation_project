import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:flutter/material.dart';

class FollowUpTableScreen extends StatefulWidget {
  const FollowUpTableScreen({super.key});

  @override
  _FollowUpTableScreenState createState() => _FollowUpTableScreenState();
}

class _FollowUpTableScreenState extends State<FollowUpTableScreen> {
  String selectedDay = 'Monday'; // Default selected day
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Follow up',
        imagePath: 'assets/advisorylogostroke.png',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            // Make the entire screen scrollable
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: DropdownButton<String>(
                      value: selectedDay,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue!;
                        });
                      },
                      items: days.map<DropdownMenuItem<String>>((String day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // HeaderSection(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ministry of Higher Education',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Modern University for technology and information',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Faculty of computer science & Artificial Intelligence',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Semester: spring 2025',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10), // Add spacing
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'assets/mticslogo.jpg',
                        height: 150,
                        width: 230,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Thursday: Follow Up',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
                      child: FollowUpTable(),
                    ),
                  ),
                ),
                SizedBox(
                    height: 80), // Add spacing to avoid overlap with button
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20, // Align the button to the most left
            child: ElevatedButton(
              onPressed: () {
                // Handle submit action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Use blueAccent color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FollowUpTable extends StatefulWidget {
  @override
  _FollowUpTableState createState() => _FollowUpTableState();
}

class _FollowUpTableState extends State<FollowUpTable> {
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

  // Track checkbox states
  final List<List<bool>> checkboxStates = List.generate(
    12, // Number of rows
    (_) => List.generate(14, (_) => false), // 14 checkboxes per row
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
          columnSpacing: 10, // Reduce spacing between columns
          dataRowHeight: 40, // Reduce row height
          headingRowHeight: 45, // Reduce header row height
          columns: [
            DataColumn(
                label: Text('Code',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            DataColumn(
                label: Text('Course Title',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            DataColumn(
                label: Text('Instructor',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            DataColumn(
                label: Text('Place',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            DataColumn(
                label: Text('Time',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
            for (int i = 1; i <= 14; i++)
              DataColumn(
                  label: Text('$i',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12))),
          ],
          rows: tableData.asMap().entries.map(
            (entry) {
              int rowIndex = entry.key;
              return DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (rowIndex % 2 == 0) {
                      return Colors.grey.withOpacity(0.3); // even rows
                    }
                    return null; // odd rows
                  },
                ),
                cells: [
                  DataCell(Text(entry.value['Code']!,
                      style: TextStyle(fontSize: 12))),
                  DataCell(Text(entry.value['Course Title']!,
                      style: TextStyle(fontSize: 12))),
                  DataCell(Text(entry.value['Instructor']!,
                      style: TextStyle(fontSize: 12))),
                  DataCell(Text(entry.value['Place']!,
                      style: TextStyle(fontSize: 12))),
                  DataCell(Text(entry.value['Time']!,
                      style: TextStyle(fontSize: 12))),
                  for (int colIndex = 0; colIndex < 14; colIndex++)
                    DataCell(Checkbox(
                      value: checkboxStates[rowIndex][colIndex],
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxStates[rowIndex][colIndex] = value!;
                        });
                      },
                    )),
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
