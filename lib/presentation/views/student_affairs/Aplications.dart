import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:flutter/material.dart';

import 'applicationoneExample.dart';
import 'reciepts.dart';

class ApplicationsPage extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Applications',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('College')),
                  DataColumn(label: Text('Status')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('2023-10-01')),
                    DataCell(Text('John Doe')),
                    DataCell(Text('Engineering')),
                    DataCell(
                      Row(
                        children: [
                          Text('In Progress',
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ApplicationExample(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              foregroundColor: Colors.black, // Text color
                            ),
                            child: Text('Open'),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('2023-10-02')),
                    DataCell(Text('Jane Smith')),
                    DataCell(Text('Business')),
                    DataCell(
                      Row(
                        children: [
                          Text('Approved'),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ApplicationExample(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              foregroundColor: Colors.black, // Text color
                            ),
                            child: Text('Open'),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('2023-10-03')),
                    DataCell(Text('Alice Johnson')),
                    DataCell(Text('Computer Science')),
                    DataCell(
                      Row(
                        children: [
                          Text('Rejected'),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ApplicationExample(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              foregroundColor: Colors.black, // Text color
                            ),
                            child: Text('Open'),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
