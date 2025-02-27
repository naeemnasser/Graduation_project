// import 'package:flutter/material.dart';

// class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
//   @override
//   _AppBarWidgetState createState() => _AppBarWidgetState();

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);

//   final String title;
//   final String imagePath;
//   final Color backgroundColor;
//   final Color iconColor;
//   final double elevation;

//   const AppBarWidget({
//     required this.title,
//     required this.imagePath,
//     this.backgroundColor = const Color.fromARGB(255, 128, 128, 128),
//     this.iconColor = Colors.black54,
//     this.elevation = 0.5,
//     Key? key,
//   }) : super(key: key);
// }

// class _AppBarWidgetState extends State<AppBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(widget.title),
//       backgroundColor: widget.backgroundColor,
//       iconTheme: IconThemeData(color: widget.iconColor),
//       elevation: widget.elevation,
//     );
//   }
// }
