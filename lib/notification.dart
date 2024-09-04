import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/widgets/toggle_card.dart';

class NotiFy extends StatefulWidget {
  const NotiFy({super.key});

  @override
  State<NotiFy> createState() => _NotiFyState();
}

class _NotiFyState extends State<NotiFy> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 202, 199),
          title: const Center(child: Text('Notification Settings')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Only the selected options trigger on alert notification on your mobile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ToggleCard(
                        title: 'High Voltage',
                      ),
                      ToggleCard(
                        title: 'Low Voltage',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ToggleCard(title: 'Poor Power Factor'),
                      ToggleCard(title: 'Power Failure')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ToggleCard(
                        title: 'Communication Fail',
                      ),
                      ToggleCard(
                        title: 'Negetive Consumed Value',
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),

        //  Text("Only the selected options triggers an alert notification on your mobile"),
      ),
    );
  }
}
