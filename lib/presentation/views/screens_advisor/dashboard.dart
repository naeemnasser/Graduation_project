import 'package:adaa/presentation/views/screens_advisor/pages/resultversion1.dart';
import 'package:adaa/presentation/views/screens_advisor/semester_info.dart';
import 'package:adaa/presentation/views/screens_advisor/pages/request_course_modification.dart';
import 'package:adaa/presentation/views/screens_advisor/pages/request_department_modification.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SemesterInfoPage()),
            );
          },
        ),
        elevation: 2,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png", height: 40),
            SizedBox(width: 10),
            Text("Dashboard",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
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
                  title: Text('Dashboard Help'),
                  content: Text('This page shows all courses and departments. '
                      'You can send modification requests using the buttons below each table.'),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Courses",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 10),
            CourseTable(),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestCourseModification(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.red),
                ),
                child: Text("Send Request for Course modification",
                    style: TextStyle(color: Colors.red)),
              ),
            ),
            SizedBox(height: 30),
            Text("Departments",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 10),
            DepartmentTable(),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestDepartmentModification(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.red),
                ),
                child: Text(
                  "Send Request for Department modification",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            // New TextButton that navigates to AdvisorResult page
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdvisorResult()),
                  );
                },
                child: Text(
                  "View Advisor Results",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(outside: BorderSide(width: 1)),
      columnWidths: {
        0: FractionColumnWidth(0.1),
        1: FractionColumnWidth(0.2),
        2: FractionColumnWidth(0.1),
        3: FractionColumnWidth(0.15),
        4: FractionColumnWidth(0.15),
        5: FractionColumnWidth(0.15),
        6: FractionColumnWidth(0.15),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Code",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Name",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Level",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Lectures",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Sections",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Hours",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Department",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child:
                    Padding(padding: EdgeInsets.all(8), child: Text("CS101"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Computer Science Basics"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("1"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("3"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("2"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("4"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8), child: Text("CS Department"))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child:
                    Padding(padding: EdgeInsets.all(8), child: Text("ENG101"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("English Language 1"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("1"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("2"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("1"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("3"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8), child: Text("Languages"))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8), child: Text("MATH201"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Advanced Mathematics"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("2"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("3"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("2"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("4"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8), child: Text("Mathematics"))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child:
                    Padding(padding: EdgeInsets.all(8), child: Text("PHY101"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Physics Fundamentals"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("1"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("2"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("2"))),
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("4"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8), child: Text("Physics"))),
          ],
        ),
      ],
    );
  }
}

class DepartmentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(outside: BorderSide(width: 1)),
      columnWidths: {
        0: FractionColumnWidth(0.3),
        1: FractionColumnWidth(0.7),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Code",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Name",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("CS"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Computer Science Department"))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child:
                    Padding(padding: EdgeInsets.all(8), child: Text("MATH"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Mathematics Department"))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("ENG"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Languages Department"))),
          ],
        ),
        TableRow(
          children: [
            TableCell(
                child: Padding(padding: EdgeInsets.all(8), child: Text("PHY"))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Physics Department"))),
          ],
        ),
      ],
    );
  }
}
