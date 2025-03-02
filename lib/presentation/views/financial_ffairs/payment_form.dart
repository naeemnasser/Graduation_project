import 'package:adaa/item/app_bar_items_updated.dart';
import 'package:adaa/presentation/views/financial_ffairs/financial_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  String? _selectedPaymentType;
  String? _selectedSemester;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
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
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Student Payment Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                // Student Information Section
                _buildSectionTitle('Student Information'),
                SizedBox(height: 10),
                
                _buildTextField(
                  label: 'Student ID',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                _buildTextField(
                  label: 'Student Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter student name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                _buildDropdown(
                  label: 'Semester',
                  value: _selectedSemester,
                  items: ['Fall 2024', 'Spring 2025', 'Summer 2025'],
                  onChanged: (value) {
                    setState(() {
                      _selectedSemester = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a semester';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                
                // Payment Details Section
                _buildSectionTitle('Payment Details'),
                SizedBox(height: 10),
                
                _buildTextField(
                  label: 'Amount (LE)',
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                _buildDropdown(
                  label: 'Payment Type',
                  value: _selectedPaymentType,
                  items: ['Tuition Fee', 'Registration Fee', 'Exam Fee', 'Other'],
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select payment type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                _buildDateField(
                  label: 'Payment Date',
                  controller: _dateController,
                  onTap: () => _pickDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                _buildTextField(
                  label: 'Reference Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter reference number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                _buildTextField(
                  label: 'Notes',
                  maxLines: 3,
                ),
                SizedBox(height: 30),
                
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process payment
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Payment processed successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Submit Payment',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 20),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (!isEmbedded) {
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
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
        title: 'Payment Form',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: FinancialDashboard(),
      ),
      body: content,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      validator: validator,
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required VoidCallback onTap,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: onTap,
      validator: validator,
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}