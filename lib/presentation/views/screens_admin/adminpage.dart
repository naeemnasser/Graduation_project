import 'package:adaa/presentation/views/screens_admin/addCoursepage.dart';
import 'package:adaa/presentation/views/screens_admin/addDepartment.dart';
import 'package:adaa/presentation/views/screens_admin/courseTable.dart';
import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:flutter/material.dart';

import 'departmentTable.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        title: Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildActionCard(
                  context,
                  title: 'Add Course',
                  icon: Icons.add,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()),
                    );
                  },
                ),
                SizedBox(width: 20),
                _buildActionCard(
                  context,
                  title: 'Add Department',
                  icon: Icons.add,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddDepartmentScreen()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 21),
            Row(
              children: [
                _buildActionCard(
                  context,
                  title: 'Course Table',
                  icon: Icons.table_chart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseTableScreen()),
                    );
                  },
                ),
                SizedBox(width: 20),
                _buildActionCard(
                  context,
                  title: 'Department Table',
                  icon: Icons.table_chart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DepartmentTableScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(icon, size: 40),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
