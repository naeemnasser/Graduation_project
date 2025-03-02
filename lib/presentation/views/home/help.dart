import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget(
          title: 'Help',
          imagePath: 'assets/advisorylogostroke.png',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'FAQs\n',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'AI-Driven Academic Advisor Platform',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Main Content Area with Contact Us in top right
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FAQ Section - Takes most of the space
                  Expanded(
                    flex: 3,
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: SizedBox(
                        height: 480,
                        child: ListView(
                          padding: const EdgeInsets.all(16.0),
                          children: [
                            FAQSection(
                                title: "What is ADAAP?",
                                content:
                                    "ADAAP is an AI-driven platform designed to assist students and advisors in academic planning by optimizing course selection, scheduling, and enrollment processes."),
                            FAQSection(
                                title: "Who can use ADAAP?",
                                content:
                                    "Students, advisors, university administrators, financial officers, and student affairs personnel can access and use the system."),
                            FAQSection(
                                title: "How do I log into the system?",
                                content:
                                    "Users can log in using their university credentials. If you experience issues, contact technical support."),
                            FAQSection(
                                title: "Course Selection & Scheduling",
                                content:
                                    "How does ADAAP recommend courses?\nThe platform analyzes academic history, degree requirements, and student preferences to suggest the best courses.\n\nCan I modify my recommended schedule?\nYes, students can make adjustments, but changes must comply with credit hour limits and prerequisite requirements.\n\nWhat happens if a class is full?\nADAAP suggests alternative courses or notifies students when a seat becomes available."),
                            FAQSection(
                                title: "Enrollment & Fees",
                                content:
                                    "Check with the university for detailed enrollment and fee structures."),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Spacing between FAQ and Contact
                  const SizedBox(width: 24),

                  // Contact Us Card - In the top right
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Contact Us",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 16),
                            ContactDetail(
                                icon: Icons.location_on,
                                text: "Mokattam, Cairo"),
                            ContactDetail(icon: Icons.phone, text: "16997"),
                            ContactDetail(
                                icon: Icons.email, text: "info@mti.edu.eg"),
                            ContactDetail(
                                icon: Icons.school, text: "MTI University"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQSection extends StatelessWidget {
  final String title;
  final String content;
  const FAQSection({super.key, required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(content, style: const TextStyle(fontSize: 14)),
          )
        ],
      ),
    );
  }
}

class ContactDetail extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContactDetail({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
