import 'package:flutter/material.dart';

// void main()
// {
//   runApp(const MyApp_1());
// }


// ignore: camel_case_types
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            
          title: const Center(
            child: Text('M-POWER',textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(244, 237, 6, 6),fontSize:28),),
          ),
          actions: [
            IconButton(onPressed: (){
          },
          icon: const Icon(Icons.notification_add),
            ),
          ],
          backgroundColor: const Color.fromARGB(223, 99, 120, 224),
          ) ,
          backgroundColor:const Color.fromARGB(223, 254, 243, 67) ,
          drawer: Drawer(
            child: Container(
            color:const Color.fromARGB(224, 7, 222, 7),
              
            child: ListView(
              children: const <Widget>[
                    DrawerHeader(
                      child: Center(
                        child: Text('M-POWER',style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                    
                   Icon(Icons.account_circle, size: 30),
                  //  SizedBox(width: 10),
                   Center(
                     child: Text(
                        'Account', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                   Icon(Icons.mobile_friendly, size: 30),
                   Center(
                     child: Text(
                        'Device', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                    Icon(Icons.people),
                    Center(
                     child: Text(
                        'User', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                    Icon(Icons.note_alt),
                    Center(
                     child: Text(
                        'Report', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                   Icon(Icons.subscriptions),
                   Center(
                     child: Text(
                        'Subscription', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                   Icon(Icons.notifications_active),
                   Center(
                     child: Text(
                        'Notification settings', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                   Icon(Icons.lock_outline_rounded),
                   Center(
                     child: Text(
                        'Change passward', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
                   Icon(Icons.logout),
                    Center(
                     child: Text(
                        'Logout', // Name of the icon
                        style: TextStyle(fontSize: 25),
                       ),
                   ),
              ],
            ),
          
            )
          ),
          
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(label:'home', icon:Icon(Icons.home)),
            BottomNavigationBarItem(label:'thunder', icon:Icon(Icons.show_chart_outlined)),
          ],backgroundColor:const Color.fromARGB(122, 456, 234, 34),),
          
         ),
      ),
      );
}
}
