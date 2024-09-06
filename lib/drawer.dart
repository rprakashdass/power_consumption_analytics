import 'package:flutter/material.dart';
import 'package:power_consumption_analytics/Reports/Device.dart';
import 'package:power_consumption_analytics/account_file.dart';
import 'package:power_consumption_analytics/change_password.dart';
import 'package:power_consumption_analytics/dashboard.dart';
import 'package:power_consumption_analytics/notification.dart';
import 'package:power_consumption_analytics/report_menu.dart';
import 'package:power_consumption_analytics/subscription.dart';

// ignore: non_constant_identifier_names
Drawer main_drawer(BuildContext context) {
  return Drawer(
      child: Container(
          color: const Color.fromARGB(255, 1, 202, 200),
          // child: Material(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'M-POWER',
                    style: TextStyle(
                      fontSize: 33,
                      color: Color.fromARGB(255, 233, 233, 221),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Color.fromARGB(255, 233, 233, 221),
                ),
                title: const Text(
                  "Admin",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountPage()));
                },
              ),
              ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 25,
                    color: Color.fromARGB(255, 200, 236, 33),
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 250, 250, 250)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  }),

              // ),
              ListTile(
                  leading: const Icon(
                    Icons.mobile_friendly,
                    size: 25,
                    color: Color.fromARGB(255, 200, 236, 33),
                  ),
                  title: const Text(
                    'Device',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 250, 250, 250)),
                  ),
                  hoverColor: const Color.fromARGB(255, 234, 241, 241),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => device_manager()));
                  }),
              const ListTile(
                leading: Icon(
                  Icons.people,
                  size: 25,
                  color: Color.fromARGB(255, 200, 236, 33),
                ),
                title: Text(
                  'User',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
                ),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => AccountPage()));
                // }
              ),
              ListTile(
                  leading: const Icon(
                    Icons.note_alt,
                    color: Color.fromARGB(255, 200, 236, 33),
                  ),
                  title: const Text(
                    'Report',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 250, 250, 250)),
                  ),
          
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportMenu()));
                  },
                  trailing: const Icon(Icons.chevron_right_rounded,color: Colors.white,),
                  ),

              ListTile(
                  leading: const Icon(
                    Icons.subscriptions,
                    color: Color.fromARGB(255, 200, 236, 33),
                  ),
                  title: const Text(
                    'Subscriptions',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 250, 250, 250)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Subscription()));
                  }),
              ListTile(
                  leading: const Icon(
                    Icons.notifications_active,
                    color: Color.fromARGB(255, 200, 236, 33),
                  ),
                  title: const Text(
                    'Notification settings',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 250, 250, 250)),
                  ),
                  // _NotiFyState
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotiFy()));
                  }),
              ListTile(
                  leading: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color.fromARGB(255, 200, 236, 33),
                  ),
                  title: const Text(
                    'Change passward',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 250, 250, 250)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PasswordChangeScreen()));
                  }),
              const ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 200, 236, 33),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
                ),
              ),
            ],
            // ),
          )));
}
