import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PregnancyCalendarScreen extends StatefulWidget {
  @override
  _PregnancyCalendarScreenState createState() =>
      _PregnancyCalendarScreenState();
}

class _PregnancyCalendarScreenState extends State<PregnancyCalendarScreen> {
  String _selectedCalendarType = 'Daily Count Calendar';
  String _selectedEvent = 'Last Ovulation (LD)';
  DateTime _selectedDate = DateTime.now();
  String _cycleLength = 'Cycle Length (CL): 28';

  final List<String> calendarTypes = [
    'Daily Count Calendar',
    'Daily Countdown Calendar',
    'Fetal Weight Calendar(grams)',
    'Fetal Weight Calendar(ounces)',
    'Bi parietal Diameter (BPD)',
    'Abdominal Circumference (AC)',
    'Head Circumference (HC)',
  ];

  final List<String> eventTypes = [
    'Last Ovulation (LD)',
    'Project Birth Due Date (DD)',
    'Date of Ultrasound (UD)',
    'IVF Transfer (IVF)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                  'Pregnancy Calendar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _buildDropdown(
                'Type of Calendar', _selectedCalendarType, calendarTypes),
            _buildDropdown('Select An Event', _selectedEvent, eventTypes),
            _buildDatePicker(),
            _buildCycleLengthDropdown(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add calculation logic here
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[300],
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 20), // Increased horizontal space between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add reset logic here
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
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
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 14)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                if (label == 'Type of Calendar')
                  _selectedCalendarType = newValue!;
                if (label == 'Select An Event') _selectedEvent = newValue!;
              });
            },
            hint: Text(label),
          ),
        ),
      ),
    );
  }

  Widget _buildCycleLengthDropdown() {
    List<String> cycleLengths =
        List.generate(15, (index) => 'Cycle Length (CL): ${21 + index}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _cycleLength,
            isExpanded: true,
            items: cycleLengths.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 14)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _cycleLength = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date of Event'),
            TextButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              child: Text(
                DateFormat('MM/dd/yyyy').format(_selectedDate),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
