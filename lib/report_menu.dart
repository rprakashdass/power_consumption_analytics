// report_menu.dart
import 'package:flutter/material.dart';
// ignore: unused_import
import 'main.dart';
class ReportMenu extends StatelessWidget {
  const ReportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Menu'),
        backgroundColor: const Color.fromARGB(255, 1, 202, 200),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.assignment, color: Colors.yellow),
            title: Text('Reading Report'),
          ),
          ListTile(
            leading: Icon(Icons.pie_chart, color: Colors.yellow),
            title: Text('Consumption Report'),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.yellow),
            title: Text('History Report'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.yellow),
            title: Text('Notification Report'),
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.yellow),
            title: Text('Alert Report'),
          ),
        ],
      ),
    );
  }
}
