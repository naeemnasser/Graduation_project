import 'package:adaa/presentation/views/student_affairs/Aplications.dart';
import 'package:flutter/material.dart';

class ApplicationExample extends StatelessWidget {
  const ApplicationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ApplicationsPage()),
            );
          },
        ),
        title: const Text('Application'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              width: 600,
              height: 700, // Card height remains the same
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  // Added scrollable behavior
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(2),
                          },
                          border: TableBorder.all(
                            color: Colors.grey, // Border color
                            width: 1, // Border width
                          ),
                          children: [
                            buildStyledTableRow("First Name:", "naeem",
                                isHeader: false),
                            buildStyledTableRow("Middle Name:", "nazih"),
                            buildStyledTableRow("Last Name:", "nasser"),
                            buildStyledTableRow(
                                "E-Mail:", "john.doe@example.com"),
                            buildStyledTableRow("Phone Number:", "+1234567890"),
                            buildStyledTableRow("Home Phone:", "+0987654321"),
                            buildStyledTableRow(
                                "Address:", "cairo- 123 Main St"),
                            buildStyledTableRow(
                                "choosen College:", "computer science &AI"),
                            buildStyledTableRow("Date of Birth:", "01/01/2000"),
                            buildStyledTableRow("High School Grade:", "82+"),
                            buildStyledTableRow("Gender:", "Male"),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              child: const Text("Accept",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              child: const Text("Reject",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TableRow buildStyledTableRow(String label, String value,
      {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader
            ? Colors.grey[300]
            : Colors.white, // Alternating row colors
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
