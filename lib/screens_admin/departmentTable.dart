import 'package:flutter/material.dart';
import '../model/department.dart';

class DepartmentTableScreen extends StatelessWidget {
  final List<Department> departments = [
    Department(
      name: 'Computer Science',
      college: 'College of Engineering',
      status: 'Active',
    ),
    // Add more departments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Department Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('College')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Edit')),
            DataColumn(label: Text('Delete')),
          ],
          rows: departments.map((department) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(department.name)),
                DataCell(Text(department.college)),
                DataCell(Text(department.status)),
                DataCell(Icon(Icons.edit)),
                DataCell(Icon(Icons.delete)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
