import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/views/financial_ffairs/details_page.dart';
import 'package:adaa/presentation/views/financial_ffairs/Manger.dart';
import 'package:adaa/presentation/views/financial_ffairs/payment_form.dart';
import 'package:adaa/presentation/views/financial_ffairs/petition_receipt_view.dart';
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
  
  final List<Widget> _pages = [
    PaymentForm(),
    petitionReceiptView(),
    PetitionForm(),
    FinancialStatisticsPage(),
  ];
  
  final List<String> _titles = [
    'Payment',
    'Receipt',
    'Petition',
    'Statistics',
  ];
  
  final List<IconData> _icons = [
    Icons.payment,
    Icons.receipt_long,
    Icons.description,
    Icons.bar_chart,
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
          // Navigation Bar
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_titles.length, (index) {
                  return _buildNavButton(
                    context,
                    _titles[index],
                    _icons[index],
                    _selectedIndex == index ? Colors.blue : Colors.grey,
                    () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          
          // Content Area
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(8.0),
            color: color.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24.0),
              SizedBox(width: 8.0),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}