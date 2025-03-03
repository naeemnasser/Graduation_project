import 'package:flutter/material.dart';

class RequestCourseModification extends StatefulWidget {
  final Map<String, dynamic>? courseData;
  
  const RequestCourseModification({
    Key? key,
    this.courseData,
  }) : super(key: key);

  @override
  State<RequestCourseModification> createState() => _RequestCourseModificationState();
}

class _RequestCourseModificationState extends State<RequestCourseModification> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _levelController;
  late TextEditingController _lecturesController;
  late TextEditingController _sectionsController;
  late TextEditingController _hoursController;
  late TextEditingController _departmentController;
  late TextEditingController _reasonController;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing data if available
    final courseData = widget.courseData ?? {};
    
    _codeController = TextEditingController(text: courseData['code'] ?? '');
    _nameController = TextEditingController(text: courseData['name'] ?? '');
    _levelController = TextEditingController(text: courseData['level']?.toString() ?? '');
    _lecturesController = TextEditingController(text: courseData['lectures']?.toString() ?? '');
    _sectionsController = TextEditingController(text: courseData['sections']?.toString() ?? '');
    _hoursController = TextEditingController(text: courseData['hours']?.toString() ?? '');
    _departmentController = TextEditingController(text: courseData['department'] ?? '');
    _reasonController = TextEditingController();
  }
  
  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _levelController.dispose();
    _lecturesController.dispose();
    _sectionsController.dispose();
    _hoursController.dispose();
    _departmentController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Course Modification'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Course Modification Request',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Course Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Course Code',
                        controller: _codeController,
                        enabled: false,
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Course Name',
                        controller: _nameController,
                        enabled: false,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Level',
                              controller: _levelController,
                              enabled: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Hours',
                              controller: _hoursController,
                              enabled: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Lectures',
                              controller: _lecturesController,
                              enabled: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Sections',
                              controller: _sectionsController,
                              enabled: false,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Department',
                        controller: _departmentController,
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Requested Modifications',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Course Name',
                        controller: TextEditingController(text: _nameController.text),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter course name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Level',
                              controller: TextEditingController(text: _levelController.text),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Hours',
                              controller: TextEditingController(text: _hoursController.text),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Lectures',
                              controller: TextEditingController(text: _lecturesController.text),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              label: 'Sections',
                              controller: TextEditingController(text: _sectionsController.text),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Department',
                        controller: TextEditingController(text: _departmentController.text),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter department';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Reason for Modification',
                        controller: _reasonController,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a reason for the modification';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: const Text(
                    'Submit Request',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: validator,
    );
  }

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      // In a real app, this would send the request to a server
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Course modification request submitted successfully!')),
      );
      
      // Go back to previous screen
      Navigator.pop(context);
    }
  }
}