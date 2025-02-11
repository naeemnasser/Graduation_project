import 'package:flutter/material.dart';

class tableitems extends StatelessWidget {
  final String courseTitle;
  final String instructor;
  final String place;
  final String type;
  final String time;

  const tableitems({
    super.key,
    required this.courseTitle,
    required this.instructor,
    required this.place,
    required this.type,
    required this.time,
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
              rows: [
                DataRow(cells: [
                  DataCell(Text(instructor)),
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
              rows: [
                DataRow(cells: [
                  DataCell(Text(place)),
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
              rows: [
                DataRow(cells: [
                  DataCell(Text(type)),
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
              rows: [
                DataRow(cells: [
                  DataCell(Text(time)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
