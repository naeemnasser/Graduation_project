import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PetitionForm extends StatefulWidget {
  const PetitionForm({Key? key}) : super(key: key);

  @override
  _PetitionFormState createState() => _PetitionFormState();
}

class _PetitionFormState extends State<PetitionForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(title: Text("Petition Request Form")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Admission and Registration Department",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Professor Name"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Dean of College"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Student Name"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Registration Number"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Semester"),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: ["Fall", "Spring", "Summer"]
                      .map((semester) => DropdownMenuItem(
                          value: semester, child: Text(semester)))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
                Text("Department"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Materials to be reviewed"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Course ${index + 1}",
                            border: OutlineInputBorder()),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Text("Best Regards",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Signature"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Decision"),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                Text("Number of courses in the petition"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Amount Paid"),
                TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text("Payment Date"),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _pickDate(context),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Form Submitted")));
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
