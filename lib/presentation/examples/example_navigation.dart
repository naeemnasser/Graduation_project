import 'package:flutter/material.dart';
import '../../item/app_bar_items_updated.dart';
import '../views/home/homescreen.dart';

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Example Page',
        imagePath: 'assets/advisorylogostroke.png',
        // Specify where to navigate when back arrow is pressed
        backDestination: HomeScreen(),
        // Optionally customize the arrow icon
        // arrowIcon: Icon(Icons.arrow_back_ios, color: Colors.blue),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Example Page with Custom Back Navigation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnotherExampleScreen(),
                  ),
                );
              },
              child: Text('Go to Another Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Another Example',
        imagePath: 'assets/advisorylogostroke.png',
        // Navigate to a specific screen instead of going back
        backDestination: ExampleScreen(),
        // Custom back arrow icon
        arrowIcon: Icon(Icons.arrow_back_ios, color: Colors.red),
      ),
      body: Center(
        child: Text('This page has a custom back arrow that returns to the Example Screen'),
      ),
    );
  }
}