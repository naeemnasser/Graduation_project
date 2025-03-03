import 'package:flutter/material.dart';

class RequestDepartmentModification extends StatefulWidget {
  final Map<String, dynamic>? departmentData;
  
  const RequestDepartmentModification({
    Key? key,
    this.departmentData,
  }) : super(key: key);

  @override
  State<RequestDepartmentModification> createState() => _RequestDepartmentModificationState();
}

class _RequestDepartmentModificationState extends State<RequestDepartmentModification> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _reasonController;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing data if available
    final departmentData = widget.departmentData ?? {};
    
    _codeController = TextEditingController(text: departmentData['code'] ?? '');
    _nameController = TextEditingController(text: departmentData['name'] ?? '');
    _reasonController = TextEditingController();
  }
  
  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Department Modification'),
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
                'Department Modification Request',
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
                        'Current Department Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Department Code',
                        controller: _codeController,
                        enabled: false,
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField(
                        label: 'Department Name',
                        controller: _nameController,
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
                        label: 'Department Name',
                        controller: TextEditingController(text: _nameController.text),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter department name';
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
        const SnackBar(content: Text('Department modification request submitted successfully!')),
      );
      
      // Go back to previous screen
      Navigator.pop(context);
    }
  }
}