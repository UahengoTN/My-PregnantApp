import 'package:flutter/material.dart';

class MissedAppointmentsScreen extends StatefulWidget {
  @override
  _MissedAppointmentsScreenState createState() =>
      _MissedAppointmentsScreenState();
}

class _MissedAppointmentsScreenState extends State<MissedAppointmentsScreen> {
  List<bool> _isChecked = List.generate(8, (_) => false);

  final List<String> visits = [
    'Visit #1: 6-10 weeks',
    'Visit #2: 10-12 weeks',
    'Visit #3: 16-18 weeks',
    'Visit #4: 20-22 weeks',
    'Visit #5: 24-28 weeks',
    'Visit #6: 32 weeks',
    'Visit #7: 36 weeks',
    'Visits #8-10: 38-40 weeks',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/Image1.png',
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Text(
                'Book for missed Appointment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'Tick the missed week',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pink[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: visits.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(
                    visits[index],
                    style: TextStyle(fontSize: 16),
                  ),
                  value: _isChecked[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked[index] = value!;
                    });
                  },
                  activeColor: Colors.pink[300],
                  checkColor: Colors.white,
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
      ),
    );
  }
}
