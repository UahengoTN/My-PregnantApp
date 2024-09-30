import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Import the WelcomeScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: WelcomeScreen(), // Set WelcomeScreen as the home widget
    );
  }
}
