import 'package:adaa/core/custom_text_filed.dart';
import 'package:adaa/presentation/views/financial_ffairs/financial_dashboard.dart';

import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinancialDashboard(),
                        settings:
                            RouteSettings(arguments: {'selectedIndex': 1}),
                      ),
                    );
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
