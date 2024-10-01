import 'package:flutter/material.dart';
import 'package:preg_apps/bookappoitments_screen.dart';
import 'package:preg_apps/calendar_sreen.dart';
import 'package:preg_apps/centres_screen.dart';
import 'package:preg_apps/educationaltips_screen.dart';
import 'package:preg_apps/missedappoitments_screen.dart';
import 'package:preg_apps/testing.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<MenuButtonData> _menuButtons = [
    MenuButtonData(
        'Testing / Results', Icons.science, PregnancySymptomsScreen()),
    MenuButtonData('Educational Tips', Icons.school, EducationTipsScreen()),
    MenuButtonData('Centers', Icons.location_on, CentersScreen()),
    MenuButtonData('Missed Appointments', Icons.event_busy,
        MissedAppointmentsScreen()), // Replace with actual screen
    MenuButtonData('Book Appointments', Icons.event,
        BookAppointmentScreen()), // Replace with actual screen
    MenuButtonData('Calendar', Icons.calendar_today,
        PregnancyCalendarScreen()), // Replace with actual screen
    MenuButtonData('Book for Monitoring', Icons.monitor,
        Placeholder()), // Replace with actual screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              _buildHeaderImage(constraints),
              Expanded(
                child: _buildMenuButtons(constraints),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeaderImage(BoxConstraints constraints) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      child: Image.asset(
        'assets/Image1.png',
        width: constraints.maxWidth,
        height: constraints.maxHeight * 0.35,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMenuButtons(BoxConstraints constraints) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _menuButtons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: _buildMenuButton(_menuButtons[index]),
        );
      },
    );
  }

  Widget _buildMenuButton(MenuButtonData buttonData) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _navigateToScreen(buttonData.screen),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                buttonData.text,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Positioned(
              right: 16,
              top: 12,
              child: Icon(
                buttonData.icon,
                color: Colors.black.withOpacity(0.8),
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pink,
      onTap: _onItemTapped,
    );
  }

  void _navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class MenuButtonData {
  final String text;
  final IconData icon;
  final Widget screen;

  MenuButtonData(this.text, this.icon, this.screen);
}
