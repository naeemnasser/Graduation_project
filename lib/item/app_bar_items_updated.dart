import 'package:flutter/material.dart';

import '../presentation/views/home/help.dart';
import '../presentation/views/screens_admin/loginPage.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget.named({
    super.key,
    required this.title,
    required this.imagePath,
    required this.arrowIcon,
    this.backDestination,
    this.onProfileIconPressed, // Add this parameter
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String title;
  final String imagePath;
  final Widget? arrowIcon;
  final Widget? backDestination;
  final VoidCallback? onProfileIconPressed; // Add this parameter

  const AppBarWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.arrowIcon,
    this.backDestination,
    this.onProfileIconPressed, // Initialize it
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0.5,
      leading: IconButton(
        // Use the provided arrowIcon, or default to Icons.arrow_back if none is provided.
        icon: arrowIcon ?? const Icon(Icons.arrow_back),
        onPressed: () {
          if (backDestination != null) {
            // Navigate to specified destination
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => backDestination!),
            );
          } else {
            // Default behavior: go back
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
      ),
      title: Row(
        children: [
          Image.asset(imagePath, height: 40),
          SizedBox(width: 10),
          Expanded(
            child: Center(
              child: Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.notifications, color: Colors.black54),
            onPressed: () {}),
        IconButton(
            icon: Icon(Icons.person, color: Colors.black54),
            onPressed: onProfileIconPressed), // Use the callback here
        IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black54),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ));
            }),
      ],
    );
  }
}
