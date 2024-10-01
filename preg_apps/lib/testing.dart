import 'package:flutter/material.dart';
import 'package:preg_apps/pregnancytestreading_screen.dart';

class PregnancySymptomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Early Pregnancy Symptoms'),
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink[50]!, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  "assets/Image1.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Early symptoms of pregnancy',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[300],
                              ),
                            ),
                            SizedBox(height: 20),
                            SymptomItem('A missed period'),
                            SymptomItem('Feeling exhausted'),
                            SymptomItem('Urinating more than normal'),
                            SymptomItem('Sensitive, swollen breasts'),
                            SymptomItem('Nausea'),
                            SymptomItem('Vomiting'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Symptoms'),
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
              MaterialPageRoute(
                  builder: (context) => PregnancyTestReadingScreen()),
            );
          }
        },
      ),
    );
  }
}

class SymptomItem extends StatelessWidget {
  final String symptom;

  SymptomItem(this.symptom);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.pink[300]),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              symptom,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
