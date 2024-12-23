import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/Reports/Reading_report.dart';
import 'package:power_consumption_analytics/dashboard.dart';

class HomeController extends GetxController {
    TextEditingController adminEmailctr=TextEditingController();
    TextEditingController adminpasswardctr=TextEditingController();
    List<dynamic> data = [];
    @override
  void onInit() {
    fetchThingSpeakData();
    super.onInit();
  }

    allowadmintoLogin(){
    print(adminEmailctr.text);
    print(adminpasswardctr.text);
    if(adminEmailctr.text =='admin123@gmail.com' && adminpasswardctr.text =='123'){
      print("here came bro");
     
      Get.to(DashboardScreen());
    }
    else{
      Get.snackbar('Error', 'email and passward are missmatched. give the currect email and passward',colorText: Colors.red);
    }
  }

  Future<void> fetchThingSpeakData() async {
    String url =
        // "https://api.thingspeak.com/channels/$channelId/fields/$fieldNumber.json?api_key=$apiKey";
        "https://api.thingspeak.com/channels/2789078/feeds.json?api_key=R0NZU71Y3JUWX6PQ";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
          data = jsonResponse['feeds'];
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
      print('Inga paruda');
      print(data[0]['field3']);
      update();
      // Dataviews(data_1: data);
    } catch (e) {
      print("Error: $e");
    }
  }
  testcall(){
    onInit();
    print(data);
    Get.to(reading_report(data_1: data));
  }
  
}

