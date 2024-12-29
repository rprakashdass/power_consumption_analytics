import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/drawer.dart';
import 'package:power_consumption_analytics/widgets/notifications_history.dart';

class device_manager extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      "date": "2024-09-02",
      "Start Reading (Kwh)": "13785.3",
      "Today Consumption (Kwh)": "418.82",
    },
    {
      "date": "2024-09-01",
      "Start Reading (Kwh)": "13752.11",
      "Today Consumption (Kwh)": "33.19",
    },
    // Add more data here...
  ];

  device_manager({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devices',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
            onPressed: () {
              Get.to(const NotificationsHistory());
            },
            color: Colors.white,
          )
        ],
      ),
      drawer: main_drawer(context),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle download action
                    },
                    style: TextButton.styleFrom(
                      shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 1, 202, 199),
                    ),
                    child: const Text('Add Device'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
