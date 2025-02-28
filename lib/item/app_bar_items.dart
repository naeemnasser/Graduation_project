import 'package:flutter/material.dart';

import '../presentation/views/home/help.dart';
import '../presentation/views/screens_admin/loginPage.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget.named({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String title;
  final String imagePath;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 128, 128, 128),
      elevation: 0.5,
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
