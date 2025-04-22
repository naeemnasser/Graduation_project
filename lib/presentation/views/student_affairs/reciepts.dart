import 'package:adaa/presentation/views/student_affairs/Aplications.dart';
import 'package:flutter/material.dart';

import '../screens_admin/loginPage.dart';
import 'tuition_receipts.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Receipts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            // Center the table horizontally
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.grey[300]),
                dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    return states.contains(WidgetState.selected)
                        ? Colors.grey[200]
                        : Colors.white;
                  },
                ),
                columns: [
                  DataColumn(
                    label: Text(
                      '#',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Student ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Payment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: [
                  buildDataRow(
                      1, "S001", "Naeem Nazih", "18000", StatusButtons()),
                  buildDataRow(
                      2, "S002", "Malk Al sati", "\$700", StatusButtons()),
                  buildDataRow(
                      3, "S003", "ayman elmahdy", "20000", StatusButtons()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow buildDataRow(int index, String studentId, String name, String payment,
      Widget statusButtons) {
    return DataRow(
      cells: [
        DataCell(Text(index.toString())),
        DataCell(Text(studentId)),
        DataCell(Text(name)),
        DataCell(Text(payment)),
        DataCell(statusButtons),
      ],
    );
  }
}

class StatusButtons extends StatelessWidget {
  const StatusButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TuitionReceiptPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: const Text("Open", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: const Text("Print", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
