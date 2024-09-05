import 'package:flutter/material.dart';
// import 'package:power_consumption_analytics/Reports/Consumption_report.dart';
import 'package:power_consumption_analytics/change_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: unnecessary_const
      home: PasswordChangeScreen(),
    );
  }
}
