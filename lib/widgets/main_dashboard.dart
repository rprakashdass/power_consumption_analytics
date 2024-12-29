import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/dashboard.dart';
import 'package:power_consumption_analytics/drawer.dart';
import 'package:power_consumption_analytics/widgets/dashboard2.dart';
import 'package:power_consumption_analytics/widgets/notifications_history.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0; // Tracks the selected bottom navigation bar index
  final List<Widget> _pages = [ // List of pages to navigate between
     DashboardScreen(),
     const DashboardScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        title: const Center(
          child: Text(
            'POWER SYSTEM',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.to(const NotificationsHistory());
            },
          ),
        ],
      ),
      drawer: main_drawer(context),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Sets the currently selected index
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
              child: Center(
                child: Icon(Icons.home, size: 27),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
              child: Center(
                child: Icon(Icons.flash_on, size: 27),
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 1, 202, 200),
        selectedItemColor: Colors.yellow, // Color for selected item
        unselectedItemColor: Colors.white, // Color for unselected items
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}
