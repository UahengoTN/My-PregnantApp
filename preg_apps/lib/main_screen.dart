import 'package:flutter/material.dart';

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
              // Image at the top
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.asset(
                  'assets/Image1.png', // Replace with your image asset
                  width: constraints.maxWidth,
                  height: constraints.maxHeight *
                      0.35, // Occupy 35% of the screen height
                  fit: BoxFit.cover,
                ),
              ),
              // Menu buttons below the image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMenuButton(
                          'Testing / Results', Icons.arrow_downward),
                      _buildMenuButton(
                          'Educational Tips', Icons.arrow_downward),
                      _buildMenuButton('Centers', Icons.arrow_downward),
                      _buildMenuButton(
                          'Missed Appointments', Icons.arrow_downward),
                      _buildMenuButton(
                          'Book Appointments', Icons.arrow_downward),
                      _buildMenuButton('Calendar', Icons.calendar_today),
                      _buildMenuButton(
                          'Book for Monitoring', Icons.arrow_downward),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMenuButton(String text, IconData icon) {
    return Container(
      width: double.infinity, // Make the button take up full width
      height: 50, // Fixed height for equal-sized buttons
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            // Centered Text
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            // Icon on the right and shifted down slightly
            Positioned(
              right: 16,
              top: 12, // Shift the icon down by adjusting the 'top' property
              child: Icon(
                icon,
                color: const Color.fromARGB(255, 20, 14, 14)
                    .withOpacity(0.8), // Adjust icon brightness
                size:
                    26, // You can also adjust the size of the icon if necessary
              ),
            ),
          ],
        ),
      ),
    );
  }
}
