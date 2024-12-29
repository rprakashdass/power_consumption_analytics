import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/Reports/filter.dart';
import 'package:power_consumption_analytics/widgets/notifications_history.dart';

class NotificationReport extends StatelessWidget {
  const NotificationReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title:const Text("Notification Report",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
            color: Colors.white,
            onPressed: () {
              Get.to(const NotificationsHistory());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showFilterDialog(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: const Text('Filter'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle download action
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: const Text('Download'),
                ),
              ],
            ),
        const Padding(padding: EdgeInsets.fromLTRB(100, 250, 100, 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("No data found",style: TextStyle(fontSize: 20),)
          ])
        ),
        ] ,
      ),  
    ),
  );
}
void _showFilterDialog(BuildContext context) {
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text('Notification Report Filter',style: TextStyle(fontSize: 18)),
      content: const NotificationFilterDialogContent(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 202, 199),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the submission logic here
                // For example, apply the filters
                Navigator.of(context).pop();
              },
              child: const Text('Submit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 202, 199),
                  )),
            ),
          ],
        ),
      ],
    );
  },
);
}
}
