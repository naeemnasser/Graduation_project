import 'package:flutter/material.dart';

// Assessment options enum for type safety
enum AssessmentLevel { moreThanAcceptable, acceptable, weak, veryWeak }

class ResultInfo extends StatefulWidget {
  const ResultInfo({Key? key}) : super(key: key);
  @override
  State<ResultInfo> createState() => _ResultInfoState();
}

class _ResultInfoState extends State<ResultInfo> {
  // Centralized state management
  final Map<String, bool> errorState = {
    'yes': false,
    'no': true,
  };

  // Define missing state variables
  bool isErrorYesChecked = false;
  bool isErrorNoChecked = true;
  bool isGradeAppliedChecked = false;
  bool isGradeNotAppliedChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Result'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Student Information
                  const Text(
                    'Student Name: Naeem Nasser',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Subject: Numerical',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Attendance and Grades Table
                  DataTable(
                    columnSpacing: 16.0,
                    dataRowHeight: 350,
                    columns: const [
                      DataColumn(label: Text('Error in Correction')),
                      DataColumn(
                          label:
                              Text('Grade Application for Submitted Record')),
                      DataColumn(label: Text('Year Work Assessment')),
                      DataColumn(label: Text('Partical Exam Assessment')),
                      DataColumn(label: Text('Final Exam Assessment')),
                      DataColumn(label: Text('Total Grade')),
                      DataColumn(label: Text('Final Grade')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            _buildCheckboxColumn(
                              labels: ['Yes', 'No'],
                              values: [isErrorYesChecked, isErrorNoChecked],
                              onChanged: (index, value) {
                                setState(() {
                                  if (index == 0) {
                                    isErrorYesChecked = value;
                                    isErrorNoChecked = !value;
                                  } else {
                                    isErrorNoChecked = value;
                                    isErrorYesChecked = !value;
                                  }
                                });
                              },
                            ),
                          ),
                          DataCell(
                            _buildCheckboxColumn(
                              labels: ['Applied', 'Not Applied'],
                              values: [
                                isGradeAppliedChecked,
                                isGradeNotAppliedChecked
                              ],
                              onChanged: (index, value) {
                                setState(() {
                                  if (index == 0) {
                                    isGradeAppliedChecked = value;
                                    isGradeNotAppliedChecked = !value;
                                  } else {
                                    isGradeNotAppliedChecked = value;
                                    isGradeAppliedChecked = !value;
                                  }
                                });
                              },
                            ),
                          ),
                          DataCell(
                            _buildAssessmentColumn(),
                          ),
                          DataCell(
                            _buildAssessmentColumn(),
                          ),
                          DataCell(
                            _buildAssessmentColumn(),
                          ),
                          DataCell(
                            _buildCheckboxColumn(
                              labels: ['Corrected', 'Incorrect'],
                              values: [
                                isGradeAppliedChecked,
                                isGradeNotAppliedChecked
                              ],
                              onChanged: (index, value) {
                                setState(() {
                                  if (index == 0) {
                                    isGradeAppliedChecked = value;
                                    isGradeNotAppliedChecked = !value;
                                  } else {
                                    isGradeNotAppliedChecked = value;
                                    isGradeAppliedChecked = !value;
                                  }
                                });
                              },
                            ),
                          ),
                          DataCell(
                            _buildDropdown(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxColumn({
    required List<String> labels,
    required List<bool> values,
    required void Function(int index, bool value) onChanged,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(labels.length, (index) {
        return Column(
          children: [
            Text(labels[index]),
            Checkbox(
              value: values[index],
              onChanged: (bool? value) {
                onChanged(index, value ?? false);
              },
            ),
            if (index < labels.length - 1) const SizedBox(height: 8),
          ],
        );
      }),
    );
  }

  Widget _buildAssessmentColumn() {
    return _buildCheckboxColumn(
      labels: ['more than acceptable', 'Acceptable', 'weak', 'very weak'],
      values: [false, false, false, false],
      onChanged: (index, value) {
        setState(() {
          // Handle assessment selection logic
        });
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      value: 'A',
      items: [
        'A+',
        'A',
        'A-',
        'B+',
        'B',
        'B-',
        'C+',
        'C',
        'C-',
        'D+',
        'D',
        'D-',
        'F'
      ].map((String grade) {
        return DropdownMenuItem<String>(
          value: grade,
          child: Text(grade),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          // Handle grade selection change
        });
      },
    );
  }
}
