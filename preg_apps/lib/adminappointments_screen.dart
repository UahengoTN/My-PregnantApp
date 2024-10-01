import 'package:flutter/material.dart';

class AppointmentsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double cardWidth =
                constraints.maxWidth * 0.9; // 90% of screen width
            double cardHeight = (constraints.maxHeight - 120) *
                0.4; // 40% of available height minus some padding
            return Column(
              children: [
                SizedBox(height: 20),
                _buildStatCard(
                  icon: Icons.people,
                  title: 'Total Patient Booked',
                  value: '200+',
                  color: Colors.pink[300]!,
                  width: cardWidth,
                  height: cardHeight,
                ),
                Spacer(),
                _buildStatCard(
                  icon: Icons.person,
                  title: 'Today Patient',
                  value: '11',
                  color: Colors.pink[300]!,
                  width: cardWidth,
                  height: cardHeight,
                ),
                Spacer(),
                BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list), label: 'List'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.arrow_forward), label: 'Next'),
                  ],
                  selectedItemColor: Colors.pink[300],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.white),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            value,
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
