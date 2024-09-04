import 'package:flutter/material.dart';

class ToggleCard extends StatefulWidget {
  final String title;
  // final Function func;
  const ToggleCard({
    super.key,
    required,
    required this.title,
  });
  @override
  State<ToggleCard> createState() => _ToggleCardState();
}

class _ToggleCardState extends State<ToggleCard> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 174,
        height: 120,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            // color: status?Colors.green:Colors.red,
            color: Colors.white,
            // border: Border.all(
            // color: const Color.fromARGB(255, 212, 209, 209),
            //   style: BorderStyle.solid,
            // ),
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 242, 238, 238),
                offset: Offset(-1.0, -1.0),
                blurRadius: 1,
                spreadRadius: 1.0,
              ),
            ]),
        child: Column(
          children: [
            Text(widget.title),
            const SizedBox(
              height: 1.0,
              width: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.all(1.8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Switch(
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.red,
                    activeTrackColor: const Color.fromARGB(214, 10, 246, 69),
                    value: status,
                    onChanged: (value) {
                      setState(() {
                        status = value;
                      });
                    },
                  ),
                  Positioned(
                    left: status
                        ? 10.10
                        : 30.0, // Adjust based on the thumb's position
                    child: Text(
                      status ? 'ON' : 'OFF',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 244, 241, 241),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
