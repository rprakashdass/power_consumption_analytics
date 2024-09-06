import 'package:flutter/material.dart';

class consumption_view extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      "date": "2024-09-06 00:00:05",
      "received": "15590.91",
      "consumed": "61.76",
      "pin1": "-",
      "pin2": "-",
      "pin3": "-",
      "avg_watts": "0",
      "min_watts": "0",
      "max_watts": "0",
      
      "avg_Ln": "237.02",
      "min_Ln": "236.02",
      "max_Ln": "243.92",
      
      "avg_Ll": "416.5",
      "min_Ll": "409.66",
      "max_Ll": "415.63",
      
      "avg_Amp": "0",
      "min_Amp": "0",
      "max_Amp": "0",
      
    }
  ];

   consumption_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        centerTitle: true,
        title: const Text(
          "View Report Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReportItem(title: "Date", value: ": ${item['date']}"),
                ReportItem(title: "Received", value: ": ${item['received']} (kWh)"),
                ReportItem(title: "Consumed", value: ": ${item['consumed']} (kWh)"),
                
                ReportItem(title: "Pin1", value: ": ${item['pin1']}"),
                ReportItem(title: "Pin2", value: ": ${item['pin2']}"),
                ReportItem(title: "Pin3", value: ": ${item['pin3']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "Watts (kW):"),
                ReportItem(title: "Average", value: ": ${item['avg_watts']}"),
                ReportItem(title: "Minimum", value: ": ${item['min_watts']}"),
                ReportItem(title: "Maximum", value: ": ${item['max_watts']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "LN:"),
                ReportItem(title: "Average", value: ": ${item['avg_Ln']}"),
                ReportItem(title: "Minimum", value: ": ${item['min_Ln']}"),
                ReportItem(title: "Maximum", value: ": ${item['max_Ln']}"),
                const SizedBox(height: 10),
                
                const SectionTitle(title: "LL Volts:"),
                ReportItem(title: "Average", value: ": ${item['avg_Ll']}"),
                ReportItem(title: "Minimum", value: ": ${item['min_Ll']}"),
                ReportItem(title: "Maximum", value: ": ${item['max_Ll']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "Amps:"),
                ReportItem(title: "Average", value: ": ${item['avg_Amp']}"),
                ReportItem(title: "Minimum", value: ": ${item['min_Amp']}"),
                ReportItem(title: "Maximum", value: ": ${item['max_Amp']}"),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ReportItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isAlert;

  const ReportItem({super.key, required this.title, required this.value, this.isAlert = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 1, // The title takes half the space
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2, // The value takes the rest of the space
            child: FittedBox(
              alignment: Alignment.topLeft,
              fit: BoxFit.scaleDown, // Prevents overflow
              child: Text(
                value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 1, 202, 199),
          fontSize: 16,
        ),
      ),
    );
  }
}
