import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen2 extends StatelessWidget {
  const DashboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          "Energy Dashboard",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Divider(thickness: 2, color: Colors.teal),
        const SizedBox(height: 16),

        // Energy Duration with Pie Chart
        _dashboardCard(
          title: "Energy Duration",
          child: Column(
            children: [
              _energyDurationPieChart(),
              const SizedBox(height: 16),
              _energyDurationLegend(),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Hourly Energy Consumption with Bar Chart
        _dashboardCard(
          title: "Hourly Energy Consumption",
          child: _hourlyEnergyBarChart(),
        ),
        const SizedBox(height: 16),

        // Daywise Energy Consumption with Line Chart
        _dashboardCard(
          title: "Daywise Energy Consumption",
          child: _daywiseEnergyLineChart(),
        ),
        const SizedBox(height: 16),

        // Daywise Power Running Hour with Horizontal Bar Chart
        _dashboardCard(
          title: "Daywise Power Running Hour",
          child: _daywisePowerRunningBarChart(),
        ),
        const SizedBox(height: 16),

        // ON/OFF History Card
        const Text(
          "ON/OFF History",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _dashboardCard(
          child: const Center(child: Text("No data found")),
        ),
      ],
    );
  }

  Widget _dashboardCard({String? title, required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
            ],
            child,
          ],
        ),
      ),
    );
  }

  // Energy Duration - Pie Chart
  Widget _energyDurationPieChart() {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Colors.blue,
              value: 30,
              title: '30%',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.teal,
              value: 20,
              title: '20%',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.orange,
              value: 40,
              title: '40%',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.yellow,
              value: 10,
              title: '10%',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          sectionsSpace: 2,
          centerSpaceRadius: 30,
        ),
      ),
    );
  }

  Widget _energyDurationLegend() {
    return Column(
      children: [
        _legendItem(color: Colors.blue, label: "Active Duration"),
        _legendItem(color: Colors.teal, label: "Idle Duration"),
        _legendItem(color: Colors.orange, label: "Error Duration"),
        _legendItem(color: Colors.yellow, label: "Ideal Duration"),
      ],
    );
  }

  Widget _legendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Hourly Energy - Bar Chart
  Widget _hourlyEnergyBarChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 4, color: Colors.blue)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 7, color: Colors.green)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 3, color: Colors.orange)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 8, color: Colors.purple)]),
          ],
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  // Daywise Energy Consumption - Line Chart
  Widget _daywiseEnergyLineChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 3),
                const FlSpot(2, 2),
                const FlSpot(3, 4),
                const FlSpot(4, 3),
              ],
              isCurved: true,
              color : Colors.orange,
              barWidth: 3,
            ),
          ],
          borderData: FlBorderData(show: true),
        ),
      ),
    );
  }

  // Daywise Power Running Hour - Horizontal Bar Chart
  Widget _daywisePowerRunningBarChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 2, color: Colors.yellow)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5, color: Colors.red)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 3, color: Colors.teal)]),
          ],
          alignment: BarChartAlignment.spaceBetween,
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart'; // For charts

// class DashboardScreen2 extends StatelessWidget {
//   const DashboardScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: [
//         const Text(
//           "Energy Dashboard",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const Divider(thickness: 2, color: Colors.teal),
//         const SizedBox(height: 16),

//         // Energy Duration Card with Pie Chart and Legend
//         _dashboardCard(
//           title: "Energy Duration",
//           child: Column(
//             children: [
//               _energyDurationPieChart(),
//               const SizedBox(height: 16),
//               _energyDurationLegend(),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Other Cards (Example: Placeholder for other sections)
//         _dashboardCard(
//           title: "Hourly Energy Consumption",
//           child: const Center(child: Text("No Data Found")),
//         ),
//         const SizedBox(height: 16),
//         _dashboardCard(
//           title: "Daywise Energy Consumption",
//           child: const Center(child: Text("No Data Found")),
//         ),
//         const SizedBox(height: 16),

//         // Daywise Power Running Hour Card
//         _dashboardCard(
//           title: "Daywise Power Running Hour",
//           child: const Center(child: Text("No Data Found")),
//         ),
//         const SizedBox(height: 16),

//         // ON/OFF History Card
//         const Text(
//           "ON/OFF History",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         _dashboardCard(
//           child: const Center(child: Text("No data found")),
//         ),
//       ],
//     );
//   }

