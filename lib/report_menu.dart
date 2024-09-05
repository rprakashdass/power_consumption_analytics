// report_menu.dart
import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/Reports/Alert.dart';
import 'package:power_consumption_analytics/Reports/Consumption_report.dart';
import 'package:power_consumption_analytics/Reports/History.dart';
import 'package:power_consumption_analytics/Reports/Notification.dart';
import 'package:power_consumption_analytics/Reports/Reading_report.dart';
// ignore: unused_import
import 'main.dart';

class ReportMenu extends StatelessWidget {
  const ReportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Menu',style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 200),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.assignment, color: Colors.yellow),
            title: const Text('Reading Report'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => reading_report()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart, color: Colors.yellow),
            title: const Text('Consumption Report'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => consumption_report()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart, color: Colors.yellow),
            title: const Text('History Report'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => history_report()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.yellow),
            title: Text('Notification Report'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => notification_report()));
            },
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.yellow),
            title: Text('Alert Report',),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => alert_report()));
            },
          ),
        ],
      ),
    );
  }
}
