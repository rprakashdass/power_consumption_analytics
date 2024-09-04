// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/drawer.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  ChangePassword createState() => ChangePassword();
}

class ChangePassword extends State<PasswordChangeScreen> {
  bool visible = false;
  String password = "";

  void validatePasswordd(
      String oldPassword, String newPassword, String confirmPassword) {
    if (password != oldPassword) {
      print("the old password doesn't match");
    }
    if (newPassword != confirmPassword) {
      print("New password and the confirm password are different");
    }
    if (oldPassword == newPassword) {
      print("Old password and new password are same");
    }
  }

  TextField textBox() {
    return TextField(
      obscureText: !visible,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        suffixIcon: IconButton(
          icon:
              Icon(visible ? Icons.visibility : Icons.visibility_off_outlined),
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.menu, size: 35, color: Colors.white),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 35,
          ),
          title: const Text(
            'Change Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 202, 199),
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.notifications, size: 30, color: Colors.white))
          ],
        ),
        drawer: main_drawer(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Old Password ",
              style: TextStyle(fontSize: 18),
            ),
            textBox(),
            const Padding(padding: EdgeInsets.all(8.0)),
            // TextBox.fromLTRBD(2, 3, 2, 3,TextDirection.ltr),
            const Text(
              "New Password",
              style: TextStyle(fontSize: 18),
            ),
            textBox(),
            const Padding(padding: EdgeInsets.all(8.0)),

            const Text(
              "Confirm New Password",
              style: TextStyle(fontSize: 18),
            ),
            textBox(),
            const Padding(padding: EdgeInsets.all(10.0)),

            ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.only(top: 10, bottom: 10)),
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 1, 202, 199)),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ));
  }
}
