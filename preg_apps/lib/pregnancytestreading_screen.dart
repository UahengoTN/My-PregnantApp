import 'package:flutter/material.dart';
import 'package:preg_apps/resultstest_screen.dart';

class PregnancyTestReadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/Image1.png',
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Text(
                  'How to Read a Pregnancy Test',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/pregnancy_test.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[300],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInstructionItem(
                      'Wait for the recommended time (usually 3-5 minutes)'),
                  _buildInstructionItem(
                      'Check for the control line to ensure the test is valid'),
                  _buildInstructionItem(
                      'Look for a second line in the test area'),
                  _buildInstructionItem(
                      'Two lines (even if one is faint) usually indicate a positive result'),
                  _buildInstructionItem(
                      'One line in the control area indicates a negative result'),
                  _buildInstructionItem(
                      'If uncertain, wait a few days and test again'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Remember: For the most accurate results, take the test first thing in the morning and follow the instructions provided with your specific test kit.',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: 'Next'),
        ],
        selectedItemColor: Colors.pink[300],
        onTap: (index) {
          if (index == 2) {
            // Next button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultsTestScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildInstructionItem(String instruction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 16, color: Colors.pink[300])),
          Expanded(
            child: Text(
              instruction,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
