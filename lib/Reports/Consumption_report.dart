import 'package:flutter/material.dart';
import 'package:flutter_demo_1/drawer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 202, 199),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,size:30),
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
            Text(
              'Consumption Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle filter action
                  },
                  child: Text('Filter'),
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 1, 202, 199),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle download action
                  },
                  child: Text('Download'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 1, 202, 199),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
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
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            // color:Colors.blue,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${item['date']}",
                              style:TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 1, 202, 199))),
                            ]
                          ),    
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Start Reading (Kwh)     : ${item['Start Reading (Kwh)']}"),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Today Consumption (Kwh)     : ${item['Today Consumption (Kwh)']}"),
                            ],
                            
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin1      : -"),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pin2      : -"),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
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
}