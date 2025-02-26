import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 128, 128, 128),
      elevation: 0.5,
      title: Row(
        children: [
          Image.asset("assets/advisorylogostroke.png", height: 40),
          SizedBox(width: 10),
          Expanded(
            child: Center(
              child: Text('ADAAP HOME ',
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
            icon: Icon(Icons.person, color: Colors.black54), onPressed: () {}),
        IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black54),
            onPressed: () {}),
      ],
    );
  }
}
