import 'package:flutter/material.dart';

// Assessment options enum for type safety
enum AssessmentLevel { moreThanAcceptable, acceptable, weak, veryWeak }

class ResultInfo extends StatefulWidget {
  const ResultInfo({Key? key}) : super(key: key);

  @override
  State<ResultInfo> createState() => _ResultInfoState();
}

class _ResultInfoState extends State<ResultInfo> {
  // State variables
  bool isErrorYesChecked = false;
  bool isErrorNoChecked = true;
  bool isGradeAppliedChecked = false;
  bool isGradeNotAppliedChecked = true;
  final List<bool> assessmentStates = [false, false, false, false];

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
          child: Column(
            children: [
              _buildSubjectSection(
                subjectName: 'Numerical',
                studentName: 'Naeem Nasser',
                tableData: _buildTable(
                  isErrorYesChecked,
                  isErrorNoChecked,
                  isGradeAppliedChecked,
                  isGradeNotAppliedChecked,
                ),
              ),
              const SizedBox(height: 20),
              _buildSubjectSection(
                subjectName: 'Math',
                studentName: 'Ali Ahmed',
                tableData: _buildTable(
                  false,
                  true,
                  false,
                  true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectSection({
    required String subjectName,
    required String studentName,
    required Widget tableData,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStudentInfo(studentName, subjectName),
            const SizedBox(height: 20),
            tableData,
            const SizedBox(height: 20),
            _buildNotesAndSignature(),
            const SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfo(String studentName, String subjectName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Student Name: $studentName',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Subject: $subjectName',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildNotesAndSignature() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notes:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter notes here...',
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        const Text(
          'Signature:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter signature here...',
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle Save
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle Clear
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Clear'),
        ),
      ],
    );
  }

  Widget _buildTable(
    bool isErrorYesChecked,
    bool isErrorNoChecked,
    bool isGradeAppliedChecked,
    bool isGradeNotAppliedChecked,
  ) {
    return DataTable(
      columnSpacing: 16.0,
      dataRowHeight: 350,
      columns: _buildTableColumns(),
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
                values: [isGradeAppliedChecked, isGradeNotAppliedChecked],
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
            DataCell(_buildAssessmentColumn()),
            DataCell(_buildAssessmentColumn()),
            DataCell(_buildAssessmentColumn()),
            DataCell(
              _buildCheckboxColumn(
                labels: ['Corrected', 'Incorrect'],
                values: [isGradeAppliedChecked, isGradeNotAppliedChecked],
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
            DataCell(_buildDropdown()),
          ],
        ),
      ],
    );
  }

  List<DataColumn> _buildTableColumns() {
    return const [
      DataColumn(
        label: Text(
          'Error in\nCorrection',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Grade Application\nfor Submitted Record',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Year Work\nAssessment',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Partical Exam\nAssessment',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Final Exam\nAssessment',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Total\nGrade',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'Final\nGrade',
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    ];
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
      values: assessmentStates,
      onChanged: (index, value) {
        setState(() {
          for (int i = 0; i < assessmentStates.length; i++) {
            assessmentStates[i] = i == index ? value : false;
          }
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
