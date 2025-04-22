import 'package:flutter/material.dart';

import '../../../item/app_bar_items_updated.dart';

class TuitionReceitEx extends StatelessWidget {
  const TuitionReceitEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Tuition Receipt',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: const TuitionReceitEx(),
        arrowIcon: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 300),
                      Text("Academic Year: 2023-2024",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(width: 280),
                      Text("Semester: Fall 2024",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(width: 300),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 650,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildRow("Receipt No", "12345", "College Name",
                        "computer science"),
                    _buildRow("Amount / Fees", "18000 LE", "Payment Date",
                        "2023-09-01"),
                    _buildRow("It's Value", "18000 LE", "Class", " 2021"),
                    _buildRow("Due Date", "2023-09-15", "Level", "Level 4"),
                    _buildRow("Student Name", "Naeem Nasser", "", ""),
                    _buildRow("Employee Name", "Finance Officer", "", ""),
                    const SizedBox(height: 20),
                    _buildSignatures(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Call / 27272145/27272146", style: _footerStyle()),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 15,
                          width: 1,
                          color: Colors.grey),
                      Text("Email / info@mti.edu.eg", style: _footerStyle()),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 15,
                          width: 1,
                          color: Colors.grey),
                      Text("HOTLINE / 19041", style: _footerStyle()),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add confirmation logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Confirm",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add print logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Print",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextStyle _footerStyle() {
    return const TextStyle(
      fontSize: 14,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildRow(String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("$label1  /  $value1",
                style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            child: Text("$label2  /  $value2",
                style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildSignatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Column(
          children: [
            Text("Financial Affairs Signature", style: TextStyle(fontSize: 14)),
            SizedBox(height: 30),
            Text("finsignature"),
          ],
        ),
        Column(
          children: [
            Text("Student Affairs Signature", style: TextStyle(fontSize: 14)),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter signature",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
