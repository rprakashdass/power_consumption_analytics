import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/Reports/hero_dialog_route.dart';
import 'package:power_consumption_analytics/drawer.dart';


class reading_report extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      "date": "02-09-2024 20:11:18",
      "received": "14202.81",
      "consumed": "0",
      "pin1": "OFF",
      "pin2": "OFF",
      "pin3": "OFF",
      "pfAlert": "YES",
      "lvAlert": "NO",
      "hvAlert": "NO"
    },
    {
      "date": "02-09-2024 20:10:48",
      "received": "14202.81",
      "consumed": "0.01",
      "pin1": "OFF",
      "pin2": "OFF",
      "pin3": "OFF",
      "pfAlert": "YES",
      "lvAlert": "NO",
      "hvAlert": "NO"
    },
    {
      "date": "02-09-2024 20:10:18",
      "received": "14202.8",
      "consumed": "0.01",
      "pin1": "OFF",
      "pin2": "OFF",
      "pin3": "OFF",
      "pfAlert": "YES",
      "lvAlert": "NO",
      "hvAlert": "NO"
    },
    {
      "date": "02-09-2024 20:09:48",
      "received": "14202.8",
      "consumed": "0.01",
      "pin1": "OFF",
      "pin2": "OFF",
      "pin3": "OFF",
      "pfAlert": "YES",
      "lvAlert": "NO",
      "hvAlert": "NO"
    },
    {
      "date": "02-09-2024 20:09:18",
      "received": "14202.11",
      "consumed": "0",
      "pin1": "OFF",
      "pin2": "OFF",
      "pin3": "OFF",
      "pfAlert": "YES",
      "lvAlert": "NO",
      "hvAlert": "NO"
    },
    // Add more data here...
  ];

  reading_report({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,size: 30,),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      drawer: main_drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reading Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle filter action
                    print("filter tapped");
                    AddTodoButton();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                  child: Text('Filter'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle download action
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.teal,
                  ),
                  child: Text('Download'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return GestureDetector(
                    onTap: (){
                      print("Tapped");
                    },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date: ${item['date']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Received (kWh): ${item['received']}"),
                              Text("Consumed (kWh): ${item['consumed']}"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin1: ${item['pin1']}"),
                              
                              Text("PF Alert: ${item['pfAlert']}",
                                  style: TextStyle(
                                    color: item['pfAlert'] == 'YES'
                                        ? Colors.red
                                        : Colors.black,
                                  )),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin2: ${item['pin2']}"),
                              Text("LV Alert: ${item['lvAlert']} "),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin3: ${item['pin3']}"),
                              Text("HV Alert: ${item['hvAlert']} "),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}