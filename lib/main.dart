import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_consumption_analytics/home_controller/home_controller.dart';
import 'package:power_consumption_analytics/login_page.dart';
// import 'package:power_consumption_analytics/Reports/Consumption_report.dart';
// import 'package:power_consumption_analytics/change_password.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
     
      // home: AdminLoginPage(),
      // home: DashboardScreen(),
      home: AdminLoginPage(),
    );
  }
}
