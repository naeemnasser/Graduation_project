import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/views/financial_ffairs/financial_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class petitionReceiptView extends StatefulWidget {
  const petitionReceiptView({super.key});

  @override
  _petitionReceiptViewState createState() => _petitionReceiptViewState();
}

class _petitionReceiptViewState extends State<petitionReceiptView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _receiptNoController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _valueForController = TextEditingController();
  final TextEditingController _paymentDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _paymentTypeController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _registrationNoController =
      TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _decisionController = TextEditingController();
  final TextEditingController _coursesCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default date to today
    _paymentDateController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
    _dueDateController.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now().add(Duration(days: 30)));

    // Set some default values for demonstration
    _receiptNoController.text = '10045';
    _amountController.text = '18000';
    _valueForController.text = 'PETuition fees - Fall Semester';
    _paymentTypeController.text = 'Cash';
    _studentNameController.text = 'Naeem Nasser';
    _levelController.text = 'Level 4';
    _registrationNoController.text = 'REG2025001';
    _employeeNameController.text = 'Sara Hassan';
    _semesterController.text = 'Fall';
    _departmentController.text = 'Computer Science';
    _coursesCountController.text = '3';
  }

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1995),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if we're embedded in a tab or standalone
    final bool isEmbedded = ModalRoute.of(context)?.settings.name == null;

    Widget content = SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'tution Receipt',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(thickness: 1.5),
                SizedBox(height: 10),

                Text("Financial Affairs Department",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 15),

                // Receipt Number and Date
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Receipt No"),
                          TextFormField(
                            controller: _receiptNoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter receipt number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date"),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              DateFormat('dd/MM/yyyy').format(DateTime.now()),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Student Information
                Text("Student Information",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text("Student Name"),
                TextFormField(
                  controller: _studentNameController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Text("Registration Number"),
                TextFormField(
                  controller: _registrationNoController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter registration number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Level"),
                          TextFormField(
                            controller: _levelController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Semester"),
                          TextFormField(
                            controller: _semesterController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text("Department"),
                TextFormField(
                  controller: _departmentController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),

                // Payment Information
                Text("Payment Information",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amount (LE)"),
                          TextFormField(
                            controller: _amountController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixText: 'LE',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Type"),
                          TextFormField(
                            controller: _paymentTypeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Cash/Check/Transfer',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text("Value For"),
                TextFormField(
                  controller: _valueForController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter payment purpose';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Date"),
                          TextFormField(
                            controller: _paymentDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () =>
                                    _pickDate(context, _paymentDateController),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Due Date"),
                          TextFormField(
                            controller: _dueDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () =>
                                    _pickDate(context, _dueDateController),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Additional Information
                Text("Additional Information",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Text("Number of courses in the petition"),
                TextFormField(
                  controller: _coursesCountController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),

                Text("Decision"),
                TextFormField(
                  controller: _decisionController,
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),

                Text("Employee Name"),
                TextFormField(
                  controller: _employeeNameController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),

                // Signatures
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Financial Department Signature'),
                        SizedBox(height: 30),
                        Container(
                          width: 150,
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Student Signature'),
                        SizedBox(height: 30),
                        Container(
                          width: 150,
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Contact Information
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Call: 27272145/27272146",
                          style: TextStyle(fontSize: 12)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 15,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Text("info@mti.edu.eh", style: TextStyle(fontSize: 12)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 15,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Text("HOTLINE: 19041", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Receipt Confirmed")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text("Confirm"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Printing receipt...")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text("Print"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (isEmbedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Petition Receipt',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: FinancialDashboard(),
        arrowIcon: Icon(Icons.arrow_back),
      ),
      body: content,
    );
  }
}
