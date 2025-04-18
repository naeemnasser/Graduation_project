import 'package:adaa/presentation/views/screens_advisor/pages/petition_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      'status': 'Pending',
      'date': '2025-03-01',
      'details':
          'Student requests to register for CS101 after the registration period.',
    },
    {
      'id': 'REQ002',
      'studentId': 'ST12346',
      'studentName': 'Malk mohamed ',
      'requestType': 'Rate Adjustment',
      'course': 'MATH202 - Calculus II',
      'status': 'Approved',
      'date': '2025-02-28',
      'details': 'Student requests to drop MATH202 due to medical reasons.',
    },
    {
      'id': 'REQ003',
      'studentId': 'ST12347',
      'studentName': 'Ayman el-mahdy',
      'requestType': 'Rate Adjustment',
      'course': 'ENG101 - English Language 1',
      'status': 'Rejected',
      'date': '2025-02-27',
      'details':
          'Student requests to change from Section A to Section B due to schedule conflict.',
    },
  ];

  String _statusFilter = 'All';
  final List<String> _statusOptions = ['All'];

  @override
  Widget build(BuildContext context) {
    final filteredRequests = _statusFilter == 'All'
        ? requests
        : requests.where((req) => req['status'] == _statusFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Petition Requests'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Petition Requests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildFilterSection(),
            const SizedBox(height: 16),
            Expanded(
              child: filteredRequests.isEmpty
                  ? const Center(child: Text('No requests found'))
                  : ListView.builder(
                      itemCount: filteredRequests.length,
                      itemBuilder: (context, index) {
                        final request = filteredRequests[index];
                        return _buildRequestCard(request);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refresh data (in a real app, this would fetch from API)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Refreshing requests...')),
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter Requests',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Status: '),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _statusFilter,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: _statusOptions.map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _statusFilter = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    Color statusColor;
    switch (request['status']) {
      case 'open':
        statusColor = Colors.green;
        break;
      case 'Rejected':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.orange;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: ExpansionTile(
        title: Text(
          'Request #${request['id']} - ${request['requestType']}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Student: ${request['studentName']} | Date: ${request['date']}',
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            request['status'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Student ID', request['studentId']),
                _buildInfoRow('Course', request['course']),
                _buildInfoRow('Details', request['details']),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetitionDetailScreen(
                              request: {
                                'id': request['id'],
                                'studentId': request['studentId'],
                                'studentName': request['studentName'],
                                'requestType': request['requestType'],
                                'course': request['course'],
                                'status': request['status'],
                                'date': request['date'],
                                'details': request['details'],
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Open'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
