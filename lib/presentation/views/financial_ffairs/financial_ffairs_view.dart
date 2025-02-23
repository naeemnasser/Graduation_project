import 'package:adaa/core/custom_text_filed.dart';
import 'package:adaa/presentation/views/financial_ffairs/petition_receipt_view.dart';
import 'package:adaa/presentation/views/profile/personal_profile.dart';
import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:flutter/material.dart';

class FinancialAffairsView extends StatelessWidget {
  const FinancialAffairsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 233, 243),
        leading: Image.asset('assets/image.png'),
        title: Row(
          children: [
            Text(
              'Paymant',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Petition Reequest',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to Notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              // Navigate to Profile
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, top: 150, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Student id",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: "Student id :",
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TuitionReceiptView()));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
