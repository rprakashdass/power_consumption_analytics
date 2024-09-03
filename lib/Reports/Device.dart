import 'package:flutter/material.dart';
import 'package:flutter_demo_1/drawer.dart';

class device_manager extends StatelessWidget {
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
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 1, 202, 199),
      actions: [
        IconButton(onPressed: (){},
        icon:Icon(Icons.notifications,size:30),
        color: Colors.white,
        )
      ],
      ),
      drawer: main_drawer(),
      body: 
      Padding(padding: EdgeInsets.all(16.0),
      child :
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle download action
                  },
                  child: Text('Add Device'),
                  style: TextButton.styleFrom(
                    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),
                    )),
                    foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255,1,202,199),
                  ),
                ),
              ],
            ),
        ],
      )
      ),
    );
    }
}