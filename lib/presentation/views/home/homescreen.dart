import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/views/home/Applicationform..dart';
import 'package:adaa/presentation/views/financial_ffairs/financial_dashboard.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Home',
        imagePath: 'assets/advisorylogostroke.png',
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 800 ? 100.0 : 20.0,
                vertical: 16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Welcome to ADAAP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'AI-Driven Academic Advising Platform',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40),
                              Text(
                                'About Us ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900]),
                              ),
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black87),
                                  children: [
                                    TextSpan(
                                      text: 'Welcome to the ',
                                    ),
                                    TextSpan(
                                      text:
                                          'AI-Driven Academic Advising Platform (ADAAP)',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                          ', an intelligent system designed to enhance academic learning and streamline university operations. Our platform leverages advanced AI and machine learning to provide personalized academic guidance for students, optimize course scheduling based on instructor, teacher assistant schedules, credit hours, and limited resources.',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Text(
                                'At ADAAP, we are committed to empowering students, advisors, and university administrators with data-driven insights to ensure efficient academic decision-making. By integrating automation and generating schedules, our platform simplifies enrollment, ensures compliance with academic policies, and maximizes resource utilization.',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Image.asset('assets/landing.jpg',
                              fit: BoxFit.scaleDown),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Our Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 16.0, // Horizontal space between cards
                      runSpacing: 16.0, // Vertical space when wrapping
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                            width: 250,
                            height: 350,
                            child: _buildServiceCard(
                                '1',
                                'Personalized Academic Advising',
                                'Our AI-powered system analyzes student recommendations, helping students stay on track with their academic goals while optimizing their schedules specially for Case Students.')),
                        SizedBox(
                            width: 250,
                            height: 350,
                            child: _buildServiceCard('2', 'Course Scheduling',
                                'We ensure that students schedules align with credit hour limits, degree requirements, and faculty availability, minimizing conflicts and maximizing efficiency.')),
                        SizedBox(
                            width: 250,
                            height: 350,
                            child: _buildServiceCard(
                                '3',
                                'Student Fees & Enrollment',
                                'ADAAP simplifies the tuition payment and enrollment process by automating fee calculations, tracking payments, and ensuring seamless registration.')),
                        SizedBox(
                            width: 250,
                            height: 350,
                            child: _buildServiceCard(
                                '4',
                                'Comprehensive Reports & Insights',
                                'ADAAP generates detailed reports for administrators and advisors, offering data-driven insights to improve institutional decision making and student success rates.')),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplicationScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 32),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            'Apply',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildServiceCard(String number, String title, String description) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 3,
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue[900],
            child: Text(
              number,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
