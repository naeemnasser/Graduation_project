import 'package:adaa/presentation/views/student_affairs/Aplications.dart';
import 'package:flutter/material.dart';

import '../screens_admin/loginPage.dart';

class ReceiptsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
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
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ApplicationsPage()),
                );
              },
              child: Text("Aplications",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 20),
            Container(
              height: 20,
              child: VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptsPage()),
                );
              },
              child: Text("Receipts",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Logout",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
          IconButton(icon: Icon(Icons.help_outline), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Receipts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('#')),
              DataColumn(label: Text('Student ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Payment')),
              DataColumn(label: Text('Status')),
            ],
            rows: [], // Replace with dynamic data
          ),
        ],
      ),
    );
  }
}
