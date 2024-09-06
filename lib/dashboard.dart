import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/drawer.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class DashboardScreen extends StatelessWidget {
  // const DashboardScreen({super.key});
  String tc = '12345';
  String toc = '16.0';
  String lw = '1256';
  String ln = '245';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        title: const Center(child: Text('MD CONTROL',style: TextStyle(color: Colors.white),)),
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
                  buildReadyCard('Relay1', 'OFF'),
                  buildReadyCard('Relay2', 'OFF'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildConsumptionCard('Today Consumption', '$tc kWh',
                      'Average Consumption\nof Last Week: $lw kWh'),
                  _buildConsumptionCard('Total Consumption', '$toc (kWh)', '          \n  '),
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
          
          BottomNavigationBarItem(label: '', icon: Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: Icon(Icons.home,size: 30,),
          )),
          BottomNavigationBarItem(label: '', icon: Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: Icon(Icons.flash_on,size: 30),
            
          )),
        ],
        backgroundColor: const Color.fromARGB(255, 1, 202, 200),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        
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
        padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(50,10,20,10),
              child: Icon(Icons.speed_rounded,color: Colors.amber,size: 50,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,10,20,10),
              child: Text(value,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8,width: 8,),
            if (subtitle.isNotEmpty) Text(subtitle),
          ],
        ),
      ),
    );
  }

 Widget buildReadyCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(62, 5, 62, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(fontSize: 18)),
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
        
        const Center(
            child: Text('Average Amps: 372.03 A',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        const SizedBox(height: 8),
        _buildVoltageRow('R', '430.93', 'Y', '428.26', 'B', '430.37'),
        const Divider(),
        
        const Center(
            child: Text('Average PF: 0.91 ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        const SizedBox(height: 8),
        _buildVoltageRow('R', '430.93', 'Y', '428.26', 'R', '430.37'),

      ],
    );
  }

  Widget _buildVoltageRow(String label1, String value1, String label2,
      String value2, String label3, String value3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildVoltageDetail(label1, value1),
        buildVoltageDetailforyellow(label2, value2),
        buildVoltageDetailforblue(label3, value3),
      ],
    );
  }

  Widget _buildVoltageDetail(String label, String value) {
    return Column(
      children: [
        // Text(label)
        Stack(
          children: [
            const Icon(Icons.circle_rounded,color: Color.fromARGB(237, 236, 20, 5),size: 30,),
            Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white),))),

          ],
        ),
        // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
      ],
    );
  }
   Widget buildVoltageDetailforyellow(String label, String value) {
    return Column(
      children: [
        // Text(label)
        Stack(
          children: [
            const Icon(Icons.circle_rounded,color: Color.fromARGB(252, 245, 221, 3),size: 30,),
            Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white)))),

          ],
        ),
        // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
      ],
    );
  }
   Widget buildVoltageDetailforblue(String label, String value) {
    return Column(
      children: [
        // Text(label)
        Stack(
          children: [
            const Icon(Icons.circle_rounded,color: Color.fromARGB(255, 9, 133, 234),size: 30,),
            Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white)))),

          ],
        ),
        // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
      ],
    );
  }
}
