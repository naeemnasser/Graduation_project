import 'package:flutter/material.dart';
import 'dart:ui'; // Added for Offset usage

class PetitionDetailScreen extends StatefulWidget {
  final Map<String, dynamic> request;

  const PetitionDetailScreen({super.key, required this.request});

  @override
  State<PetitionDetailScreen> createState() => _PetitionDetailScreenState();
}

class _PetitionDetailScreenState extends State<PetitionDetailScreen> {
  List<Offset> _signaturePoints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admission and Registration Department'),
        backgroundColor: const Color.fromARGB(255, 128, 128, 128),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        // Center the card content
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 16), // Increased left and right padding
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Request ID: ${widget.request['id']}'),
                  const SizedBox(height: 16),
                  Center(
                    child: const Text(
                      'Petition',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      'To ensure that there are no material errors in monitoring',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDeanInfo(
                    'Mr. Professor Dr / Dean of the college',
                    'dean_name',
                    'college_name',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Student Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Student Name', 'student_name'),
                  _buildInfoRow('Registration Number', 'registration_number'),
                  _buildInfoRow('Semester', 'semester'),
                  _buildInfoRow('Department', 'department'),
                  const SizedBox(height: 12),
                  _buildSubSection(
                      'Materials to be reviewed', ['Numerical', 'Math']),
                  const SizedBox(height: 16),
                  Center(
                    child: const Text(
                      'Best regards..',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Sighnature', 'Sighnature'),
                  _buildInfoRow('Name', 'student_name'),
                  _buildInfoRow('Date', 'petiton_date'),
                  const SizedBox(height: 12),
                  const Text(
                    'desision',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  _SignaturePad(points: _signaturePoints),
                  const SizedBox(height: 16),
                  _buildInfoRow('Financial Affairs', 'sarah ahmed'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button color
                      foregroundColor: Colors.white, // Font color
                    ),
                    child: const Text('Result'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeanInfo(String title, String deanName, String collegeName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        _buildInfoRow('Dean Name', deanName),
        _buildInfoRow('College', collegeName),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSubSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text('• $item'),
            )),
      ],
    );
  }

  Widget _buildDecisionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Decision',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          decoration: const InputDecoration(
            labelText: 'Enter your decision',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class _SignaturePad extends StatelessWidget {
  final List<Offset> points;

  const _SignaturePad({required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomPaint(
        painter: SignaturePainter(points: points),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset> points;

  SignaturePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) => true;
}