//   Widget _dashboardCard({String? title, required Widget child}) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (title != null) ...[
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//             ],
//             child,
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _energyDurationPieChart() {
//     return SizedBox(
//       height: 200,
//       child: PieChart(
//         PieChartData(
//           sections: [
//             PieChartSectionData(
//               color: Colors.blue,
//               value: 30,
//               title: '30%',
//               radius: 50,
//               titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
//             ),
//             PieChartSectionData(
//               color: Colors.teal,
//               value: 20,
//               title: '20%',
//               radius: 50,
//               titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
//             ),
//             PieChartSectionData(
//               color: Colors.orange,
//               value: 40,
//               title: '40%',
//               radius: 50,
//               titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
//             ),
//             PieChartSectionData(
//               color: Colors.yellow,
//               value: 10,
//               title: '10%',
//               radius: 50,
//               titleStyle: const TextStyle(fontSize: 12, color: Colors.black),
//             ),
//           ],
//           sectionsSpace: 2,
//           centerSpaceRadius: 30,
//         ),
//       ),
//     );
//   }

//   Widget _energyDurationLegend() {
//     return Column(
//       children: [
//         _legendItem(color: Colors.blue, label: "Active Duration"),
//         _legendItem(color: Colors.teal, label: "Idle Duration"),
//         _legendItem(color: Colors.orange, label: "Error Duration"),
//         _legendItem(color: Colors.yellow, label: "Ideal Duration"),
//       ],
//     );
//   }

//   Widget _legendItem({required Color color, required String label}) {
//     return Row(
//       children: [
//         Container(
//           width: 16,
//           height: 16,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Text(label, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart'; // For charts

// class DashboardScreen2 extends StatelessWidget {
//   const DashboardScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16.0),
//       children: [
//         const Text(
//           "Energy Dashboard",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const Divider(thickness: 2, color: Colors.teal),
//         const SizedBox(height: 16),

//         // Energy Duration Card
//         _dashboardCard(
//           title: "Energy Duration",
//           child: _energyDurationChart(),
//         ),
//         const SizedBox(height: 16),

//         // Hourly Energy Consumption Card
//         _dashboardCard(
//           title: "Hourly Energy Consumption",
//           child: const Center(child: Text("No Data Found")),
//         ),
//         const SizedBox(height: 16),

//         // Daywise Energy Consumption Card
//         _dashboardCard(
//           title: "Daywise Energy Consumption",
//           child: const Center(child: Text("No Data Found")),
//         ),
//         const SizedBox(height: 16),

//         // Daywise Power Running Hour Card
//         _dashboardCard(
//           title: "Daywise Power Running Hour",
//           child: const Center(child: Text("No Data Found")),
//         ),
//         const SizedBox(height: 16),

//         // ON/OFF History Card
//         const Text(
//           "ON/OFF History",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         _dashboardCard(
//           child: const Center(child: Text("No data found")),
//         ),
//       ],
//     );
//   }

//   Widget _dashboardCard({String? title, required Widget child}) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (title != null) ...[
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//             ],
//             child,
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _energyDurationChart() {
//     return SizedBox(
//       height: 150,
//       child: BarChart(
//         BarChartData(
//           barGroups: [
//             BarChartGroupData(
//               x: 1,
//               barRods: [
//                 BarChartRodData(toY: 10, color: Colors.blue),
//                 BarChartRodData(toY: 8, color: Colors.teal),
//                 BarChartRodData(toY: 5, color: Colors.orange),
//                 BarChartRodData(toY: 7, color: Colors.yellow),
//               ],
//             ),
//           ],
//           titlesData: const FlTitlesData(show: false),
//           borderData: FlBorderData(show: false),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class DashboardScreen2 extends StatelessWidget {
//   const DashboardScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: 9, // Number of items
//         itemBuilder: (context, index) {
//           return lastcom('Hello $index'); // Generate full-width cards dynamically
//         },
//       ),
//     );
//   }

//   Widget lastcom(String text) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8), // Vertical margin between cards
//       child: Padding(
//         padding: const EdgeInsets.all(16), // Padding inside the card
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch, // Make content stretch full-width
//           children: [
//             Text(
//               text,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text("Additional content here..."),
//           ],
//         ),
//       ),
//     );
//   }
// }
