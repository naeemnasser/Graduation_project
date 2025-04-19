import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'petition_detail_screen.dart';

class PetitionRequests extends ConsumerStatefulWidget {
  const PetitionRequests({Key? key}) : super(key: key);

  @override
  ConsumerState<PetitionRequests> createState() => _PetitionRequestsState();
}

class _PetitionRequestsState extends ConsumerState<PetitionRequests> {
  // Sample data - in a real app, this would come from an API
  final List<Map<String, dynamic>> requests = [
    {
      'id': 'REQ001',
      'studentId': 'ST12345',
      'studentName': 'Naeem Nazih',
      'requestType': 'Rate Adjustment',
      'course': 'CS101 - Intro to Computer Science',
      'date': '2025-03-01',
      'details':
          'Student requests to register for CS101 after the registration period.',
    },
    {
      'id': 'REQ002',
      'studentId': 'ST12346',
      'studentName': 'Malk mohamed',
      'requestType': 'Rate Adjustment',
      'course': 'MATH202 - Calculus II',
      'date': '2025-02-28',
      'details': 'Student requests to drop MATH202 due to medical reasons.',
    },
    {
      'id': 'REQ003',
      'studentId': 'ST12347',
      'studentName': 'Ayman el-mahdy',
      'requestType': 'Rate Adjustment',
      'course': 'ENG101 - English Language 1',
      'date': '2025-02-27',
      'details':
          'Student requests to change from Section A to Section B due to schedule conflict.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildRequestsList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildRefreshButton(),
    );
  }

  Widget _buildCustomHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 204, 211, 217),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: const Text(
                    'Petition Requests',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                onPressed: () {
                  // Implement logout functionality
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildHeaderDataTable(),
        ],
      ),
    );
  }

  Widget _buildHeaderDataTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Table(
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey.shade200),
        ),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 152, 153, 155),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '#',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'College',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Result',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              _buildTableCell(requests.length.toString()),
              _buildTableCell('Computer Science'),
              _buildTableCell('${requests.length} Requests'),
              _buildTableCell('View All'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
    );
  }

  Widget _buildRequestsList() {
    if (requests.isEmpty) {
      return const Center(
        child: Text(
          'No requests found',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return _buildRequestCard(request);
      },
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    return Card(
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.9),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Request #${request['id']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  request['date'],
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Student: ${request['studentName']}',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            Text(
              'Course: ${request['course']}',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PetitionDetailScreen(
                        request: {
                          'id': request['id'],
                          'studentId': request['studentId'],
                          'studentName': request['studentName'],
                          'course': request['course'],
                          'date': request['date'],
                          'details': request['details'],
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Open',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRefreshButton() {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Refreshing requests...')),
        );
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.refresh),
    );
  }
}
