import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:power_consumption_analytics/data/conceptionall_data.dart';

// Speedometer Widget
class Speedometer extends StatelessWidget {
  final double value; // value for speedometer

  const Speedometer({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(130, 50), // Adjust the size as per your requirement
      painter: SpeedometerPainter(value),
    );
  }
}

class SpeedometerPainter extends CustomPainter {
    final double currentConsumption;
    final double maxConsumption;
  SpeedometerPainter(this.currentConsumption, {this.maxConsumption=100});

  @override
  void paint(Canvas canvas, Size size) {
     final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
      
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi, // Start angle (180 degrees)
      pi, // Sweep angle (180 degrees)
      false,
      paint,
    );

     Color arcColor;
    if (currentConsumption <= maxConsumption * 0.3) {
      arcColor = Colors.green; // Low consumption
    } else if (currentConsumption <= maxConsumption * 0.7) {
      arcColor = Colors.yellow; // Moderate consumption
    } else {
      arcColor = Colors.red; // High consumption
    }
     final consumptionArcPaint = Paint()
      ..color = arcColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    final sweepAngle = (currentConsumption / maxConsumption) * pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi, // Start angle
      sweepAngle, // Sweep angle
      false,
      consumptionArcPaint,
    );
    
    // Draw center dot
    // canvas.drawCircle(center, 10, Paint()..color = Colors.black);

    // Draw Labels (e.g., kWh at 0, 50, 100)
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (double i = 0; i <= maxConsumption; i += maxConsumption / 4) {
      final angle = pi + (i / maxConsumption) * pi;
      final offset = Offset(
        center.dx + (radius + 20) * cos(angle),
        center.dy + (radius + 20) * sin(angle),
      );
      textPainter.text = TextSpan(
        text: '${i.toInt()}',
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset - const Offset(5, 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DashboardScreen extends StatelessWidget {
  double tc = 30.0;  // Today's Consumption value
  double toc = 70.0;
  double lw = 98.0;
  double ln = 100.0;

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5,10,5,10),
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
                      Flexible(child: lastcom('Last communicated date\n2024-09-03 11:33 AM')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: _buildStatusCard('Pin1', 'OFF')),
                      const SizedBox(width: 10,),
                      Flexible(child: _buildStatusCard('Pin2', 'OFF')),
                      const SizedBox(width: 10,),
                      Flexible(child: _buildStatusCard('Pin3', 'OFF')),
                    ],
                  ),
                  const SizedBox(height: 10),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Flexible(child:Card(child:Center(child: Text("data")) ,)),
                      // Flexible(child:Card(child:Center(child: Text("data")) ,)),
                      
                  
                      Flexible(child: buildReadyCard('Relay1', 'OFF')),
                      const SizedBox(width: 10,),
                      Flexible(child: buildReadyCard('Relay2', 'OFF')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                   
                      Flexible(child: _buildConsumptionCard('Today Consumption', tc,'Average Consumption\nof Last Week: ${lw.toString()} kWh')),
                      Flexible(child: _buildConsumptionCard('Total Consumption', toc,'Average Consumption\nof Last Month: ${(ln).toString()} kWh')),
                         
                      // _buildConsumptionCardsimple('Total Consumption', '$toc (kWh)', '  \n  '),
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
          );
        },
      ),
    
      // bottomNavigationBar: const BottomAppBar(
      //   color: Color.fromARGB(255, 1, 202, 200),
      //   // shape: CircularNotchedRectangle(),
      //   notchMargin:8.0,
      //   height: 60,
      //   child: SizedBox(
      //     height: 29,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.home,color: Colors.white,size: 35,)
      //       ],
      //     ),
      //   ),
      // ),

      // bottomNavigationBar: BottomNavigationBar(
        
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: '',
            
      //       icon: Padding(
 
      //         padding: EdgeInsets.fromLTRB(8.0,2.0,8.0,0.0),
      //         child: Center(
      //           child: Icon(Icons.home, size: 27),
      //         ),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: '',
      //       icon: Padding(
      //         padding: EdgeInsets.fromLTRB(8.0,2.0,8.0,0.0),
      //         child: Center(
      //           child: Icon(Icons.flash_on, size: 27),
      //         ),
      //       ),
           
      //     ),
      //   ],
      //   backgroundColor: const Color.fromARGB(255, 1, 202, 200),
      //   selectedItemColor: Colors.yellow,
      //   unselectedItemColor: Colors.white,
      // ),
      

    );
  }

  Widget _buildStatusCard(String title, String status) {
    return Card(
      child: Center(
        // padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(status, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget lastcom(String test) {
    return Card(
      child: Center(
        // padding: const EdgeInsets.fromLTRB(100, 5, 110, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(test),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
    
  Widget _buildConsumptionCard(String title, double value, String subtitle) {
    
    return Card(
      child: Center(
        // padding: const EdgeInsets.fromLTRB(12, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            Center(
              child: Speedometer(value:value), //double.parse(50.toString())
            ),
            Center(
              child: Center(
                // padding: const EdgeInsets.fromLTRB(35.0, 10.0, 10.0, 10.0),
                child: Text('$value kwh',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8, width: 8),
            if (subtitle.isNotEmpty) Text(subtitle),
          ],
        ),
      ),
    );
  }

  Widget buildReadyCard(String title, String value) {
    return Card(
      child: Center(
        // padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18)),
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
        Stack(
          children: [
            const Icon(
              Icons.circle_rounded,
              color: Color.fromARGB(237, 236, 20, 5),
              size: 30,
            ),
            Positioned(
                bottom: 5,
                left: 7,
                child: Center(
                    child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ))),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildVoltageDetailforyellow(String label, String value) {
    return Column(
      children: [
        Stack(
          children: [
            const Icon(
              Icons.circle_rounded,
              color: Color.fromARGB(252, 245, 221, 3),
              size: 30,
            ),
            Positioned(
                bottom: 5,
                left: 7,
                child: Center(
                    child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ))),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildVoltageDetailforblue(String label, String value) {
    return Column(
      children: [
        Stack(
          children: [
            const Icon(
              Icons.circle_rounded,
              color: Color.fromARGB(255, 9, 133, 234),
              size: 30,
            ),
            Positioned(
                bottom: 5,
                left: 7,
                child: Center(
                    child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ))),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
