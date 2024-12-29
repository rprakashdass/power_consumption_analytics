import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/Reports/reading_report.dart';
import 'package:power_consumption_analytics/widgets/main_dashboard.dart';

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


    if(adminEmailctr.text =='admin123@gmail.com' && adminpasswardctr.text =='123'){
     
     
      Get.to(const MainDashboard());
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
        // print("Failed to fetch data. Status code: ${response.statusCode}");
      }
     
      update();
      // Dataviews(data_1: data);
    } catch (e) {
      print("Error: $e");
    }
  }
  testcall(){
    onInit();
    // print(data);
    Get.to(ReadingReport(data_1: data));
  }
  
}

