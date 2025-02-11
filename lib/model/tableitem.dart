import 'package:flutter/material.dart';

class tableitems extends StatelessWidget {
  final String courseTitle;

  const tableitems({
    super.key,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'Course Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              //course title
              rows: [
                DataRow(cells: [
                  DataCell(Text(courseTitle)),
                ]),
              ],
            ),
            DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'Instructor',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              //instructor name
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Supervisor')),
                ]),
              ],
            ),
            DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),

              columns: const [
                DataColumn(
                  label: Text(
                    'Place',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              //place
              rows: const [
                DataRow(cells: [
                  DataCell(Text('S/L')),
                ]),
              ],
            ),
            DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              //type
              rows: const [
                DataRow(cells: [
                  DataCell(Text('S/L')),
                ]),
              ],
            ),
            DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              //time
              rows: const [
                DataRow(cells: [
                  DataCell(Text('09:00-15:35')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
