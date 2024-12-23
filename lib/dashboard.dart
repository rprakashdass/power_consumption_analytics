import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:power_consumption_analytics/data/conceptionall_data.dart';
import 'package:power_consumption_analytics/drawer.dart';

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
  int tc = 30;  // Today's Consumption value
  String toc = '16.0';
  int lw = 98;
  String ln = '245';

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: const Color.fromARGB(255, 1, 202, 199),
        title: const Center(child: Text('POWER SYSTEM', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: main_drawer(context),
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
                      lastcom('Last communicated date\n2024-09-03 11:33 AM'),
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
                      _buildConsumptionCard('Today Consumption', '${(tc).toString()} kWh','Average Consumption\nof Last Week: ${lw.toString()} kWh'),
                      _buildConsumptionCard2('Total Consumption', ' ${(tc+30).toString()} kWh','Average Consumption\nof Last Month: ${(lw+40).toString()} kWh'),
                         
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
    
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(255, 1, 202, 200),
        // shape: CircularNotchedRectangle(),
        notchMargin:8.0,
        height: 60,
        child: SizedBox(
          height: 29,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home,color: Colors.white,size: 35,)
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: '',
      //       icon: Padding(
      //         padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      //         child: Icon(Icons.home, size: 30),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: '',
            
      //       icon: Text(''),
            
           
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
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
    Widget _buildConsumptionCardsimple(String title, String value, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10.0, 10.0, 10.0),
                child: Text(value,
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



  Widget _buildConsumptionCard(String title, String value, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            Center(
              child: Speedometer(value: 30.0), //double.parse(50.toString())
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10.0, 10.0, 10.0),
                child: Text(value,
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
Widget _buildConsumptionCard2(String title, String value, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            Center(
              child: Speedometer(value: 60.0), //double.parse(50.toString())
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 10.0, 10.0, 10.0),
                child: Text(value,
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
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



// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:power_consumption_analytics/data/conceptionall_data.dart';
// import 'package:power_consumption_analytics/drawer.dart';

// // Speedometer Widget
// class Speedometer extends StatelessWidget {
//   final double value; // value for speedometer

//   const Speedometer({Key? key, required this.value}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(150, 150), // Adjust the size as per your requirement
//       painter: SpeedometerPainter(value),
//     );
//   }
// }

// class SpeedometerPainter extends CustomPainter {
//   final double value;
//   SpeedometerPainter(this.value);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.grey.shade300
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8.0;

//     final Paint fillPaint = Paint()
//       ..color = Colors.amber
//       ..style = PaintingStyle.fill;

//     final Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
//     final double startAngle = -pi / 2; // Start from top
//     final double sweepAngle = 2 * pi * (value / 100); // Calculate angle based on value (assuming 100 is max)

//     // Draw the background arc
//     canvas.drawArc(rect, startAngle, 2 * pi, false, paint);

//     // Draw the filled arc based on the value
//     canvas.drawArc(rect, startAngle, sweepAngle, false, fillPaint);

//     // Draw the pointer
//     final double pointerAngle = startAngle + sweepAngle;
//     final double pointerX = size.width / 2 + (size.width / 2) * cos(pointerAngle);
//     final double pointerY = size.height / 2 + (size.height / 2) * sin(pointerAngle);
//     canvas.drawLine(
//       Offset(size.width / 2, size.height / 2),
//       Offset(pointerX, pointerY),
//       Paint()
//         ..color = Colors.black
//         ..strokeWidth = 4,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// class DashboardScreen extends StatelessWidget {
//   String tc = '80';  // Today's Consumption value
//   String toc = '16.0';
//   String lw = '127';
//   String ln = '245';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white, size: 30),
//         backgroundColor: const Color.fromARGB(255, 1, 202, 199),
//         title: const Center(child: Text('MD CONTROL', style: TextStyle(color: Colors.white))),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: main_drawer(context),
//       body: Builder(
//         builder: (context) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Dashboard',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       lastcom('Last communicated date\n 2024-09-03 11:33 AM'),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildStatusCard('Pin1', 'OFF'),
//                       _buildStatusCard('Pin2', 'OFF'),
//                       _buildStatusCard('Pin3', 'OFF'),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       buildReadyCard('Relay1', 'OFF'),
//                       buildReadyCard('Relay2', 'OFF'),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       _buildConsumptionCard('Today Consumption', '$tc kWh',
//                           'Average Consumption\nof Last Week: $lw kWh'),
//                       _buildConsumptionCard('Total Consumption', '$toc (kWh)', '          \n  '),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   _buildDetailsRow('Total Watts 0.81 kW'),
//                   const Divider(),
//                   _buildDetailsRow('Total VA 0.84'),
//                   const SizedBox(height: 10),
//                   _buildVoltageInfo(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             label: '', 
//             icon: Padding(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: Icon(Icons.home, size: 30),
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: '', 
//             icon: Padding(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: Icon(Icons.flash_on, size: 30),
//             ),
//           ),
//         ],
//         backgroundColor: const Color.fromARGB(255, 1, 202, 200),
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.white,
//       ),
//     );
//   }

//   Widget _buildStatusCard(String title, String status) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
//         child: Column(
//           children: [
//             Text(title,
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(status, style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget lastcom(String test) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(100, 5, 110, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(test),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConsumptionCard(String title, String value, String subtitle) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
//               child: Speedometer(value: double.parse(tc)),  // Using the dynamic tc value
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
//               child: Text(value,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//             const SizedBox(height: 8, width: 8),
//             if (subtitle.isNotEmpty) Text(subtitle),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildReadyCard(String title, String value) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(62, 5, 62, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text(value, style: const TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailsRow(String title) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
//       ],
//     );
//   }

//   Widget _buildVoltageInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Divider(),
//         const Center(
//             child: Text('Average LN Volts: 248.18 V',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
//         const SizedBox(height: 16),
//         const Divider(),
//         const Center(
//             child: Text('Average LL Volts: 429.85 V',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('RY', '430.93', 'YB', '428.26', 'BR', '430.37'),
//         const Divider(),
//         const Center(
//             child: Text('Average Amps: 372.03 A',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '430.93', 'Y', '428.26', 'B', '430.37'),
//         const Divider(),
//         const Center(
//             child: Text('Average PF: 0.91 ',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '430.93', 'Y', '428.26', 'R', '430.37'),
//       ],
//     );
//   }

//   Widget _buildVoltageRow(String label1, String value1, String label2,
//       String value2, String label3, String value3) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildVoltageDetail(label1, value1),
//         buildVoltageDetailforyellow(label2, value2),
//         buildVoltageDetailforblue(label3, value3),
//       ],
//     );
//   }

//   Widget _buildVoltageDetail(String label, String value) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             const Icon(
//               Icons.circle_rounded,
//               color: Color.fromARGB(237, 236, 20, 5),
//               size: 30,
//             ),
//             Positioned(
//                 bottom: 5,
//                 left: 7,
//                 child: Center(
//                     child: Text(
//                   label,
//                   style: const TextStyle(color: Colors.white),
//                 ))),
//           ],
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildVoltageDetailforyellow(String label, String value) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             const Icon(
//               Icons.circle_rounded,
//               color: Color.fromARGB(252, 245, 221, 3),
//               size: 30,
//             ),
//             Positioned(
//                 bottom: 5,
//                 left: 7,
//                 child: Center(
//                     child: Text(
//                   label,
//                   style: const TextStyle(color: Colors.white),
//                 ))),
//           ],
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildVoltageDetailforblue(String label, String value) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             const Icon(
//               Icons.circle_rounded,
//               color: Color.fromARGB(255, 9, 133, 234),
//               size: 30,
//             ),
//             Positioned(
//                 bottom: 5,
//                 left: 7,
//                 child: Center(
//                     child: Text(
//                   label,
//                   style: const TextStyle(color: Colors.white),
//                 ))),
//           ],
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:power_consumption_analytics/data/conceptionall_data.dart';
// import 'package:power_consumption_analytics/drawer.dart';

// // ignore: must_be_immutable, use_key_in_widget_constructors
// class DashboardScreen extends StatelessWidget {
//   // const DashboardScreen({super.key});
//   String tc = '12345';
//   String toc = '16.0';
//   String lw = '1256';
//   String ln = '245';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white, size: 30),
//         backgroundColor: const Color.fromARGB(255, 1, 202, 199),
//         title: const Center(child: Text('MD CONTROL',style: TextStyle(color: Colors.white),)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications,color: Colors.white,),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: main_drawer(context),
//       body: Builder(
//         builder: (context) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Dashboard',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       lastcom('Last communicated date\n 2024-09-03 11:33 AM'),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildStatusCard('Pin1', 'OFF'),
//                       _buildStatusCard('Pin2', 'OFF'),
//                       _buildStatusCard('Pin3', 'OFF'),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       buildReadyCard('Relay1', 'OFF'),
//                       buildReadyCard('Relay2', 'OFF'),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       _buildConsumptionCard('Today Consumption', '$tc kWh',
//                           'Average Consumption\nof Last Week: $lw kWh'),
//                       _buildConsumptionCard('Total Consumption', '$toc (kWh)', '          \n  '),
//                     ],
//                   ),
          
//                   //  SizedBox(
//                   //    child: ListView.builder(
                               
//                   //     itemCount:valuedata.data.length ,
//                   //     itemBuilder: (context,index)=>Column(
                      
//                   //       children: [
//                   //         Text(valuedata.data[index].head),
//                   //         Text(valuedata.data[index].r),
//                   //         Text(valuedata.data[index].y),
//                   //         Text(valuedata.data[index].b),
//                   //       ],
//                   //     )
//                   //     ),


//                   //  ),
                 
//                   const SizedBox(height: 10),
//                   _buildDetailsRow('Total Watts 0.81 kW'),
//                   const Divider(),
//                   _buildDetailsRow('Total VA 0.84'),
//                   const SizedBox(height: 10),
//                   _buildVoltageInfo(),
//                 ],
//               ),
//             ),
//           );
//         }
//       ),
      
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
          
//           BottomNavigationBarItem(
//             label: '', icon: Padding(
//             padding: EdgeInsets.fromLTRB(10,10,10,0),
//             child: Icon(Icons.home,size: 30,),
//           )
          
//           ),
//           BottomNavigationBarItem(label: '', 
//           icon: Padding(
//             padding: EdgeInsets.fromLTRB(10,10,10,0),
//             child: Icon(Icons.flash_on,size: 30),)
//             ),
//         ],
//         backgroundColor: const Color.fromARGB(255, 1, 202, 200),
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.white,
        
//       ),
    
//     );
//   }

//   Widget _buildStatusCard(String title, String status) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
//         child: Column(
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(status, style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget lastcom(test) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(100, 5, 110, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(test),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConsumptionCard(String title, String value, String subtitle) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(50,10,20,10),
//               child: Icon(Icons.speed_rounded,color: Colors.amber,size: 50,),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(30,10,20,10),
//               child: Text(value,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//             const SizedBox(height: 8,width: 8,),
//             if (subtitle.isNotEmpty) Text(subtitle),
//           ],
//         ),
//       ),
//     );
//   }

//  Widget buildReadyCard(String title, String value) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(62, 5, 62, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text(value,
//                 style: const TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }


//   Widget _buildDetailsRow(String title) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
//       ],
//     );
//   }





//   Widget _buildVoltageInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Divider(),
//         const Center(
//             child: Text('Average LN Volts: 248.18 V',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
//         const SizedBox(height: 16),
//         const Divider(),
//         const Center(
//             child: Text('Average LL Volts: 429.85 V',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('RY', '430.93', 'YB', '428.26', 'BR', '430.37'),
//         const Divider(),
        
//         const Center(
//             child: Text('Average Amps: 372.03 A',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '430.93', 'Y', '428.26', 'B', '430.37'),
//         const Divider(),
        
//         const Center(
//             child: Text('Average PF: 0.91 ',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '430.93', 'Y', '428.26', 'R', '430.37'),

//       ],
//     );
//   }

//   Widget _buildVoltageRow(String label1, String value1, String label2,
//       String value2, String label3, String value3) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildVoltageDetail(label1, value1),
//         buildVoltageDetailforyellow(label2, value2),
//         buildVoltageDetailforblue(label3, value3),
//       ],
//     );
//   }

//   Widget _buildVoltageDetail(String label, String value) {
//     return Column(
//       children: [
//         // Text(label)
//         Stack(
//           children: [
//             const Icon(Icons.circle_rounded,color: Color.fromARGB(237, 236, 20, 5),size: 30,),
//             Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white),))),

//           ],
//         ),
//         // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//       ],
//     );
//   }
//    Widget buildVoltageDetailforyellow(String label, String value) {
//     return Column(
//       children: [
//         // Text(label)
//         Stack(
//           children: [
//             const Icon(Icons.circle_rounded,color: Color.fromARGB(252, 245, 221, 3),size: 30,),
//             Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white)))),

//           ],
//         ),
//         // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//       ],
//     );
//   }
//    Widget buildVoltageDetailforblue(String label, String value) {
//     return Column(
//       children: [
//         // Text(label)
//         Stack(
//           children: [
//             const Icon(Icons.circle_rounded,color: Color.fromARGB(255, 9, 133, 234),size: 30,),
//             Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white)))),

//           ],
//         ),
//         // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:power_consumption_analytics/drawer.dart';

// // ignore: must_be_immutable, use_key_in_widget_constructors
// class DashboardScreen extends StatelessWidget {
//   // const DashboardScreen({super.key});
//   String tc = '12345';
//   String toc = '16.0';
//   String lw = '1256';
//   String ln = '245';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white, size: 30),
//         backgroundColor: const Color.fromARGB(255, 1, 202, 199),
//         title: const Center(child: Text('MD CONTROL',style: TextStyle(color: Colors.white),)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications,color: Colors.white,),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       drawer: main_drawer(context),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Dashboard',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   lastcom('Last communicated date\n 2024-09-03 11:33 AM'),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildStatusCard('Pin1', 'OFF'),
//                   _buildStatusCard('Pin2', 'OFF'),
//                   _buildStatusCard('Pin3', 'OFF'),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   buildReadyCard('Relay1', 'OFF'),
//                   buildReadyCard('Relay2', 'OFF'),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   _buildConsumptionCard('Today Consumption', '$tc kWh',
//                       'Average Consumption\nof Last Week: $lw kWh'),
//                   _buildConsumptionCard('Total Consumption', '$toc (kWh)', '          \n  '),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               _buildDetailsRow('Total Watts 0.81 kW'),
//               const Divider(),
//               _buildDetailsRow('Total VA 0.84'),
//               const SizedBox(height: 10),
//               _buildVoltageInfo(),
//             ],
//           ),
//         ),
//       ),
      
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
          
//           BottomNavigationBarItem(label: '', icon: Padding(
//             padding: EdgeInsets.fromLTRB(10,10,10,0),
//             child: Icon(Icons.home,size: 30,),
//           )),
//           BottomNavigationBarItem(label: '', icon: Padding(
//             padding: EdgeInsets.fromLTRB(10,10,10,0),
//             child: Icon(Icons.flash_on,size: 30),
            
//           )),
//         ],
//         backgroundColor: const Color.fromARGB(255, 1, 202, 200),
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.white,
        
//       ),
    
//     );
//   }

//   Widget _buildStatusCard(String title, String status) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
//         child: Column(
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(status, style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget lastcom(test) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(100, 5, 110, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(test),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildConsumptionCard(String title, String value, String subtitle) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(50,10,20,10),
//               child: Icon(Icons.speed_rounded,color: Colors.amber,size: 50,),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(30,10,20,10),
//               child: Text(value,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//             const SizedBox(height: 8,width: 8,),
//             if (subtitle.isNotEmpty) Text(subtitle),
//           ],
//         ),
//       ),
//     );
//   }

//  Widget buildReadyCard(String title, String value) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(62, 5, 62, 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text(value,
//                 style: const TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }


//   Widget _buildDetailsRow(String title) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
//       ],
//     );
//   }





//   Widget _buildVoltageInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Divider(),
//         const Center(
//             child: Text('Average LN Volts: 248.18 V',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '247.58', 'Y', '246.94', 'B', '250.02'),
//         const SizedBox(height: 16),
//         const Divider(),
//         const Center(
//             child: Text('Average LL Volts: 429.85 V',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('RY', '430.93', 'YB', '428.26', 'BR', '430.37'),
//         const Divider(),
        
//         const Center(
//             child: Text('Average Amps: 372.03 A',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '430.93', 'Y', '428.26', 'B', '430.37'),
//         const Divider(),
        
//         const Center(
//             child: Text('Average PF: 0.91 ',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 8),
//         _buildVoltageRow('R', '430.93', 'Y', '428.26', 'R', '430.37'),

//       ],
//     );
//   }

//   Widget _buildVoltageRow(String label1, String value1, String label2,
//       String value2, String label3, String value3) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildVoltageDetail(label1, value1),
//         buildVoltageDetailforyellow(label2, value2),
//         buildVoltageDetailforblue(label3, value3),
//       ],
//     );
//   }

//   Widget _buildVoltageDetail(String label, String value) {
//     return Column(
//       children: [
//         // Text(label)
//         Stack(
//           children: [
//             const Icon(Icons.circle_rounded,color: Color.fromARGB(237, 236, 20, 5),size: 30,),
//             Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white),))),

//           ],
//         ),
//         // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//       ],
//     );
//   }
//    Widget buildVoltageDetailforyellow(String label, String value) {
//     return Column(
//       children: [
//         // Text(label)
//         Stack(
//           children: [
//             const Icon(Icons.circle_rounded,color: Color.fromARGB(252, 245, 221, 3),size: 30,),
//             Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white)))),

//           ],
//         ),
//         // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//       ],
//     );
//   }
//    Widget buildVoltageDetailforblue(String label, String value) {
//     return Column(
//       children: [
//         // Text(label)
//         Stack(
//           children: [
//             const Icon(Icons.circle_rounded,color: Color.fromARGB(255, 9, 133, 234),size: 30,),
//             Positioned(bottom:5,left:7,child:Center(child:Text(label,style: const TextStyle(color: Colors.white)))),

//           ],
//         ),
//         // Text(label, style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 47, 10, 255))),
//         Text(value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
//       ],
//     );
//   }
// }
