import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThingSpeakExample extends StatefulWidget {
  const ThingSpeakExample({super.key});

  @override
  _ThingSpeakExampleState createState() => _ThingSpeakExampleState();
}

class _ThingSpeakExampleState extends State<ThingSpeakExample> {
  String channelId = "2789078";
  String apiKey = "R0NZU71Y3JUWX6PQ";
  String fieldNumber = "1";
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchThingSpeakData();
  }

  Future<void> fetchThingSpeakData() async {
    String url =
        // "https://api.thingspeak.com/channels/$channelId/fields/$fieldNumber.json?api_key=$apiKey";
        "https://api.thingspeak.com/channels/2789078/fields/1.json?api_key=R0NZU71Y3JUWX6PQ";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          data = jsonResponse['feeds'];
        });
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ThingSpeak Data")),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Entry ID: ${data[index]['entry_id']}"),
                  subtitle: Text("Value: ${data[index]['field1']}"),
                );
              },
            ),
    );
  }
}