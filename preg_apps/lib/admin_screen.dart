import 'package:flutter/material.dart';
import 'package:preg_apps/adminappointments_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileSection(),
            Divider(thickness: 1, color: Colors.pink[100]),
            Expanded(
              child: _buildMenuList(context),
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

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.pink[100],
            child: Icon(Icons.person, size: 40, color: Colors.pink[300]),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[300]),
                ),
                SizedBox(height: 8),
                Text(
                  'DR. Martin Deo',
                  style: TextStyle(fontSize: 16, color: Colors.pink[200]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    final menuItems = [
      {'icon': Icons.calendar_today, 'title': 'Appointment'},
      {'icon': Icons.payment, 'title': 'Payment'},
      {'icon': Icons.person, 'title': 'Profile'},
      {'icon': Icons.settings, 'title': 'Setting'},
      {'icon': Icons.exit_to_app, 'title': 'Logout'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          child: ListView.separated(
            itemCount: menuItems.length,
            separatorBuilder: (context, index) => SizedBox(
                height: constraints.maxHeight / (menuItems.length * 2)),
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return ListTile(
                leading:
                    Icon(item['icon'] as IconData, color: Colors.pink[230]),
                title: Text(
                  item['title'] as String,
                  style: TextStyle(color: Colors.pink[230]),
                ),
                onTap: () {
                  if (item['title'] == 'Appointment') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentsOverviewScreen()),
                    );
                  } else {
                    // Handle other menu items
                    print('Tapped on ${item['title']}');
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
