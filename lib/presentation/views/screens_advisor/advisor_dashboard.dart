import 'package:flutter/material.dart';
import '../screens_admin/loginPage.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        elevation: 1,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png",
                height: 40), // Replace with your logo
            SizedBox(width: 10),
            Text("MTI",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child:
                  Text("Semester Info", style: TextStyle(color: Colors.black))),
          TextButton(
              onPressed: () {},
              child: Text("Requests", style: TextStyle(color: Colors.black))),
          TextButton(
              onPressed: () {},
              child: Text("Dashboard",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.help_outline, color: Colors.black),
              onPressed: () {}),
          TextButton(
              onPressed: () {},
              child: Text("Logout", style: TextStyle(color: Colors.black))),
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
            SizedBox(height: 30),
            Text("Departments",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(height: 10),
            DepartmentTable(),
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
      columnWidths: {0: FractionColumnWidth(0.1), 1: FractionColumnWidth(0.2)},
      children: [
        TableRow(
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
                    child: Text("Number of Lectures",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Number of Sections",
                        style: TextStyle(fontWeight: FontWeight.bold)))),
            TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Number of Hours",
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
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.red),
                    ),
                    child: Text("Send Request for modification",
                        style: TextStyle(color: Colors.red)),
                  ),
                ),
              ),
            ),
            TableCell(child: Container()),
            TableCell(child: Container()),
            TableCell(child: Container()),
            TableCell(child: Container()),
            TableCell(child: Container()),
            TableCell(child: Container()),
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
      children: [
        TableRow(
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
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.red),
                    ),
                    child: Text(
                      "Send Request for modification",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(), // Empty cell to maintain table structure
            ),
          ],
        ),
      ],
    );
  }
}
