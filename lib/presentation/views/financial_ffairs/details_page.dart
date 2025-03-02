import 'package:adaa/core/custom_text_filed.dart';
import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/views/financial_ffairs/petition_receipt_view.dart';

import 'package:flutter/material.dart';

import 'financial_dashboard.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Payment Management',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: FinancialDashboard(),
        arrowIcon: Icon(Icons.arrow_back),
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
                          builder: (context) => petitionReceiptView()));
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
