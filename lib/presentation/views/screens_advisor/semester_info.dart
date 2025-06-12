import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:adaa/presentation/views/screens_advisor/dashboard.dart';
import 'package:adaa/presentation/views/screens_advisor/requests.dart';
import 'package:flutter/material.dart';
import '../profile/personal_profile.dart';

class SemesterInfoPage extends StatefulWidget {
  const SemesterInfoPage({super.key});

  @override
  State<SemesterInfoPage> createState() => _SemesterInfoPageState();
}

class _SemesterInfoPageState extends State<SemesterInfoPage> {
  final TextEditingController timeSlotController = TextEditingController();

  Widget _buildInputField(String hint) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text,
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.bold,
      Color? color}) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }

  Widget _buildInfoRow(List<InlineSpan> children) {
    return Row(
      children: [
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: children,
            style: DefaultTextStyle.of(context).style,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
        elevation: 1,
        title: Row(
          children: [
            Image.asset("assets/advisorylogostroke.png", height: 40),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SemesterInfoPage()));
              },
              child: const Text("Semester Info",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Requests()));
              },
              child:
                  const Text("Requests", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              },
              child: const Text("Dashboard",
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          IconButton(
              icon: const Icon(Icons.help_outline, color: Colors.black),
              onPressed: () {}),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: const Text("Logout", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: Center(
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                _buildSectionTitle('We are now in ',
                                    fontSize: 20),
                                _buildSectionTitle('Spring 2025!',
                                    fontSize: 22, color: Colors.green),
                                const SizedBox(height: 10),
                              ],
                            ),
                            _buildSectionTitle(
                              'Enter number of students for each level',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(height: 12),
                            _buildInputField('Level 1'),
                            const SizedBox(height: 8),
                            _buildInputField('Level 2'),
                            const SizedBox(height: 8),
                            _buildInputField('Level 3 CS'),
                            const SizedBox(height: 8),
                            _buildInputField('Level 3 IS'),
                            const SizedBox(height: 8),
                            _buildInputField('Level 4 CS'),
                            const SizedBox(height: 8),
                            _buildInputField('Level 4 IS'),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: 200,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[700],
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                ),
                                child: const Text('Add department',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ),
                            ),
                            const SizedBox(height: 2),
                            // Time slot label
                            _buildInfoRow([
                              const TextSpan(
                                text: 'Enter time slot for each department.',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' e.g. 5 slots',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            const SizedBox(height: 10),
                            TextField(
                              controller: timeSlotController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Time slot',
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildInfoRow([
                              const TextSpan(
                                text: 'click to',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(
                                text: ' Generate ',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(
                                text: 'the student schedules and',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ]),
                            _buildSectionTitle(
                                ' instructor/teaching Assistant schedules.',
                                fontSize: 14),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: SizedBox(
                                width: 200,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                  ),
                                  child: const Text('Generate Schedules',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right side: Big image
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Image.asset(
                          'assets/photostudent.jpg',
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
