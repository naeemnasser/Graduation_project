// import 'package:flutter/material.dart';
// import '../model/tableitem.dart';
// import '../screens_admin/loginPage.dart';

// class ScheduledClassesScreen extends StatelessWidget {
//   const ScheduledClassesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MTI Academic Website'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const LoginScreen()),
//             );
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
// // Choose Level Dropdown
//             Text(
//               ' Level...',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Sunday',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
// // Schedule Table
//             SizedBox(height: 8),
//             tableitems(
//               courseTitle: 'linear Algebra 1',
//               instructor: 'Dr. Ahmed',
//               place: 'C2.1',
//               type: 'Lecture',
//               time: '10:00-12:00',
//             ),
//             SizedBox(height: 6),
//             tableitems(
//               courseTitle: 'linear Algebra 1',
//               instructor: 'Dr. Alaa',
//               place: 'L1',
//               type: 'L',
//               time: '12:00-2:00',
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Tuesday',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             tableitems(
//               courseTitle: ' math1 ',
//               instructor: 'Dr. salma',
//               place: 'sec 1',
//               type: 'S',
//               time: '10:00-12:00',
//             ),
//             Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Wednesday',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             tableitems(
//               courseTitle: ' Ai ',
//               instructor: 'Dr. mohamed',
//               place: 'L3',
//               type: 'Lecture',
//               time: '10:00-12:00',
//             ),
//             Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'thursday',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             tableitems(
//               courseTitle: 'databas 1 ',
//               instructor: 'Dr. mohamed',
//               place: 'L3',
//               type: 'Lecture',
//               time: '10:00-12:00',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
