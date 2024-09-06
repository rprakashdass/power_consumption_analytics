import 'package:flutter/material.dart';

class reading_view extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      "date": "02-09-2024 20:11:18",
      "received": "14202.81",
      "consumed": "0",
      "pin1": "OFF",
      "pin2": "OFF",
      "pin3": "OFF",
      "PF Alert": "NO",
      "LV Alert": "YES",
      "HV Alert": "NO",
      "Total_watts": "0",
      "R_watts": "0",
      "Y_watts": "0",
      "B_watts": "0",
      "Total_Va": "0",
      "R_Va": "0",
      "Y_Va": "0",
      "B_Va": "0",
      "Total_Ln": "238.99",
      "R_Ln": "237.02",
      "Y_Ln": "236.02",
      "B_Ln": "243.92",
      "Total_Ll": "413.93",
      "R_Ll": "416.5",
      "Y_Ll": "409.66",
      "B_Ll": "415.63",
      "Total_Amp": "0",
      "R_Amp": "0",
      "Y_Amp": "0",
      "B_Amp": "0",
      "Total_Pf": "1",
      "R_Pf": "-",
      "Y_Pf": "-",
      "B_Pf": "-",
      "Failure_Duration": "0 Secs"
    }
  ];

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
                ReportItem(
                  title: "PF Alert",
                  value: ": ${item['PF Alert']}",
                  isAlert: item['PF Alert'] == 'YES',
                ),
                ReportItem(title: "LV Alert", value: ": ${item['LV Alert']}"
                ,isAlert: item['LV Alert'] == 'YES',),
                ReportItem(title: "HV Alert", value: ": ${item['HV Alert']}"
                ,isAlert: item['HV Alert'] == 'YES',),
                ReportItem(title: "Pin1", value: ": ${item['pin1']}"),
                ReportItem(title: "Pin2", value: ": ${item['pin2']}"),
                ReportItem(title: "Pin3", value: ": ${item['pin3']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "Watts (kW):"),
                ReportItem(title: "Total", value: ": ${item['Total_watts']}"),
                ReportItem(title: "R", value: ": ${item['R_watts']}"),
                ReportItem(title: "Y", value: ": ${item['Y_watts']}"),
                ReportItem(title: "B", value: ": ${item['B_watts']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "VA:"),
                ReportItem(title: "Total", value: ": ${item['Total_Va']}"),
                ReportItem(title: "R", value: ": ${item['R_Va']}"),
                ReportItem(title: "Y", value: ": ${item['Y_Va']}"),
                ReportItem(title: "B", value: ": ${item['B_Va']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "LN Volts:"),
                ReportItem(title: "Total", value: ": ${item['Total_Ln']}"),
                ReportItem(title: "R", value: ": ${item['R_Ln']}"),
                ReportItem(title: "Y", value: ": ${item['Y_Ln']}"),
                ReportItem(title: "B", value: ": ${item['B_Ln']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "LL Volts:"),
                ReportItem(title: "Total", value: ": ${item['Total_Ll']}"),
                ReportItem(title: "RY", value: ": ${item['R_Ll']}"),
                ReportItem(title: "YB", value: ": ${item['Y_Ll']}"),
                ReportItem(title: "BR", value: ": ${item['B_Ll']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "Amps:"),
                ReportItem(title: "Total", value: ": ${item['Total_Amp']}"),
                ReportItem(title: "RY", value: ": ${item['R_Amp']}"),
                ReportItem(title: "YB", value: ": ${item['Y_Amp']}"),
                ReportItem(title: "BR", value: ": ${item['B_Amp']}"),
                const SizedBox(height: 10),
                const SectionTitle(title: "PF:"),
                ReportItem(title: "Total", value: ": ${item['Total_Pf']}"),
                ReportItem(title: "RY", value: ": ${item['R_Pf']}"),
                ReportItem(title: "YB", value: ": ${item['Y_Pf']}"),
                ReportItem(title: "BR", value: ": ${item['B_Pf']}"),
                ReportItem(
                  title: "Failure Duration",
                  value: ": ${item['Failure_Duration']}",
                ),
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

  const ReportItem({required this.title, required this.value, this.isAlert = false});

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
                style: TextStyle(
                  color: isAlert ? Colors.red : Colors.black,
                  fontWeight: isAlert ? FontWeight.bold : FontWeight.normal,
                ),
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

  const SectionTitle({required this.title});

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
