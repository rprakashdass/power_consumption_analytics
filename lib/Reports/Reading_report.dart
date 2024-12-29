import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/Reports/read_View.dart';
import 'package:power_consumption_analytics/Reports/filter.dart';
import 'package:power_consumption_analytics/widgets/notifications_history.dart';

// import 'package:power_consumption_analytics/drawer.dart';

class ReadingReport extends StatelessWidget { //reading_report
  final List<dynamic>? data_1;
  double p1 = 0.0;
  double p2 = 0.0;
  double p3 = 0.0;
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

    // Add more data here...
  ];

  ReadingReport({super.key, this.data_1});

  // reading_report({super.key,required this.data_1});
  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      appBar: AppBar(
        title:const Text("Reading Report",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {
              Get.to(const NotificationsHistory());
            },
          ),
        ],
      ),
      // drawer: main_drawer(context),
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
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 1, 202, 199),
                    ),
                    onPressed: () {
                      _showFilterDialog(context);
                    },
                    child: const Text(
                      'Filter',
                    )),
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
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final item = data[index];
                  p1 = double.parse(data_1![index]['field3']);
                  p2 = double.parse(data_1![index]['field4']);
                  p3 = double.parse(data_1![index]['field5']);
                  String hvalert = "NO";
                  String lvalert = "NO";
                  String pfalert = "NO";
                  if (p1 > 240 || p2 > 240 || p3 > 240) hvalert = 'YES';
                  if (p1 < 210 || p2 < 210 || p3 < 210) lvalert = 'YES';
                  // print("my pin data ${data_1![index]['field3'].toString()}");
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReadView()));
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "Date: ${item['date']}",
                                "Date: ${data_1![index]['field1']}",
                                // "Pin 1: ${data_1![index]['pin_1'].toString()}",

                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Received (kWh): ${item['received']}"),
                                  Text("Consumed (kWh): ${item['consumed']}"),
                                  // Text("Consumed (kWh): ${item['field1']}"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    double.tryParse(data_1![index]['field3'] ??
                                                    '0') !=
                                                null &&
                                            double.parse(
                                                    data_1![index]['field3']!) >
                                                0
                                        ? 'Pin 1: ON'
                                        : 'Pin 1: OFF',
                                  ),
                                  Text("PF ALERT: $pfalert",
                                      style: TextStyle(
                                        color: pfalert == 'YES'
                                            ? Colors.red
                                            : Colors.black,
                                      )),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    double.tryParse(data_1![index]['field4'] ??
                                                    '0') !=
                                                null &&
                                            double.parse(
                                                    data_1![index]['field4']!) >
                                                0
                                        ? 'Pin 2: ON'
                                        : 'Pin 2: OFF',
                                  ),
                                  Text("LF ALERT: $lvalert",
                                      style: TextStyle(
                                        color: lvalert == 'YES'
                                            ? Colors.red
                                            : Colors.black,
                                      )),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    double.tryParse(data_1![index]['field5'] ??
                                                    '0') !=
                                                null &&
                                            double.parse(
                                                    data_1![index]['field5']!) >
                                                0
                                        ? 'Pin 3: ON'
                                        : 'Pin 3: OFF',
                                  ), // Text("Pin3: ${item['pin3']}"),
                                  Text("HV ALERT: $hvalert",
                                      style: TextStyle(
                                        color: hvalert == 'YES'
                                            ? Colors.red
                                            : Colors.black,
                                      )),
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

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reading Report Filter',
              style: TextStyle(fontSize: 18)), // Title of the dialog
          content:
              const ReadFilterDialogContent(), // Your custom content widget
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
