import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Drawer main_drawer() {
  return Drawer(
      child: Container(
    color: const Color.fromARGB(255, 1, 202, 200),
    child: ListView(
      children: const <Widget>[
        DrawerHeader(
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
          leading: Icon(
            Icons.account_circle,
            size: 30,
            color: Color.fromARGB(255, 233, 233, 221),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            size: 25,
            color: Color.fromARGB(255, 200, 236, 33),
          ),
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.mobile_friendly,
            size: 25,
            color: Color.fromARGB(255, 200, 236, 33),
          ),
          title: Text(
            'Device',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
          ),
          hoverColor: Color.fromARGB(255, 234, 241, 241),
        ),
        ListTile(
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
        ),
        ListTile(
          leading: Icon(
            Icons.note_alt,
            color: Color.fromARGB(255, 200, 236, 33),
          ),
          title: Text(
            'Report',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.subscriptions,
            color: Color.fromARGB(255, 200, 236, 33),
          ),
          title: Text(
            'Subscriptions',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.notifications_active,
            color: Color.fromARGB(255, 200, 236, 33),
          ),
          title: Text(
            'Notification settings',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.lock_outline_rounded,
            color: Color.fromARGB(255, 200, 236, 33),
          ),
          title: Text(
            'Change passward',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 250, 250, 250)),
          ),
        ),
        ListTile(
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
    ),
  ));
}
