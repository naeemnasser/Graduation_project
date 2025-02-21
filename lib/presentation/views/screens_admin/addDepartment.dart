import 'package:flutter/material.dart';

class AddDepartmentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _departmentNameController = TextEditingController();
  final _departmentIdController = TextEditingController();
  final _collegeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Department'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Department Name Field
              Text(
                'Department Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _departmentNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Department Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter department name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Department ID Field
              Text(
                'Department ID',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _departmentIdController,
                decoration: InputDecoration(
                  hintText: 'Enter Department ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter department ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // College Field
              Text(
                'College',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _collegeController,
                decoration: InputDecoration(
                  hintText: 'Enter College Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter college name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Add Department Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, proceed to add the department
                      final departmentName = _departmentNameController.text;
                      final departmentId = _departmentIdController.text;
                      final college = _collegeController.text;

                      // TODO: Save the department (e.g., to a database or state management)
                      print('Department Name: $departmentName');
                      print('Department ID: $departmentId');
                      print('College: $college');

                      // Show a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Department added successfully!')),
                      );

                      // Clear the form
                      _departmentNameController.clear();
                      _departmentIdController.clear();
                      _collegeController.clear();
                    }
                  },
                  child: Text('Add Department'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
