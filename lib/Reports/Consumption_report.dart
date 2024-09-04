import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/Reports/filter.dart';
import 'package:power_consumption_analytics/drawer.dart';

class consumption_report extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      "date":"2024-09-02",
      "Start Reading (Kwh)": "13785.3",
      "Today Consumption (Kwh)": "418.82",
    },
    {
      "date":"2024-09-01",
      "Start Reading (Kwh)": "13752.11",
      "Today Consumption (Kwh)": "33.19",
    },
    // Add more data here...
  ];

  consumption_report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,size:30),
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
              'Consumption Report',
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
                  child: Text('Filter'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle download action
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 1, 202, 199),
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
                      print("Consumption tap");
                    },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            // color:Colors.blue,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${item['date']}",
                              style:const TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 1, 202, 199))),
                            ]
                          ),    
                          const Divider(),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Start Reading (Kwh)     : ${item['Start Reading (Kwh)']}"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Today Consumption (Kwh)     : ${item['Today Consumption (Kwh)']}"),
                            ],
                            
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin1      : -"),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin2      : -"),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin3      : -"),
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
        title: Text('Consumption Report Filter'), 
        content: Consumption_FilterDialogContent(),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                child: const Text('Cancel',
                style: TextStyle(color: Color.fromARGB(255, 1, 202, 199),
                )
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle the submission logic here
                  // For example, apply the filters
                  Navigator.of(context).pop();
                },
                child: const Text('Submit',
                style: TextStyle(color: Color.fromARGB(255, 1, 202, 199),
                )
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
}