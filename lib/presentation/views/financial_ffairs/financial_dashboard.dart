import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/views/financial_ffairs/details_page.dart';
import 'package:adaa/presentation/views/financial_ffairs/Manger.dart';
// import 'package:adaa/presentation/views/financial_ffairs/payment_form.dart';
import 'package:adaa/presentation/views/student_affairs/tuition_receipts.dart';
import 'package:adaa/presentation/views/financial_ffairs/petition_request.dart';
import 'package:adaa/presentation/views/home/homescreen.dart';
import 'package:flutter/material.dart';

class FinancialDashboard extends StatefulWidget {
  const FinancialDashboard({Key? key}) : super(key: key);

  @override
  State<FinancialDashboard> createState() => _FinancialDashboardState();
}

class _FinancialDashboardState extends State<FinancialDashboard> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('selectedIndex')) {
      setState(() {
        _selectedIndex = args['selectedIndex'] as int;
      });
    }
  }

  final List<Widget> _pages = [
    DetailsPage(),
    // PaymentForm(),
    TuitionReceiptPage(), // Ensure 'TuitionReceipt' is a valid widget imported in your code
    PetitionForm(),
    FinancialStatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Financial Affairs',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: HomeScreen(),
      ),
      body: Column(
        children: [
          // Navigation Functionality

          // Content Area
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
