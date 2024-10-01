import 'package:flutter/material.dart';
import 'package:preg_apps/detailedpregnancytips_screen.dart';

class PregnancyTipsScreen extends StatelessWidget {
  final List<String> tips = [
    "Exercise regularly",
    "Eat balanced diet",
    "Take folic acid, vitamin D, others",
    "Monitor your baby's movements",
    "Sleep on your side during third trimester",
    "Take your mental health seriously",
    "Take your vaccinations",
    "Carry antenatal notes everywhere",
    "Not advisable to travel after 37 weeks",
    "Don't take drugs, alcohol or cigarette",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              'assets/Image1.png',
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '10 things every pregnant woman must know',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: tips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.pink[200],
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          tips[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
              MaterialPageRoute(
                  builder: (context) => DetailedPregnancyTipsScreen()),
            );
          }
        },
      ),
    );
  }
}
