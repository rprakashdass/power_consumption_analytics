// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/drawer.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  ChangePassword createState() => ChangePassword();
}

class ChangePassword extends State<PasswordChangeScreen> {
  bool visible_1 = false;
  bool visible_2 = false;
  bool visible_3 = false;
  String oldPassword = "";
  String password = "";
  String newPassword = "";
  String confirmPassword = "";

  TextEditingController tc_1 = TextEditingController();
  TextEditingController tc_2 = TextEditingController();
  TextEditingController tc_3 = TextEditingController();

  void validatePassword(
      String oldPassword, String newPassword, String confirmPassword) {
    if (oldPassword == "" || newPassword == "" || confirmPassword == "") {
      print("the password can't be empty");
    } else if (password != oldPassword) {
      print("the old password doesn't match");
    } else if (newPassword != confirmPassword) {
      print(
          "please make sure that the New password and the confirm password are same");
    } else if (oldPassword == newPassword) {
      print("Old password and new password are same");
    }
  }

  // TextField textBox(visible) {
  //   return TextField(
  //     obscureText: !visible,
  //     decoration: InputDecoration(
  //       contentPadding: const EdgeInsets.all(10),
  //       border: const OutlineInputBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(8)),
  //       ),
  //       suffixIcon: IconButton(
  //         icon:
  //             Icon(visible ? Icons.visibility : Icons.visibility_off_outlined),
  //         onPressed: () {
  //           setState(() {
  //             visible = !visible;
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }

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
        drawer: main_drawer(context),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Old Password ",
              style: TextStyle(fontSize: 18),
              // oldPassword=tc.text;
            ),
            // textBox(visible_1),
            TextField(
              controller: tc_1,
              obscureText: !visible_1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(visible_1
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      visible_1 = !visible_1;
                    });
                  },
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(8.0)),

            const Text(
              "New Password",
              style: TextStyle(fontSize: 18),
            ),
            // textBox(visible_2),
            TextField(
              obscureText: !visible_2,
              controller: tc_2,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(visible_2
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      visible_2 = !visible_2;
                    });
                  },
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(8.0)),

            const Text(
              "Confirm New Password",
              style: TextStyle(fontSize: 18),
            ),
            // textBox(visible_3),
            TextField(
              obscureText: !visible_3,
              controller: tc_3,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(visible_3
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      visible_3 = !visible_3;
                    });
                  },
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(10.0)),

            ElevatedButton(
                onPressed: () {
                  // print(tc.text);
                  oldPassword = tc_1.text;
                  newPassword = tc_2.text;
                  confirmPassword = tc_3.text;

                  validatePassword(oldPassword, newPassword, confirmPassword);
                  // tc.clear();
                },
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
