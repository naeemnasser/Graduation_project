import 'package:flutter/material.dart';

class ResultInfo extends StatefulWidget {
  const ResultInfo({Key? key}) : super(key: key);

  @override
  State<ResultInfo> createState() => _ResultInfoState();
}

class _ResultInfoState extends State<ResultInfo> {
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: 200, // Increased height for better spacing
                      columns: const [
                        DataColumn(label: Text('Error in Correction')),
                        DataColumn(
                            label:
                                Text('Grade Application for Submmited record')),
                        DataColumn(label: Text('Year Work Assessment')),
                        DataColumn(label: Text('Partical Exam assessment')),
                        DataColumn(label: Text('final Exam Assessment')),
                        DataColumn(label: Text('final Grade')),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text('Yes'),
                                      Checkbox(
                                        value: isErrorYesChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isErrorYesChecked = value ?? false;
                                            if (isErrorYesChecked) {
                                              isErrorNoChecked = false;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    children: [
                                      const Text('No'),
                                      Checkbox(
                                        value: isErrorNoChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isErrorNoChecked = value ?? false;
                                            if (isErrorNoChecked) {
                                              isErrorYesChecked = false;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text('Applied'),
                                      Checkbox(
                                        value: isGradeAppliedChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isGradeAppliedChecked =
                                                value ?? false;
                                            if (isGradeAppliedChecked) {
                                              isGradeNotAppliedChecked = false;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    children: [
                                      const Text('Not Applied'),
                                      Checkbox(
                                        value: isGradeNotAppliedChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isGradeNotAppliedChecked =
                                                value ?? false;
                                            if (isGradeNotAppliedChecked) {
                                              isGradeAppliedChecked = false;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Radio<bool>(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {},
                              ),
                            ),
                            DataCell(
                              Radio<bool>(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {},
                              ),
                            ),
                            DataCell(
                              Radio<bool>(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {},
                              ),
                            ),
                            DataCell(
                              Radio<bool>(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
