import 'package:flutter/material.dart';

class NotiFy extends StatefulWidget {
  const NotiFy({super.key});

  @override
  State<NotiFy> createState() => _NotiFyState();
}

class _NotiFyState extends State<NotiFy> {
  bool status=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner :false,
      home: Scaffold(
        appBar:AppBar(
          backgroundColor:const Color.fromARGB( 255,1,202,199),
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
              text: 'Only the selected options trigger on alert notification on your mobile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 30.54),
      Padding(padding: EdgeInsets.all(30.9),
      child: Switch(
        activeColor: const Color.fromARGB(255, 239, 13, 13),
        value: status,
        onChanged: (value) {
          setState(() {
            status = value;
          });
        },
      ),
      )
    ],
  ),
),


                //  Text("Only the selected options triggers an alert notification on your mobile"),

      ),
    );

  }
}