import 'package:flutter/material.dart';

import '../../../item/app_bar_items_updated.dart';

class TuitionReceiptPage extends StatelessWidget {
  const TuitionReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Tuition Receipt',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: const TuitionReceiptPage(),
        arrowIcon: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Column(
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(width: 300),
                            Text("academic year",
                                style: TextStyle(fontSize: 16)),
                            SizedBox(width: 280),
                            Text("semester Registration",
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
                          _buildRow("Receipt No", "receiptNO", "College Name",
                              "college-name"),
                          _buildRow("Amount / fees", "fees-text",
                              "Payment Date ", "payment date"),
                          _buildRow(
                              "It's Value ", "fees-text", "Class ", "reg-year"),
                          _buildRow("Due Date ", "due date", "Level", "level"),
                          _buildRow("Student Name ", "name", "", ""),
                          _buildRow("Employee Name ", "finanName", "", ""),
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
                            Text("Call / 27272145/27272146",
                                style: _footerStyle()),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                height: 15,
                                width: 1,
                                color: Colors.grey),
                            Text("Email / info@mti.edu.eh",
                                style: _footerStyle()),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Confirm",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Print",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
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
            Text("________________"),
          ],
        ),
      ],
    );
  }
}
