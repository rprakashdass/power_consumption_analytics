import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/drawer.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class DashboardScreen extends StatelessWidget {
  // const DashboardScreen({super.key});
  String tc = '12345';
  String toc = '16789';
  String lw = '1256';
  String ln = '245';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        title: const Text('MD CONTROL'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      drawer: main_drawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  lastcom('Last communicated date\n 2024-09-03 11:33 AM'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusCard('Pin1', 'OFF'),
                  _buildStatusCard('Pin2', 'OFF'),
                  _buildStatusCard('Pin3', 'OFF'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusCard('Relay1', 'OFF'),
                  _buildStatusCard('Relay2', 'OFF'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildConsumptionCard('Today Consumption', tc,
                      'Average Consumption\nof Last Week: $lw kWh'),
                  _buildConsumptionCard('Total Consumption', '$toc kWh', ''),
                ],
              ),
              const SizedBox(height: 10),
              _buildDetailsRow('Total Watts 0.81 kW'),
              const Divider(),
              _buildDetailsRow('Total VA 0.84'),
              const SizedBox(height: 10),
              _buildVoltageInfo(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home,color: Colors.black,),),
          BottomNavigationBarItem(label: 'thunder', icon: Icon(Icons.flash_on,color: Colors.black,)),
        ],
        backgroundColor: const Color.fromARGB(255, 1, 202, 200),
      ),
    );
  }

  Widget _buildStatusCard(String title, String status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
        child: Column(
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(status, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget lastcom(test) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(100, 5, 110, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(test),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildConsumptionCard(String title, String value, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(fontSize: 24, color: Colors.teal)),
            const SizedBox(height: 8),
            if (subtitle.isNotEmpty) Text(subtitle),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsRow(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
      ],
    );
  }

  Widget _buildVoltageInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Center(
            child: Text('Average LN Volts: 248.18 V',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        const SizedBox(height: 8),
        _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
        const SizedBox(height: 16),
        const Divider(),
        const Center(
            child: Text('Average LL Volts: 429.85 V',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        const SizedBox(height: 8),
        _buildVoltageRow('RY', '430.93', 'YB', '428.26', 'BR', '430.37'),
        const Divider(),
      ],
    );
  }

  Widget _buildVoltageRow(String label1, String value1, String label2,
      String value2, String label3, String value3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildVoltageDetail(label1, value1),
        _buildVoltageDetail(label2, value2),
        _buildVoltageDetail(label3, value3),
      ],
    );
  }

  Widget _buildVoltageDetail(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
