import 'package:flutter/material.dart';

class NotificationsHistory extends StatelessWidget {
  const NotificationsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        title: const Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const Center(
        child: Text("No Notifications"),
      ),
    );
  }
}