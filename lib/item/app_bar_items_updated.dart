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
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String title;
  final String imagePath;
  final Widget? arrowIcon;
  final Widget? backDestination;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.arrowIcon,
    this.backDestination,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 128, 128, 128),
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
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }),
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
