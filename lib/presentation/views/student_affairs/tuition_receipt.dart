import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TuitionReceipt extends StatefulWidget {
  const TuitionReceipt({super.key});

  @override
  _TuitionReceiptState createState() => _TuitionReceiptState();
}

class _TuitionReceiptState extends State<TuitionReceipt> {
  final _formKey = GlobalKey<FormState>();
  final _receiptNoController = TextEditingController();
  final _amountController = TextEditingController();
  final _valueForController = TextEditingController();
  final _paymentDateController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _paymentTypeController = TextEditingController();
  final _studentNameController = TextEditingController();
  final _levelController = TextEditingController();
  final _registrationNoController = TextEditingController();
  final _employeeNameController = TextEditingController();
  final _semesterController = TextEditingController();
  final _departmentController = TextEditingController();
  final _coursesCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _paymentDateController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    _dueDateController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now().add(Duration(days: 30)));
    _receiptNoController.text = '10045';
    _amountController.text = '18000';
    _valueForController.text = 'Tuition fees - Fall Semester';
    _paymentTypeController.text = 'Cash';
    _studentNameController.text = 'Naeem Nasser';
    _levelController.text = 'Level 4';
    _registrationNoController.text = 'REG2025001';
    _employeeNameController.text = 'Sara Hassan';
    _semesterController.text = 'Fall';
    _departmentController.text = 'Computer Science';
    _coursesCountController.text = '3';
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmbedded = ModalRoute.of(context)?.settings.name == null;

    Widget content = SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "2023-2024",
                    style: TextStyle(
                        fontSize: 14,
                        // fontFamily: 'Courier',
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Fall",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 14,
                        // fontFamily: 'Courier',
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Tuition Receipt',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Courier',
                          color: Colors.black),
                    ),
                  ),
                  Divider(thickness: 1.5, color: Colors.black),
                  SizedBox(height: 10),
                  Text("Financial Affairs Department",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Courier',
                          color: Colors.black)),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text("${_receiptNoController.text}",
                            style: _infoStyle()),
                      ),
                      Expanded(
                        child: Text(
                            "${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                            style: _infoStyle()),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("${_studentNameController.text}", style: _infoStyle()),
                  SizedBox(height: 10),
                  Text("${_registrationNoController.text}",
                      style: _infoStyle()),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Text("${_levelController.text}",
                              style: _infoStyle())),
                      Expanded(
                          child: Text("${_semesterController.text}",
                              style: _infoStyle())),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("${_departmentController.text}", style: _infoStyle()),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Text("${_amountController.text} LE",
                              style: _infoStyle())),
                      Expanded(
                          child: Text("${_paymentTypeController.text}",
                              style: _infoStyle())),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("${_valueForController.text}", style: _infoStyle()),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Text("${_paymentDateController.text}",
                              style: _infoStyle())),
                      Expanded(
                          child: Text("${_dueDateController.text}",
                              style: _infoStyle())),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("${_employeeNameController.text}", style: _infoStyle()),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [
                        Text('Financial Affairs Signature',
                            style: _infoStyle()),
                        SizedBox(height: 30)
                      ]),
                      Column(children: [
                        Text('Student Affairs Signature', style: _infoStyle()),
                        SizedBox(height: 30)
                      ]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Call / 27272145/27272146", style: _footerStyle()),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 15,
                            width: 1,
                            color: Colors.grey),
                        Text("Email / info@mti.edu.eh", style: _footerStyle()),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 15,
                            width: 1,
                            color: Colors.grey),
                        Text("HOTLINE / 19041", style: _footerStyle()),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text('Confirm'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text('Print'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (isEmbedded) return content;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Tuition Receipt',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: const TuitionReceipt(),
        arrowIcon: const Icon(Icons.arrow_back),
      ),
      body: TuitionReceipt(),
    );
  }

  TextStyle _infoStyle() {
    return const TextStyle(
        fontSize: 14, fontFamily: 'Courier', color: Colors.black);
  }

  TextStyle _footerStyle() {
    return const TextStyle(
        fontSize: 10, fontFamily: 'Courier', color: Colors.black);
  }
}
